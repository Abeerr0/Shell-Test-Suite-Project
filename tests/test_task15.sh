#!/bin/bash
# test_task15.sh - Test suite for Task 15: Logical operators && and ||

SHELL_EXEC="../hsh"
PASS=0
FAIL=0

echo "=========================================="
echo "  Task 15 Tests: '&&' and '||' operators "
echo "=========================================="

# Test 1: && both succeed
echo "Test 1: 'echo ok && echo yes'"
actual=$(echo "echo ok && echo yes" | $SHELL_EXEC)
if echo "$actual" | grep -q "ok" && echo "$actual" | grep -q "yes"; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 2: && first fails, second skipped
echo "Test 2: 'notacommand && echo skipped'"
actual=$(echo "notacommand && echo skipped" | $SHELL_EXEC 2>&1)
if ! echo "$actual" | grep -q "skipped"; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 3: || first succeeds, second skipped
echo "Test 3: 'echo ok || echo skipped'"
actual=$(echo "echo ok || echo skipped" | $SHELL_EXEC)
if echo "$actual" | grep -q "ok" && ! echo "$actual" | grep -q "skipped"; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 4: || first fails, second runs
echo "Test 4: 'notacommand || echo recovered'"
actual=$(echo "notacommand || echo recovered" | $SHELL_EXEC 2>&1)
if echo "$actual" | grep -q "recovered"; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 5: combined && and ||
echo "Test 5: 'echo a && echo b || echo c'"
actual=$(echo "echo a && echo b || echo c" | $SHELL_EXEC)
if echo "$actual" | grep -q "a" && echo "$actual" | grep -q "b"; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 6: && with ls
echo "Test 6: 'ls && echo listed'"
actual=$(echo "ls && echo listed" | $SHELL_EXEC)
if echo "$actual" | grep -q "listed"; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

echo "=========================================="
echo "  Results: $PASS passed, $FAIL failed"
echo "=========================================="
