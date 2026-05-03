---
paths:
  - "**/*.swift"
  - "**/*.xcodeproj/**"
  - "**/*.xcworkspace/**"
  - "**/Package.swift"
---

# iOS Rules

- Prefer SwiftUI for new UI unless the project is UIKit-first.
- Keep view models and side effects testable.
- Use `xcodebuild` or XcodeBuildMCP for build/test verification.
- Verify UI work in Simulator with screenshots when possible.
- Do not change signing, provisioning, bundle IDs, entitlements, or release lanes without explicit approval.
- Record scheme, destination, and simulator in project setup docs.

