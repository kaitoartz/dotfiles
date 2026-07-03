---
name: pptx
description: >
  Use this skill any time a .pptx file is involved in any way — as input, output, or both. 
  This includes: creating slide decks, pitch decks, or presentations; reading, parsing, 
  or extracting text from any .pptx file; editing, modifying, or updating existing 
  presentations; combining or splitting slide files; working with templates, layouts, 
  speaker notes, or comments. Trigger whenever the user mentions "deck," "slides," 
  "presentation," or references a .pptx filename.
---

# PowerPoint (pptx) Skill

## Overview
This skill enables the creation, editing, and analysis of PowerPoint (.pptx) files. It follows specialized workflows to ensure high-quality visual output and structural integrity.

## Core Workflows

### 1. Reading and Analyzing Content
- **Text Extraction**: Use `python -m markitdown presentation.pptx` to extract text and structure.
- **Visual Overview**: When possible, generate thumbnails or descriptions of slide layouts.
- **Structural Analysis**: Unpack the .pptx file (which is a ZIP container) to inspect raw XML for complex queries.

### 2. Editing Existing Presentations
Surgical XML editing is preferred for modifying existing decks:
- **Unpack**: Extract the .pptx content.
- **Manipulate Structure**: Edit `ppt/presentation.xml` to reorder or delete slides.
- **Edit Content**: Modify text or placeholders within `ppt/slides/slide{N}.xml`.
- **Pack**: Reassemble the directory into a valid .pptx file.

### 3. Creating from Scratch
When generating new presentations programmatically:
- **Library**: Use `PptxGenJS` (Node.js) as the primary engine.
- **Color Rules**: Avoid 8-character hex codes (RRGGBBAA). Use the `opacity` property instead.
- **Object Management**: Do not reuse option objects; always create new ones for each shape or text call to avoid mutation side-effects.

## Design Principles
- **No Text-Only Slides**: Every slide must contain a visual element (image, icon, chart, or stylized shape).
- **Color Palette**: Use a bold, content-informed palette. One dominant color should cover 60-70% of the theme.
- **Visual Hierarchy**: 
  - Use high-contrast "sandwich" structures (dark backgrounds for titles/conclusions, light for body content).
  - Maintain clear typographic hierarchy between headers and body text.
- **Layout Variety**: Prefer multi-column grids and half-bleed image layouts over simple bulleted lists.

## Tools and References
- **markitdown**: Primary tool for extraction.
- **PptxGenJS**: Primary library for generation.
- **XML/Surgical Editing**: Method for precise modifications.
