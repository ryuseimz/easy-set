# Design Workflow

Design-to-code quality depends on context and verification.

## Recommended Tools

- Figma MCP
- Figma Code Connect
- design tokens
- Playwright screenshots
- Browser or Simulator QA
- image/screenshot references

## Prompt Template

```text
この Figma node を実装してください。

Goal:
- 既存の design system と components を優先
- 新規 component は必要最小限
- responsive / accessibility / loading / empty / error states を含める

Steps:
1. Figma MCP で node の構造、variables、components、画像、テキストを取得
2. 既存コードから類似 UI と tokens を探す
3. 実装計画を出す
4. 実装する
5. Playwright または Simulator で screenshot を撮る
6. Figma と差分を比較する
7. 余白、typography、state、responsive を修正する
8. lint / typecheck / test を実行する
```

## Method

1. Information architecture
2. User flow
3. State inventory
4. Component inventory
5. Token mapping
6. Implementation
7. Visual QA
8. Accessibility QA

## Design Review Checklist

- Does it use existing tokens?
- Does it use existing components?
- Does layout hold at mobile and desktop sizes?
- Does text fit?
- Are interactive states present?
- Are empty/loading/error states present?
- Are labels and focus states accessible?
- Does final screenshot match design intent?

