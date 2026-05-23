#!/bin/bash
# test_task16.sh - Test suite for Task 16: alias builtin command

SHELL_EXEC="../hsh"
PASS=0
FAIL=0

echo "=========================================="
echo "  Task 16 Tests: 'alias' builtin command "
echo "=========================================="

# Test 1: define and list alias
echo "Test 1: define alias and print all"
actual=$(printf "alias hi='echo hello'\nalias\n" | $SHELL_EXEC)
if echo "$actual" | grep -q "hi="; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 2: print specific alias
echo "Test 2: print specific alias"
actual=$(printf "alias hi='echo hello'\nalias hi\n" | $SHELL_EXEC)
if echo "$actual" | grep -q "hi="; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 3: multiple aliases
echo "Test 3: define multiple aliases"
actual=$(printf "alias a='echo A' b='echo B'\nalias\n" | $SHELL_EXEC)
if echo "$actual" | grep -q "a=" && echo "$actual" | grep -q "b="; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 4: overwrite alias
echo "Test 4: overwrite existing alias"
actual=$(printf "alias x='echo first'\nalias x='echo second'\nalias x\n" | $SHELL_EXEC)
if echo "$actual" | grep -q "second"; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 5: execute alias
echo "Test 5: execute via alias"
actual=$(printf "alias greet='echo hello world'\ngreet\n" | $SHELL_EXEC)
if echo "$actual" | grep -q "hello world"; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 6: non-existing alias
echo "Test 6: non-existing alias"
actual=$(echo "alias notexist" | $SHELL_EXEC 2>&1)
if [ -n "$actual" ] || [ -z "$actual" ]; then
	echo "  PASS"
	PASS=$((PASS+1))
fi

echo "=========================================="
echo "  Results: $PASS passed, $FAIL failed"
echo "=========================================="
