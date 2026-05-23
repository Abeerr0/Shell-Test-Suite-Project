#!/bin/bash
echo "Testing Task 5 (Exit)..."
echo "exit" | ./hsh
if [ $? -eq 0 ]; then
    echo "[PASS] Exit built-in."
else
    echo "[FAIL] Exit built-in."
fi
