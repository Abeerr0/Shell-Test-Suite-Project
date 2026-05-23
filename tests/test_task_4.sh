#!/bin/bash
echo "Testing Task 4 (PATH)..."
echo "ls -l /tmp" | ./hsh > hsh_out 2>/dev/null
echo "ls -l /tmp" | /bin/sh > sh_out 2>/dev/null
if cmp -s hsh_out sh_out; then
    echo "[PASS] Command resolution via PATH."
else
    echo "[FAIL] Command resolution via PATH."
fi
rm -f hsh_out sh_out
