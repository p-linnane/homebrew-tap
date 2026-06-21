# Casks

export HOMEBREW_DEVELOPER := "1"
export HOMEBREW_NO_AUTO_UPDATE := "1"
export HOMEBREW_NO_ENV_HINTS := "1"

# Audit a cask by token
audit token:
    brew audit --cask --online --strict p-linnane/tap/{{ token }}

# Fetch a cask by token
fetch token:
    brew fetch --cask --retry --force p-linnane/tap/{{ token }}

# Run repository-wide Homebrew syntax checks
test-bot:
    brew test-bot --tap p-linnane/tap --only-tap-syntax

# Audit GitHub Actions workflows with the repo zizmor policy
zizmor:
    zizmor .

# Audit the action supply chain for runtime fetches
pinprick-audit:
    pinprick audit .

# Check README links
lychee:
    lychee --config lychee.toml README.md

# Check

# Run all checks
check:
    #!/usr/bin/env bash
    set -euo pipefail
    failed=0
    skipped=()
    run() {
        echo "--- $1 ---"
        shift
        if ! "$@"; then
            failed=1
        fi
    }
    skip() {
        echo "--- $1 --- skipped ($2 not found)"
        skipped+=("$2 (brew install $3)")
    }
    run test-bot brew test-bot --tap p-linnane/tap --only-tap-syntax
    if command -v zizmor &>/dev/null; then
        run zizmor zizmor .
    else
        skip zizmor zizmor zizmor
    fi
    if command -v pinprick &>/dev/null; then
        run pinprick-audit pinprick audit .
    else
        skip pinprick-audit pinprick pinprick
    fi
    if command -v lychee &>/dev/null; then
        run lychee lychee --config lychee.toml README.md
    else
        skip lychee lychee lychee
    fi
    if [ ${#skipped[@]} -gt 0 ]; then
        echo ""
        echo "Checks skipped due to missing tools:"
        for tool in "${skipped[@]}"; do
            echo "  - $tool"
        done
        failed=1
    fi
    exit "$failed"

# Setup

# Install git hooks (DCO sign-off + pre-push checks) — run once per clone
install-hooks:
    git config core.hooksPath .githooks
