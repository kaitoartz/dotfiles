---
name: technical-ui-implementation
description: Arquitecto técnico de UI especializado en la elección y optimización de tecnologías de renderizado (DOM vs. Canvas) y animación (Rive, CSS, JS). Optimiza rendimiento y flujos de trabajo.
---

# Technical UI Implementation Strategy
Este skill guía la decisión técnica sobre cómo construir una interfaz. ¿Debe ser HTML/CSS estándar? ¿O dibujada en un Canvas? ¿Cómo animarla? Se basa en rendimiento, accesibilidad y necesidades de diseño [59, 60].

## Decision Framework: DOM vs. Canvas

### 1. Cuándo usar DOM (Retained Mode)
El navegador gestiona el estado y el redibujado. Ideal para UIs funcionales y menús de juegos [61, 62].
*   **Pros:** Accesibilidad nativa (lectores de pantalla), manejo de eventos "gratis" (clicks, hovers), estilo flexible con CSS, texto nítido [60, 63].
*   **Contras:** Alto consumo de memoria si hay miles de elementos. Lento para animar muchas cosas simultáneamente (DOM thrashing) [64, 65].
*   **Uso Ideal:** Menús principales, inventarios, formularios, árboles de habilidades, HUDs estáticos [66, 67].

### 2. Cuándo usar Canvas (Immediate Mode)
Tú dibujas cada píxel en cada frame. Ideal para gameplay y gráficos intensivos [68, 69].
*   **Pros:** Rendimiento extremo (60FPS+ con miles de objetos), control píxel a píxel, renderizado por GPU (WebGL) [70, 71].
*   **Contras:** No hay accesibilidad nativa (debes construirla), sin eventos de mouse nativos (debes calcular x/y), el texto puede verse borroso al escalar [72, 73].
*   **Uso Ideal:** El mundo del juego, sistemas de partículas, visualizaciones de datos complejas en tiempo real [74, 75].

### 3. El Enfoque Híbrido
La mejor práctica moderna para juegos web es superponer capas:
1.  **Capa Fondo:** Canvas/WebGL para el juego (Rendimiento).
2.  **Capa Superior:** DOM/HTML para la UI (Accesibilidad y nitidez del texto) [76, 77].

## Animación Interactiva: La Revolución Rive
Para animaciones complejas que reaccionan al usuario (personajes, botones animados, barras de progreso vivas), Rive es el estándar moderno frente a Lottie o video [78].
*   **State Machines:** Permite lógica visual dentro de la animación (ej. "si salud < 50%, activar animación de temblor") sin código complejo [79].
*   **Rendimiento:** Archivos minúsculos y renderizado vectorial en tiempo real, mucho más rápido que Lottie o video [80].
*   **Integración:** Se conecta directamente con el código del juego/app para reaccionar a variables en tiempo real [81].

## Workflow: Selección de Stack
1.  **Analizar Requisitos:** ¿Necesita accesibilidad de texto? -> **DOM**. ¿Necesita 5000 partículas? -> **Canvas**.
2.  **Estrategia de Animación:** ¿Transiciones simples? -> **CSS**. ¿Personaje interactivo en UI? -> **Rive**.
3.  **Optimización:**
    *   En DOM: Usa `transform` y `opacity` para animar (evita `top`/`left` para no repintar el layout) [82].
    *   En Canvas: Usa "Object Pooling" para reutilizar objetos y no saturar el Garbage Collector [83].

## Common Fixes
*   **"La animación va lenta en móvil."** -> Si es DOM, ¿estás animando propiedades que causan *reflow*? Pásalo a Canvas o usa GPU-accelerated CSS [84, 85].
*   **"El texto se ve borroso en el juego."** -> Si está en Canvas, considera mover el texto a una capa DOM superpuesta [67].
*   **"Lottie es muy pesado/lento."** -> Migra a Rive para usar su State Machine y reducir el tamaño del archivo y uso de CPU [79].