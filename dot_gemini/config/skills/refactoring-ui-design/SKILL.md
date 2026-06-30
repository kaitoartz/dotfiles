---
name: refactoring-ui-design
description: Expert UI design guidance based on Refactoring UI principles. Use when designing interfaces, fixing layout issues, choosing colors/fonts, or improving visual hierarchy.
---

# Refactoring UI Design

This skill acts as an expert UI design consultant, applying the principles from the "Refactoring UI" book by Adam Wathan and Steve Schoger. It helps create professional, clean, and functional interfaces by focusing on tactics over talent.

## Core Principles

### 1. Hierarchy is Everything
*   **Don't rely on size alone.** Use weight, color, and contrast to establish hierarchy.
*   **De-emphasize secondary text.** Instead of making it smaller, try a lighter color (e.g., dark gray instead of black) or a lighter font weight.
*   **Semantics imply styling.** Primary actions should be bold/high-contrast. Secondary actions should be subtle (outline or ghost buttons). Tertiary actions should be minimal (links).

### 2. Layout & Spacing
*   **Start with too much white space.** It's easier to remove space than to add it.
*   **Establish a spacing scale.** Don't pick arbitrary values. Use a geometric scale (e.g., 4, 8, 12, 16, 24, 32, 48, 64, 96px).
*   **Grids are overrated for components.** Use spacing scales for internal component padding and margins. Use grids for high-level page layout.
*   **Don't stretch everything.** If an element (like a form or text block) looks bad stretched to full width, give it a `max-width`.

### 3. Color & Contrast
*   **Design in Grayscale first.** If it doesn't work in black and white, color won't save it. Focus on spacing and contrast first.
*   **Avoid pure gray.** Saturate your grays with a bit of blue or violet for a cooler, more modern look, or yellow/orange for a warmer feel.
*   **Accessible contrast.** Ensure text meets WCAG contrast ratios.
*   **State colors.** Use standard semantic colors (Red=Error, Yellow=Warning, Green=Success) but adjust saturation and brightness to fit your palette.

### 4. Typography
*   **Limit your choices.** One font family with 3-4 weights (Regular, Medium, Bold, ExtraBold) is usually enough.
*   **Line height matters.**
    *   Headings: Tighter line height (1.1 - 1.2).
    *   Body text: Looser line height (1.5 - 1.6).
*   **Letter spacing.** Increase slightly for uppercase text. Decrease slightly for large headings.

### 5. Depth & Light
*   **Simulate light sources.** Shadows should generally fall downwards.
*   **Layering.** Use shadows to indicate elevation. Higher elevation = larger, softer shadow.
*   **Overlays.** Use subtle dark overlays on images to make text readable.

## Workflow: How to "Refactor" a UI

When asked to improve a UI, follow these steps:

1.  **Analyze Hierarchy:** Identify the most important element. Is it the most prominent? If not, increase its weight/contrast or decrease the competition.
2.  **Check Spacing:** Are elements too crowded? Apply a consistent spacing scale.
3.  **Refine Typography:** Are fonts readable? Is there enough distinction between headings and body?
4.  **Polish Details:** Add subtle borders, shadows, or rounded corners to soften the UI.
5.  **Simplify:** Remove unnecessary borders, backgrounds, or metadata. "When in doubt, take it out."

## Common Fixes

*   **"My design looks boring."** -> Add a splash of color to a key element, use a more interesting font for headings, or add a subtle pattern/illustration.
*   **"It feels cluttered."** -> Increase white space. Remove borders and replace them with background color differences or simply space.
*   **"Users don't know what to do."** -> Increase the contrast of the primary action button. Fade out secondary actions.

## References

*   **Spacing Scale:** [0, 4, 8, 12, 16, 24, 32, 48, 64, 96, 128] (px)
*   **Type Scale:** [12, 14, 16, 18, 20, 24, 30, 36, 48, 60, 72] (px)