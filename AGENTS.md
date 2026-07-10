# Agent Instructions for p-linnane/homebrew-tap

Most importantly, run the narrowest relevant Homebrew verification before
finishing any change. For cask edits, start with
`brew audit --online --strict p-linnane/tap/<token>`; for repository-wide syntax
changes, run `brew test-bot --tap p-linnane/tap --only-tap-syntax`.

## Project overview

This is a personal Homebrew third-party tap for software that does not fit the
main Homebrew repositories. It is a cask-only tap: do not add Formula files or
formula-specific workflows here.

Unlike Homebrew/brew, this repository does not vendor its own `brew` command.
Use the active Homebrew installation on `PATH` unless the task specifically
requires another Homebrew checkout.

Current Homebrew audits casks by token rather than by local file path. Before
trusting token-based checks, verify that `brew --repo p-linnane/tap` points at
the checkout you are editing; otherwise the command audits the installed tap
checkout, not this working tree.

## Required checks

Before committing cask changes:

- Run `brew audit --online --strict p-linnane/tap/<token>` for each changed cask.
- Run `brew fetch --retry --force p-linnane/tap/<token>` when a URL, version, or
  checksum changes.
- Run `brew install Casks/<token>.rb` when the artifact layout, `app`, `binary`,
  completions, dependencies, or `zap` behavior changes.
- Run `brew uninstall --force --zap Casks/<token>.rb` after install tests when
  the cask includes `zap` entries.
- Run `brew test-bot --only-tap-syntax` for repository-wide syntax coverage.

Before committing workflow changes:

- Run `zizmor .` when available.
- Run `pinprick audit .` when workflow permissions, action pins, or runner
  behavior changes.

Before committing README link changes:

- Run `just lychee`.

## Repository structure

- `Casks/`: Homebrew cask Ruby files. This is the only package definition
  directory in this tap.
- `.github/workflows/`: CI, autobump automation, workflow security checks, and
  cask audit/fetch/install tests.
- `lychee.toml`: README link-check configuration.
- `README.md`: user-facing tap overview and cask list.

## Project-specific notes

### Cask guidelines

1. Keep every package as a cask. Do not introduce formulae.
2. Prefer immutable GitHub release URLs with explicit versions and SHA-256
   checksums. Do not use mutable `latest` URLs or `sha256 :no_check`.
3. Keep architecture and OS selectors explicit when upstream ships different
   artifacts per platform.
4. For GUI apps, include `app`, accurate `depends_on` constraints, and a
   complete `zap` stanza for known application state.
5. For CLI artifacts, include `binary` and generated shell completions when
   upstream supports them.
6. Keep `desc` values short, user-facing, and aligned with upstream project
   descriptions.
7. Add or update `livecheck` blocks only when upstream has stable release URLs
   that Homebrew cannot infer reliably.
8. Update `README.md` whenever casks are added, removed, renamed, or materially
   repositioned.

### Workflow guidelines

1. Pin third-party GitHub Actions to full commit SHAs. Keep the upstream version
   comment next to the pin when practical.
2. Use least-privilege `permissions`; prefer top-level `permissions: {}` plus
   job-level grants.
3. Use `persist-credentials: false` for checkout steps unless a later step must
   push with the checkout token.
4. Keep shell steps in `bash` with `set -euo pipefail` semantics, either through
   workflow defaults or inside multi-line scripts.
5. Do not enable xtrace in steps that handle secrets or app tokens.
6. Quote shell variables and pass untrusted GitHub context through environment
   variables before using it in scripts.
7. Leave a short explanatory comment immediately above each `shellcheck disable`.
8. Keep security scanning workflows useful on pull requests and pushes to
   `main`.

## Safety / do-not-touch rules

1. Keep this tap cask-only. Do not add Formula files or formula-specific
   workflows.
2. Do not use mutable cask URLs, `latest` release URLs, or `sha256 :no_check`.
3. Before trusting token-based Homebrew checks, verify that
   `brew --repo p-linnane/tap` points at the checkout you are editing.
4. Pin `Homebrew/actions/*` to a full commit SHA and keep the published CalVer
   tag in the adjacent version comment.

## Commit and PR conventions

Use Conventional Commits:

- `feat(scope): description`
- `fix(scope): description`
- `refactor(scope): description`
- `docs(scope): description`
- `ci(scope): description`
- `chore(scope): description`

All commits must include a `Signed-off-by` trailer for DCO sign-off. Run
`just install-hooks` once per clone so DCO sign-off and pre-push checks are
active.

When authored with an AI coding agent, include the appropriate `Co-Authored-By`
trailer after `Signed-off-by`:

- Claude: `Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>`
- Codex: `Co-Authored-By: Codex GPT-5 <noreply@openai.com>`

Bump the model version in the trailer as newer models ship.

### Git and PR flow

1. Never commit directly to `main`; create a feature branch and open a PR.
2. Keep diffs focused. Avoid unrelated version bumps, README churn, or workflow
   rewrites while touching a cask.
3. PR descriptions should contain only a concise summary of the changes. Do not
   add test-plan sections, bot attribution, or generated-with footers.
4. PRs are squash-merged with the PR number appended.
