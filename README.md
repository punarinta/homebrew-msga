# homebrew-msga

Homebrew tap and release binaries for [msga](https://msga.app), a fast native
Slack client. Source code lives in
[make-slack-great-again](https://github.com/punarinta/make-slack-great-again).

## Install (macOS, Apple Silicon)

```sh
brew install --cask punarinta/msga/msga
```

msga is not notarized by Apple, so macOS blocks the first launch: open
System Settings → Privacy & Security and click "Open Anyway". After that the
app keeps itself up to date.

## Downloads

Every [release](https://github.com/punarinta/homebrew-msga/releases) carries
the macOS DMG, the Linux x86_64 binary and the Windows x86_64 executable, each
with a `.manifest` holding its version and SHA-256.
