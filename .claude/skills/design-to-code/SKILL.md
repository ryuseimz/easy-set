---
name: design-to-code
description: Convert Figma nodes, screenshots, or product design briefs into production UI with responsive states and visual verification.
---

# Design To Code

Use when implementing UI from Figma, screenshots, mockups, or product design requirements.

## Inputs

- Figma URL or node ID
- target route/component
- framework and styling system
- required states
- viewport sizes

## Workflow

1. Fetch design context with Figma MCP when available.
2. Identify existing components, tokens, typography, spacing, and icons.
3. Create an implementation plan.
4. Implement using existing project patterns.
5. Verify in browser or simulator.
6. Capture screenshots.
7. Compare against the source design.
8. Fix visible differences.
9. Run lint/typecheck/tests.

## Quality Bar

- Mobile and desktop layouts work.
- Text does not overflow.
- Loading, empty, error, disabled, hover, and focus states are handled where relevant.
- Accessibility labels and keyboard behavior are included.

