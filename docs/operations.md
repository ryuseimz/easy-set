# Development Operations

## Daily Flow

1. Start one task per session.
2. Ask for research and plan for ambiguous work.
3. Implement with `/go`.
4. Verify with tests, build, browser, or simulator.
5. Use a separate reviewer session/subagent for review.
6. Commit and PR only after checks pass.

## Parallel Work

Use worktrees when running multiple agents on the same repo.

Good patterns:

- Writer / Reviewer
- Test Writer / Implementer
- Researcher / Implementer
- iOS QA / Code Fixer
- Design Implementation / Visual Reviewer

Avoid multiple agents editing the same files without coordination.

## Recurring Work

Turn repeated prompts into skills:

- `/go`
- `/review`
- `/ship`
- production debugging
- design-to-code
- iOS simulator QA
- release notes

Stable skills can later become automations.

