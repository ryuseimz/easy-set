---
name: ios-simulator-qa
description: Build, launch, navigate, screenshot, and verify iOS app flows using xcodebuild, Simulator, or XcodeBuildMCP.
---

# iOS Simulator QA

Use for SwiftUI/UIKit verification, visual QA, and bug reproduction.

## Workflow

1. Identify workspace/project, scheme, destination, and target simulator.
2. Build with `xcodebuild` or XcodeBuildMCP.
3. Run tests if available.
4. Launch in Simulator.
5. Navigate the target flow.
6. Capture screenshots and logs.
7. Compare against expected behavior or design.
8. Report failures with reproduction steps.

## Guardrails

- Do not change signing, entitlements, provisioning, bundle IDs, or release lanes without approval.
- Prefer simulator/dev builds for agent verification.

