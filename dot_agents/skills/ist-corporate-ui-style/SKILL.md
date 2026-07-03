---
name: ist-corporate-ui-style
description: Especialista en diseño de interfaces institucionales enfocado en Seguridad, Salud Laboral y Prevención (Estilo IST). Úsalo para crear dashboards corporativos, portales de mutualidades y sistemas de gestión de riesgos.
---

# IST Style UI & UX Strategy
Este skill define un lenguaje de diseño institucional que prioriza la **confianza**, la **prevención** y la **accesibilidad rápida** a servicios críticos. Se basa en la estructura de información del Instituto de Seguridad del Trabajo (IST), equilibrando la calidez del "Cuidado" con la seriedad del "Cumplimiento Legal".

## 1. Identidad Visual y Paleta de Colores
La estética se fundamenta en la psicología de la seguridad laboral y la salud.

### Paleta Primaria (Safety & Trust)
*   **IST Green (#008F4C - Aproximado):** Color primario dominante. Úsalo en barras de navegación, botones de acción principales (CTAs) y encabezados de sección. Representa seguridad, esperanza y crecimiento.
*   **Medical White (#FFFFFF):** Fondo predominante para asegurar máxima legibilidad y sensación de higiene/salud.
*   **Dark Grey (#333333):** Para tipografía principal. Evita el negro puro (#000000) para reducir la fatiga visual en documentos largos (Leyes y Decretos).

### Paleta Funcional (Action & Alert)
*   **Urgency Red (#D32F2F):** USO EXCLUSIVO para emergencias. Reservado para el banner de "Urgencias Médicas: 800 204 000" y alertas de accidentes graves.
*   **Hyperlink Blue (#0056b3):** Para enlaces de texto, descargas de formularios (DIAT/DIEP) y navegación secundaria.
*   **Warning Yellow (#FBC02D):** Para alertas preventivas (ej. "Precaución Rayos UV", "Incendios Forestales").

## 2. Enfoque de UX: "Emergencia vs. Gestión"
El sitio del IST tiene una dualidad funcional que la UI debe resolver mediante jerarquía visual.

### Nivel 1: Respuesta Inmediata (Header/Sticky)
La información crítica no puede estar oculta en menús.
*   **Componente "Línea de Vida":** Una barra superior fija y contrastada (Rojo o Verde Oscuro) con el teléfono de emergencias y ubicación de centros de salud.
*   **Acceso Rápido "Qué hacer sí...":** Botones grandes y claros para "Qué hacer en caso de accidente". No uses iconos abstractos aquí; usa texto claro + icono literal (ambulancia/cruz).

### Nivel 2: Gestión y Prevención (Body)
Para usuarios recurrentes (Adherentes/Comités Paritarios).
*   **Grid de Servicios:** Tarjetas (Cards) para "Capacitación", "Protocolos", y "Biblioteca Legal". Usa sombras suaves (`box-shadow`) para dar elevación al pasar el mouse (hover).
*   **Accesibilidad de Documentos:** Los formularios (DIAT, DIEP) y certificados deben estar listados con iconos claros de descarga (PDF/DOC) y peso del archivo.

## 3. Principios de Diseño (Aplicando Skills Previos)

### Accesibilidad (WCAG 2.1 AA)
Dado que es un servicio de salud pública y seguridad:
*   **Tamaño de Fuente:** Base de 16px escalable. Títulos claros.
*   **Contraste:** El texto blanco sobre fondo verde IST debe verificarse para cumplir el ratio 4.5:1.
*   **Lenguaje Claro:** Evitar tecnicismos médicos en los títulos de navegación principal. Usar "Licencias Médicas" en lugar de códigos internos.

### Responsividad (Mobile First)
Un prevencionista o un trabajador accidentado accederá desde un celular en terreno.
*   **Botones Táctiles:** Áreas de contacto de mínimo 48px de altura para dedos (especialmente en situaciones de estrés/emergencia).
*   **Menús Colapsables:** La inmensa biblioteca de protocolos (TMERT, PREXOR, MMC) debe usar acordeones (`<details>`) en móvil para no hacer scroll infinito.

## 4. Componentes Clave (Implementation Specs)

### A. El "Hub" de Prevención
Diseña un dashboard central para empresas que muestre:
1.  **Estado de Cumplimiento:** Gráficos de dona simples (Verde/Rojo) para protocolos activos.
2.  **Accesos Directos:** "Denuncia de Accidente" (Destacado).
3.  **Feed de Noticias:** Actualizaciones sobre campañas (ej. "Campaña Invierno", "Vacunación").

### B. Navegación "Mega-Menu"
Debido a la gran cantidad de subtemas (Prevención, Capacitación, Legal, Comunidad):
*   Usa un menú desplegable amplio en escritorio que categorice los enlaces.
*   **Agrupación Semántica:** Agrupa por intención del usuario ("Quiero capacitarme", "Quiero denunciar", "Quiero leer la ley").

## Workflow: Creación de Pantalla Tipo IST
1.  **Header:** Logo IST izquierda + Barra de Emergencia derecha (Destacada).
2.  **Hero Section:** Imagen rotativa de trabajadores/seguridad (Humanizar la marca) + CTA claro ("Ingreso Adherentes").
3.  **Body:** Grid de 3 columnas (Escritorio) / 1 columna (Móvil) con accesos a "Capacitación", "Protocolos" y "Documentos".
4.  **Footer:** Información legal, dirección (Viña del Mar), y sellos de certificación.

## Common Fixes
*   **"El sitio parece un repositorio de PDFs."** -> Convierte los enlaces de descarga en "Tarjetas de Recursos" con breves descripciones de para qué sirve cada protocolo.
*   **"No encuentro el teléfono de ambulancia."** -> Sácalo del footer. Ponlo en el header, sticky, con un icono de teléfono vibrante.
*   **"Es muy aburrido/corporativo."** -> Usa fotografías reales de personas (Comunidad Paritaria) en lugar de vectores genéricos para generar empatía y cercanía.