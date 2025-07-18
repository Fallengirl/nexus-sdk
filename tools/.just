#
# $ just tools
#
# Commands related to native Nexus Tools.
#

import '../just/_helpers.just'

[private]
_default:
    @just --list tools

# Build all native Nexus Tools
build: _check-cargo
    cargo +stable build --package math --release
    cargo +stable build --package llm-openai-chat-completion --release

# Check all native Nexus Tools
check: _check-cargo
    cargo +stable check --package math
    cargo +stable check --package llm-openai-chat-completion

# Run all tests in all native Nexus Tools
test: _check-cargo
    cargo +stable test --package math
    cargo +stable test --package llm-openai-chat-completion

# Run rustfmt on all native Nexus Tools
fmt-check: _check-cargo
    cargo +nightly-2025-01-06 fmt --package math --check
    cargo +nightly-2025-01-06 fmt --package llm-openai-chat-completion --check

# Run clippy on all native Nexus Tools
clippy: _check-cargo
    cargo +stable clippy --package math
    cargo +stable clippy --package llm-openai-chat-completion

# Runs the `which` native Nexus Tool. Note that some Tools might need some
# environment variables to be set.
run which: _check-cargo
    cargo +stable run --package {{which}}
