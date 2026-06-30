---
name: structure-project-organization
description: Analyze, plan, and restructure folder organization for scalable projects (App, Ecommerce, Game, eLearning).
---

# Project Structure & Organization

This skill helps maximize maintainability and scalability by analyzing current project structures and applying industry-standard architectural patterns.

## Recommended Usage

Use this skill when:

- Starting a new project and unsure about folder organization.
- Refactoring a chaotic codebase where files are hard to find.
- Scaling a project from MVP to a complex application.
- Integrating specific domain logic (e.g., separating game engine core vs content).

## Architectural Strategies

### 1. By Type (Layered Architecture)

**Best for:** Small projects, MVPs, proof-of-concepts.
**Concept:** Files are grouped by their technical role (e.g., components, hooks, utils).

- `src/components/`
- `src/hooks/`
- `src/utils/`
- `src/pages/`
  **Pros:** Easy to understand for beginners; quick setup.
  **Cons:** Scales poorly; files related to a feature are scattered across multiple folders.

### 2. By Type & Feature (Hybrid)

**Best for:** Medium-sized projects.
**Concept:** Top-level folders are by type, but internal organization reflects features.

- `src/components/Auth/Login.tsx`
- `src/components/Dashboard/Widget.tsx`
- `src/hooks/useAuth.ts`
  **Pros:** Better grouping than pure layered; familiar structure.
  **Cons:** Feature logic still split between `components`, `hooks`, `services`, etc.

### 3. Screaming Architecture (Feature-Based / Domain-Driven)

**Best for:** Large, complex enterprise applications.
**Concept:** The folder structure screams _what the application does_, not just what tech stack it uses. Features are self-contained modules.

- `src/features/auth/` (contains components, hooks, api, types related to auth)
- `src/features/products/`
- `src/features/cart/`
- `src/shared/ui/` (reusable generic UI components)
  **Pros:** Highly scalable; easy to delete or refactor features in isolation; encapsulates domain logic.
  **Cons:** Initial setup is more verbose; requires discipline to avoid circular dependencies.

## Domain-Specific Structures

### For Web Applications (SaaS/Dashboard)

Focus on **Features** and **Shared Core**.

- `src/app/` (Routing, App setup)
- `src/features/` (Domain modules: Users, Analytics, Settings)
- `src/shared/lib/` (Helpers, API client)
- `src/shared/ui/` (Button, Input, Modal)

### For E-commerce

Focus on **Catalog**, **Cart**, and **Checkout** flows.

- `src/modules/catalog/` (Product listing, details, search)
- `src/modules/cart/` (State management, UI)
- `src/modules/checkout/` (Payment integration, forms)
- `src/modules/user/` (Orders, addresses)

### For Games (Web/JS based)

Focus on **Engine**, **Simulations**, and **Assets**.

- `src/engine/` (Core logic: Loop, Physics, Renderer)
- `src/entities/` (Player, Enemies, Items)
- `src/systems/` (Collision, Input, Audio)
- `src/scenes/` (Menu, Level1, GameOver)
- `src/assets/` (Sprites, Sounds, Shaders)

### For eLearning / LMS

Focus on **Curriculum**, **Progress**, and **Media**.

- `src/domains/content/` (Courses, Lessons, Quizzes)
- `src/domains/progress/` (Tracking, Certificates)
- `src/domains/classroom/` (Video player, Interactive exercises)
- `src/shared/components/` (UI Kit)

## Execution Workflow

1.  **Analyze**: Run `list_dir` to understand the current state.
2.  **Propose**: Suggest a new structure based on the project type and scale.
3.  **Plan**: Create a migration plan (e.g., move `src/components/Button.tsx` to `src/shared/ui/Button/`).
4.  **Execute**: Use `git mv` ideally, or file system moves, ensuring imports are updated/checked.
5.  **Verify**: Run tests or build to ensure no regressions.
