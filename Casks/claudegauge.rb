cask "claudegauge" do
  version "0.1.0"
  sha256 "e9a93e7ff407c0ff6fe53801ed923deefdb7e4bbd41ccad478dbaf3630324982"

  url "https://github.com/Bajnok11/ClaudeGauge/releases/download/v#{version}/ClaudeGauge-#{version}.dmg"
  name "ClaudeGauge"
  desc "Unofficial menu bar app and desktop widget for tracking Claude usage limits"
  homepage "https://github.com/Bajnok11/ClaudeGauge"

  depends_on macos: ">= :sonoma"

  app "ClaudeGauge.app"

  # ClaudeGauge doesn't have a paid Apple Developer Program membership yet
  # (see https://github.com/Bajnok11/ClaudeGauge/blob/main/DISTRIBUTION.md),
  # so this build is signed with a free/personal Apple ID team only — not a
  # Developer ID certificate, and not notarized. Gatekeeper rejects that
  # outright on a fresh download (verified: `spctl -a` reports "rejected"
  # even before quarantine is applied), not just a soft "unidentified
  # developer" warning a right-click can bypass. This is the same trade
  # every unnotarized personal/community cask makes; it goes away once the
  # project can afford a $99/year Developer ID certificate and this cask
  # switches to a properly notarized release.
  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/ClaudeGauge.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ClaudeGauge",
    "~/Library/Group Containers/group.dev.claudegauge.shared",
    "~/Library/Preferences/dev.claudegauge.app.plist",
  ]
end
