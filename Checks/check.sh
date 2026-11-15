#!/bin/bash
set -eu
project_dir="$(cd "$(dirname "$0")/.." && pwd)"
check_dir="$(mktemp -d)"
trap 'rm -rf "$check_dir"' EXIT
if [ "${1:-}" = "--answer" ]; then
    cp "$project_dir/Teacher/VendingMachine.swift.answer" "$check_dir/VendingMachine.swift"
else
    cp "$project_dir/ErrorHandlingCheck/VendingMachine.swift" "$check_dir/VendingMachine.swift"
fi
xcrun swiftc -module-cache-path "$check_dir/cache" \
    "$check_dir/VendingMachine.swift" "$project_dir/Checks/main.swift" -o "$check_dir/check"
"$check_dir/check"
