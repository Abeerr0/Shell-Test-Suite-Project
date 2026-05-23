#!/bin/bash
# test_task14.sh - Test suite for Task 14: Commands separator ';'

SHELL_EXEC="../hsh"
PASS=0
FAIL=0

echo "=========================================="
echo "  Task 14 Tests: Commands separator ';'  "
echo "=========================================="

# Test 1: two simple commands separated by ;
echo "Test 1: 'ls ; pwd'"
expected=$(echo "ls ; pwd" | /bin/sh)
actual=$(echo "ls ; pwd" | $SHELL_EXEC)
if [ "$expected" = "$actual" ]; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 2: three commands separated by ;
echo "Test 2: 'echo hello ; echo world ; pwd'"
expected=$(echo "echo hello ; echo world ; pwd" | /bin/sh)
actual=$(echo "echo hello ; echo world ; pwd" | $SHELL_EXEC)
if [ "$expected" = "$actual" ]; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 3: ; with no spaces
echo "Test 3: 'echo a;echo b'"
expected=$(echo "echo a;echo b" | /bin/sh)
actual=$(echo "echo a;echo b" | $SHELL_EXEC)
if [ "$expected" = "$actual" ]; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 4: continues after error
echo "Test 4: 'echo first ; notacommand ; echo last'"
actual=$(echo "echo first ; notacommand ; echo last" | $SHELL_EXEC 2>&1)
if echo "$actual" | grep -q "first" && echo "$actual" | grep -q "last"; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

# Test 5: with arguments
echo "Test 5: 'ls -l ; echo done'"
actual=$(echo "ls -l ; echo done" | $SHELL_EXEC)
if echo "$actual" | grep -q "done"; then
	echo "  PASS"
	PASS=$((PASS+1))
else
	echo "  FAIL"
	FAIL=$((FAIL+1))
fi

echo "=========================================="
echo "  Results: $PASS passed, $FAIL failed"
echo "=========================================="
