---
name: inclusive-accessibility-design
description: Especialista en accesibilidad digital y diseño inclusivo. Úsalo para auditar interfaces, asegurar el cumplimiento de WCAG 2.1/2.2 y diseñar para la neurodiversidad y discapacidades motoras.
---

# Inclusive & Accessible Design
Este skill asegura que el producto sea utilizable por el mayor número de personas posible, basándose en los principios POUR y las normativas WCAG. La accesibilidad no es una "capa extra", es fundacional [23].

## Core Principles (POUR)

### 1. Perceivable (Perceptible)
*   **No confíes solo en el color:** Usa formas, iconos y etiquetas de texto junto con el color para comunicar estados (ej. error, éxito). Vital para el daltonismo [24, 25].
*   **Contraste Suficiente:** Asegura un ratio de contraste mínimo de 4.5:1 para texto normal y 3:1 para texto grande o componentes de UI [26, 27].
*   **Alternativas Textuales:** Todo contenido visual (imágenes, gráficos) debe tener texto alternativo (Alt Text) para lectores de pantalla [28, 29].

### 2. Operable (Operable)
*   **Navegación por Teclado:** Todo elemento interactivo debe ser accesible solo con teclado (Tab, Enter, Espacio). Evita las "trampas de teclado" en modales o menús [30, 31].
*   **Zonas de Toque (Touch Targets):** En móviles, los elementos interactivos deben medir al menos 44x44 píxeles para acomodar dedos de todos los tamaños y discapacidades motoras [32, 33].
*   **Evitar Inputs Complejos:** No exijas acciones simultáneas (multitouch) o pulsaciones rápidas repetidas (button mashing) sin ofrecer una alternativa simplificada [34, 35].

### 3. Understandable (Comprensible)
*   **Lenguaje Claro:** Usa un lenguaje simple, evita la jerga y mantén la consistencia en la terminología y los iconos [36].
*   **Estructura Predecible:** La navegación debe ser consistente entre páginas. Los elementos deben comportarse de manera previsible [37].
*   **Feedback de Errores:** Los mensajes de error deben ser descriptivos, indicar qué falló y sugerir cómo corregirlo [37].

### 4. Robust (Robusto)
*   **HTML Semántico:** Usa las etiquetas correctas (`<button>`, `<nav>`, `<main>`) en lugar de `<div>` genéricos para asegurar la compatibilidad con tecnologías de asistencia [36].
*   **Etiquetas ARIA:** Usa `aria-label` o `role` solo cuando el HTML nativo no sea suficiente, pero prioriza siempre el HTML nativo [27, 38].

## Inclusión Cognitiva y Sensorial
*   **Movimiento y Parpadeo:** Evita contenido que parpadee más de 3 veces por segundo (riesgo de convulsiones). Provee una opción para "Reducir Movimiento" (reduce motion) para usuarios con vértigo o TDAH [30, 37].
*   **Personalización:** Permite ajustar el tamaño de la fuente, el esquema de colores (Modo Oscuro/Claro) y remapear controles [39, 40].

## Workflow: Auditoría de Accesibilidad
1.  **Validación de Color:** Revisa ratios de contraste y simula daltonismo.
2.  **Prueba de Teclado/Mando:** Intenta navegar toda la interfaz sin usar el mouse. ¿Es visible el foco? ¿El orden es lógico? [28].
3.  **Prueba de Lector de Pantalla:** ¿Las imágenes tienen `alt`? ¿Los botones tienen etiquetas claras?
4.  **Cognitive Walkthrough:** ¿Es la interfaz limpia? ¿Hay demasiada información simultánea? Simplifica [41].

## Common Fixes
*   **"El texto es difícil de leer."** -> Aumenta el contraste, usa unidades relativas (`rem`/`em`) para el escalado de fuente [42].
*   **"No sé dónde estoy navegando con el teclado."** -> Añade estilos visibles de `:focus` o `focus-visible` [43].
*   **"El juego es muy rápido para mí."** -> Añade un deslizador de velocidad de juego o un modo de asistencia [44].