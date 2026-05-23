#!/bin/bash
echo "Testing Task 0 (Files)..."
for file in "README.md" "AUTHORS" "man_1_simple_shell"; do
    if [ -s "../$file" ] || [ -s "$file" ]; then
        echo "[PASS] $file exists."
    else
        echo "[FAIL] $file missing."
    fi
done
