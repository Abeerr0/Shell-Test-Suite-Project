#!/bin/bash
echo "Testing Task 3 (Arguments)..."
echo "/bin/ls -l /tmp" | ./hsh > hsh_out 2>/dev/null
echo "/bin/ls -l /tmp" | /bin/sh > sh_out 2>/dev/null
if cmp -s hsh_out sh_out; then
    echo "[PASS] Command with arguments."
else
    echo "[FAIL] Command with arguments."
fi
rm -f hsh_out sh_out
