#!/bin/bash
echo "Testing Task 2 (Simple shell 0.1)..."
echo "/bin/pwd" | ./hsh > hsh_out 2>/dev/null
echo "/bin/pwd" | /bin/sh > sh_out 2>/dev/null
if cmp -s hsh_out sh_out; then
    echo "[PASS] Absolute path command."
else
    echo "[FAIL] Absolute path command."
fi
rm -f hsh_out sh_out
