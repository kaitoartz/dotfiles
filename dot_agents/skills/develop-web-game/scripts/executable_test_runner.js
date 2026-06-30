const { chromium } = require('playwright');
const fs = require('fs');
const path = require('path');

// Parsear Argumentos
const args = process.argv.slice(2);
const getUrlArg = (name) => {
  const index = args.indexOf(name);
  return index !== -1 ? args[index + 1] : null;
};

const URL = getUrlArg('--url') || 'http://localhost:5173';
const ACTIONS_FILE = getUrlArg('--actions-file');
const ACTIONS_JSON_STR = getUrlArg('--actions-json');
const ITERATIONS = parseInt(getUrlArg('--iterations') || '1', 10);
const PAUSE_MS = parseInt(getUrlArg('--pause-ms') || '100', 10);

// Directorio de capturas relativo al sitio donde se ejecuta el comando (el proyecto del usuario)
const SCREENSHOT_DIR = path.join(process.cwd(), '.agents_output', 'screenshots');

// Asegurar que existe el directorio de capturas
if (!fs.existsSync(SCREENSHOT_DIR)) fs.mkdirSync(SCREENSHOT_DIR, { recursive: true });

async function run() {
  console.log(`🚀 Iniciando cliente de pruebas para ${URL}`);
  
  let actions = [];
  if (ACTIONS_JSON_STR) {
    try { actions = JSON.parse(ACTIONS_JSON_STR); } catch (e) { console.error("JSON Inválido"); process.exit(1); }
  } else if (ACTIONS_FILE && fs.existsSync(ACTIONS_FILE)) {
    const content = fs.readFileSync(ACTIONS_FILE, 'utf-8');
    actions = JSON.parse(content);
  } else {
    console.warn("⚠️ No se proveyeron acciones, usando secuencia de espera por defecto.");
    actions = { steps: [{ buttons: [], frames: 10 }] };
  }

  const browser = await chromium.launch({ headless: true }); // setear false para depurar visualmente
  const context = await browser.newContext({ viewport: { width: 800, height: 600 } });
  const page = await context.newPage();

  // Capturar errores de consola
  page.on('console', msg => {
    if (msg.type() === 'error') console.error(`🔴 Consola del Navegador: ${msg.text()}`);
  });

  try {
    await page.goto(URL);
  } catch (e) {
    console.error(`❌ Error al cargar la URL: ${URL}. Asegúrate que tu servidor local está corriendo.`);
    process.exit(1);
  }
  
  // Esperar carga inicial
  await page.waitForTimeout(500);

  for (let i = 0; i < ITERATIONS; i++) {
    console.log(`\n📸 Iteración ${i + 1}/${ITERATIONS}`);

    for (const step of actions.steps) {
      // Aplicar Inputs
      if (step.buttons) {
        for (const btn of step.buttons) {
           await page.keyboard.down(btn);
        }
      }
      if (step.mouse_x !== undefined) {
        await page.mouse.move(step.mouse_x, step.mouse_y);
        if (step.buttons && step.buttons.includes('left_mouse_button')) await page.mouse.down();
      }

      // Avanzar Tiempo
      const frames = step.frames || 1;
      const timeToAdvance = frames * (1000 / 60); // Asumiendo 60fps
      
      // Llamar a window.advanceTime si existe, si no, esperar tiempo real
      const hasTimeHook = await page.evaluate(() => typeof window.advanceTime === 'function');
      
      if (hasTimeHook) {
        await page.evaluate((ms) => window.advanceTime(ms), timeToAdvance);
      } else {
        console.log("⏱️  Hook advanceTime no encontrado, usando espera real.");
        await page.waitForTimeout(timeToAdvance);
      }

      // Soltar Inputs
      if (step.buttons) {
        for (const btn of step.buttons) await page.keyboard.up(btn);
      }
      if (step.buttons && step.buttons.includes('left_mouse_button')) await page.mouse.up();
    }

    // --- CAPTURAR ARTEFACTOS ---
    
    // 1. Captura de pantalla
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    const screenshotPath = path.join(SCREENSHOT_DIR, `game-state-${timestamp}.png`);
    await page.screenshot({ path: screenshotPath });
    console.log(`📸 Captura guardada: ${screenshotPath}`);

    // 2. Estado de Texto
    const textState = await page.evaluate(() => {
      if (typeof window.render_game_to_text === 'function') {
        return window.render_game_to_text();
      }
      return JSON.stringify({ error: "render_game_to_text no definido" });
    });
    console.log("📝 Estado del Juego (JSON):");
    console.log(textState);
  }

  await browser.close();
  console.log("\n✅ Ejecución de prueba completada.");
}

run().catch(err => {
  console.error(err);
  process.exit(1);
});
