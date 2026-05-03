---
name: go
description: End-to-end implementation loop for a scoped task: implement, verify, simplify, review, and prepare a PR summary.
---

# Go Skill

Use this when the user says `/go`, "進めて", "実装して", or asks to complete an already planned task.

## Workflow

1. Confirm the current goal and completion criteria.
2. Inspect relevant files.
3. Implement a small coherent change.
4. Run the narrowest verification.
5. Fix failures.
6. Simplify the implementation without changing behavior.
7. Run final checks.
8. Review the diff for bugs and risks.
9. Prepare a concise handoff with changed files, validation, and residual risk.

## Rules

- Do not expand scope without saying why.
- Do not weaken tests or validation to pass.
- Do not push, deploy, release, or merge unless explicitly asked.

