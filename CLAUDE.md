# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Homebrew third-party tap (`p-linnane/homebrew-tap`) containing cask definitions for software that doesn't meet the requirements for inclusion in `homebrew-cask`. All packages are casks (no formulae).

## Repository Structure

- `Casks/` — Homebrew cask Ruby files (the only code in this repo)
- `.github/workflows/` — CI (audit, fetch, install tests) and autobump automation

## Common Commands

```bash
# Audit a cask for style and correctness
brew audit --cask --online --strict Casks/macosdb.rb

# Check tap syntax
brew test-bot --only-tap-syntax

# Install a cask from local path
brew install --cask Casks/macosdb.rb

# Check for outdated casks via livecheck
brew livecheck --tap p-linnane/homebrew-tap

# Bump a cask version (creates PR automatically)
brew bump --no-fork --open-pr --cask <cask-token>
```

## Cask Conventions

- Casks that require bypassing Gatekeeper (unsigned apps) include a `caveats` block noting this.
- Some casks use `depends_on arch: :arm64` and/or `depends_on macos:` constraints.
- `zap` stanzas list all known application data paths for clean removal.
- `livecheck` blocks are used where upstream provides consistent release URLs (e.g., `apple-container`).

## CI

PRs trigger `brew generate-cask-ci-matrix` which audits, fetches, and optionally installs each changed cask. Push to `main` runs syntax-only checks. The autobump workflow runs every 2 hours to check for new upstream releases.

## Commit Conventions

Conventional Commits format: `type(scope): description`

Common types: `feat`, `fix`, `refactor`, `docs`, `ci`, `chore`

All commits must:
- Use `git commit -s` for DCO sign-off
- Include a `Co-authored-by: Claude Opus 4.6 <noreply@anthropic.com>` trailer when authored with Claude

## Git Workflow

- Never commit directly to main — always create a feature branch and open a PR
- PRs are squash-merged with the PR number appended

## PR Conventions

- PR descriptions should contain only a summary of the changes — no test plan sections, no bot attribution, no "Generated with Claude Code" footers
