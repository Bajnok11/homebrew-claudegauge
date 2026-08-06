# homebrew-claudegauge

Homebrew tap for [ClaudeGauge](https://github.com/Bajnok11/ClaudeGauge) — a native macOS menu bar app and WidgetKit widget for tracking Claude usage limits. Unofficial, not affiliated with Anthropic.

## Install

```bash
brew tap Bajnok11/claudegauge
brew install --cask claudegauge
```

## Heads up: not notarized yet

ClaudeGauge doesn't have a paid Apple Developer Program membership yet, so this cask installs an unsigned/personal-team build — not notarized. This cask's `postflight` step removes the Gatekeeper quarantine flag automatically after install so `brew install --cask claudegauge` just works, instead of you having to manually click through **System Settings → Privacy & Security → Open Anyway**.

If that trade-off doesn't sit right with you, the [main repo](https://github.com/Bajnok11/ClaudeGauge) has full build-from-source instructions, and [DISTRIBUTION.md](https://github.com/Bajnok11/ClaudeGauge/blob/main/DISTRIBUTION.md) has the plan for a properly notarized release once the project has a paid Developer ID certificate — at which point this tap switches over.

## Updating the cask for a new release

1. Build and tag a new ClaudeGauge release (`Scripts/build-dmg.sh` in the main repo, then `gh release create`).
2. Update `version` and `sha256` in `Casks/claudegauge.rb` (`shasum -a 256 ClaudeGauge-X.Y.Z.dmg`).
3. Commit and push.

## License

MIT — see [LICENSE](LICENSE).
