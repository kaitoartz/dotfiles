# Ciclo de Desarrollo Universal para Juegos Web

Usa este flujo de trabajo cuando construyas o iteres sobre un juego web (HTML/JS). Este flujo fuerza un ciclo estricto de desarrollo + pruebas: implementa cambios pequeños, ejecuta el script de pruebas automatizado con ráfagas cortas de inputs, inspecciona los artefactos y corrige regresiones.

## Configuración

Las herramientas están ubicadas en rutas globales:

- Cliente de Pruebas: `{{ .chezmoi.homeDir }}/.agents/skills/develop-web-game/scripts/test_runner.js`
- Ejemplos de Acciones: `{{ .chezmoi.homeDir }}/.agents/skills/develop-web-game/references/example_actions.json`

Asegúrate de que estás en la raíz de tu proyecto web al ejecutar comandos.

## Flujo de Trabajo

1. **Elige una meta.** Define una única funcionalidad.
2. **Implementa en pequeño.** Codifica el cambio viable más pequeño.
3. **Asegura los puntos de integración.** Tu juego DEBE exponer:
   - Un único elemento `<canvas>`.
   - `window.render_game_to_text()` (debe devolver un string JSON del estado).
   - `window.advanceTime(ms)` (bucle de actualización determinista).
4. **Ejecuta el Script de Pruebas.** Ejecuta el runner usando node.
   - Siempre inspecciona la última captura de pantalla y la salida de `render_game_to_text` (JSON del estado).
   - No procedas si lo visual no coincide con las expectativas.

## Ejecutando Pruebas

Usa el cliente de pruebas para simular inputs.

**Comando:**

```bash
node "{{ .chezmoi.homeDir }}/.agents/skills/develop-web-game/scripts/test_runner.js" --url http://localhost:5173 --actions-file "{{ .chezmoi.homeDir }}/.agents/skills/develop-web-game/references/example_actions.json" --iterations 1 --pause-ms 100
```

**Ejemplo con Acciones en Línea:**

```bash
node "{{ .chezmoi.homeDir }}/.agents/skills/develop-web-game/scripts/test_runner.js" --url http://localhost:5173 --actions-json '{"steps":[{"buttons":["ArrowUp"],"frames":10}]}' --iterations 1
```

## Requisitos de Salida de Estado (`render_game_to_text`)

La función debe devolver un string JSON. Mantenlo conciso pero suficiente para jugar el juego "a ciegas".

**Campos Requeridos:**

- `mode`: estado actual del juego (menu, playing, gameover).
- `player`: posición `{x, y}`.
- `entities`: lista de objetos visibles `{x, y, type}`.
- `score` / `health`.

**Ejemplo:**

```js
window.render_game_to_text = () =>
  JSON.stringify({
    mode: state.mode,
    player: { x: Math.round(state.player.x), y: Math.round(state.player.y) },
    entities: state.enemies.map((e) => ({ id: e.id, x: e.x, y: e.y })),
    score: state.score,
  });
```

## Avance de Tiempo (`advanceTime`)

Permite al agente adelantar la lógica rápidamente.

**Ejemplo:**

```js
window.advanceTime = (ms) => {
  const frames = Math.ceil(ms / (1000 / 60));
  for (let i = 0; i < frames; i++) update(1 / 60);
  draw();
};
```

## Reglas de Verificación

1. **Inspección Visual:** Debes mirar la captura de pantalla generada. Si el juego está en blanco o con glitches, corrige el código, no asumas éxito.
2. **Errores de Consola:** Corrige errores inmediatamente antes de añadir nuevas funcionalidades.
3. **Verificación de Inputs:** Prueba todos los controles definidos en la solicitud (saltar, disparar, mover).
