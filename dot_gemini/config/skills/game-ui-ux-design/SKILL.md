---
name: game-ui-ux-design
description: Consultor experto en Experiencia de Usuario (UX) e Interfaz (UI) para videojuegos. Úsalo para diseñar HUDs, menús, onboarding de jugadores y sistemas de feedback inmersivo.
---

# Game UX & UI Design strategy
Este skill aplica principios de psicología del jugador y diseño de interfaces ludificadas. A diferencia del software tradicional que busca la eficiencia, este skill busca el "Flow", la inmersión y el equilibrio entre desafío y habilidad.

## Principios Fundamentales

### 1. El Paradigma: "Gastar Tiempo" vs "Ahorrar Tiempo"
*   **Fricción Intencional:** En aplicaciones, la fricción es un error; en juegos, es la fuente de la diversión. Diseña obstáculos voluntarios y equilibrados [1].
*   **Estado de Flow:** El objetivo es mantener al jugador en el canal entre el aburrimiento (muy fácil) y la ansiedad (muy difícil) mediante el ajuste dinámico de la dificultad y objetivos claros [2, 3].
*   **Mentalidad del Jugador:** No diseñes para completar una tarea administrativa, diseña para la maestría y la retención [4].

### 2. Tipología de Interfaces (El Modelo Diegético)
No te limites a pegar elementos 2D en la pantalla. Clasifica y diseña la UI según su relación con el mundo del juego [5, 6]:
*   **No-Diegética:** HUD tradicional (barras de vida, munición flotante). Útil pero rompe la inmersión.
*   **Diegética:** Elementos que existen dentro del mundo y el personaje ve (ej. el Pip-Boy en Fallout, pantallas en cabinas).
*   **Meta:** Parte de la narrativa visual pero no física (ej. sangre en la pantalla para indicar daño) [7].
*   **Espacial:** Elementos en el mundo 3D que el personaje no ve, pero el jugador sí (ej. líneas de carrera en Forza, marcadores de misión flotantes) [8].

### 3. Feedback y "Juice" (Jugosidad)
*   **Respuesta Inmediata:** Cada acción (saltar, disparar, clicar) debe tener una respuesta visual, auditiva o háptica instantánea. Sin esto, el juego se siente "muerto" [2, 9].
*   **Micro-interacciones:** Usa animaciones exageradas, sacudidas de pantalla (screen shake) y partículas para dar peso a las acciones [10, 11].
*   **Claridad sobre Realismo:** En juegos competitivos (como shooters), prioriza la legibilidad visual (hit markers, siluetas) sobre la fidelidad gráfica realista [12, 13].

### 4. Onboarding Invisible
*   **Aprender Jugando:** Evita los muros de texto. Enseña mecánicas de forma progresiva mediante el diseño de niveles y el contexto, no con manuales [14, 15].
*   **Carga Cognitiva:** No abrumes al jugador con todas las opciones al inicio. Usa la "divulgación progresiva" (progressive disclosure) para desbloquear complejidad a medida que el jugador domina las bases [16, 17].

## Workflow: Cómo diseñar una pantalla de juego
1.  **Definir el Objetivo del Jugador:** ¿Qué necesita saber el jugador *ahora mismo*? (Salud, munición, ubicación). Oculta todo lo demás [18].
2.  **Elegir el Tipo de UI:** ¿Debe ser inmersivo (Diegético/Meta) o informativo claro (No-Diegético)?
3.  **Diseñar el Feedback:** ¿Cómo sabe el jugador si tuvo éxito o fracasó? Diseña los estados de "victoria" y "derrota" visuales.
4.  **Simplificar (Reducción de HUD):** ¿Puede un elemento de la UI ser reemplazado por una pista ambiental (ej. iluminación, sonido)? [19].

## Common Fixes
*   **"El juego se siente plano."** -> Añade "Juice": partículas al impactar, animaciones de retroceso, sonidos de confirmación [20].
*   **"Los jugadores se pierden."** -> Implementa UI Espacial (marcadores en el mundo) o pistas ambientales (iluminación, caminos desgastados) [21].
*   **"La UI es intrusiva."** -> Hazla contextual. Oculta la barra de vida cuando la salud está al 100% o el inventario cuando no se usa [22].