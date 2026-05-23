#!/bin/bash
echo "Testing Task 1 (Betty)..."
betty *.c *.h > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "[PASS] Betty styling."
else
    echo "[FAIL] Betty styling."
fi
