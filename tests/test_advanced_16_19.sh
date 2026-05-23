#!/bin/bash

# Colors for professional output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0;0m'

SHELL_EXE="./hsh"
REF_SHELL="/bin/sh"
OUTPUT_SHELL="adv_shell_out.txt"
OUTPUT_REF="adv_ref_out.txt"

PASSED_TESTS=0
TOTAL_TESTS=0

if [ ! -f "$SHELL_EXE" ]; then
    echo "Error: $SHELL_EXE not found. Please compile your shell first."
    exit 1
fi

run_adv_test() {
    local test_name=$1
    local input_command=$2
    TOTAL_TESTS=$((TOTAL_TESTS + 1))

    # Run student shell
    echo -e "$input_command" | $SHELL_EXE > $OUTPUT_SHELL 2>&1
    local status_shell=$?

    # Run reference shell
    echo -e "$input_command" | $REF_SHELL > $OUTPUT_REF 2>&1
    local status_ref=$?

    # Clean outputs (remove prompts if any for fair comparison)
    sed -i 's/($) //g' $OUTPUT_SHELL
    sed -i 's/$ //g' $OUTPUT_SHELL

    # Compare output and exit status
    diff $OUTPUT_SHELL $OUTPUT_REF > /dev/null
    local diff_res=$?

    if [ $diff_res -eq 0 ] && [ $status_shell -eq $status_ref ]; then
        echo -e "[$test_name] ${GREEN}PASS${NC}"
        PASSED_TESTS=$((PASSED_TESTS + 1))
    else
        echo -e "[$test_name] ${RED}FAIL${NC}"
        echo "--- Command Sent ---"
        echo "$input_command"
        echo "--- Expected (Standard Sh) ---"
        cat $OUTPUT_REF
        echo "--- Got (Your Shell) ---"
        cat $OUTPUT_SHELL
        echo "Exit Status -> Expected: $status_ref, Got: $status_shell"
        echo "--------------------------------"
    fi

    rm -f $OUTPUT_SHELL $OUTPUT_REF
}

echo "=================================================="
echo "Starting Advanced Tasks Test Suite (Tasks 16 - 19)"
echo "=================================================="

# --- Task 16: Logical Operators (&& and ||) ---
run_adv_test "Task 16: AND Success Chain" "ls /var && ls /var"
run_adv_test "Task 16: AND Failure Interruption" "ls /hbtn && ls /var"
run_adv_test "Task 16: AND Multi-Chain Interruption" "ls /var && ls /var && ls /var && ls /hbtn"
run_adv_test "Task 16: AND Multi-Chain Terminal Failure" "ls /var && ls /var && ls /var && ls /hbtn && ls /hbtn"
run_adv_test "Task 16: OR Success Short-Circuit" "ls /var || ls /var"
run_adv_test "Task 16: OR Failure Fallback" "ls /hbtn || ls /var"
run_adv_test "Task 16: OR Multi-Failure Fallback" "ls /hbtn || ls /hbtn || ls /hbtn || ls /var"
run_adv_test "Task 16: OR Multi-Failure Multi-Success" "ls /hbtn || ls /hbtn || ls /hbtn || ls /var || ls /var"

# --- Task 17: Alias Builtin ---
run_adv_test "Task 17: Define and execute alias" "alias ll='ls -l'\\nll /var"
run_adv_test "Task 17: Print all aliases" "alias"
run_adv_test "Task 17: Print specific alias" "alias ll"

# --- Task 18: Variables Expansion ($?, $$, $PATH) ---
run_adv_test "Task 18: Exit status status code ($?" "ls /non_existent_folder_xyz\\necho $?"
run_adv_test "Task 18: PID Expansion verification ($$)" "echo $$ | grep -q [0-9] && echo 'PID validated'"
run_adv_test "Task 18: Environment variable expansion ($PATH)" "echo $PATH"

# --- Task 19: Comments Handling (#) ---
run_adv_test "Task 19: Comment trailing after PID command" "echo $$ # ls -la"
run_adv_test "Task 19: Pure full-line comment" "# this is a pure comment line"
run_adv_test "Task 19: Comment after standard command" "ls /var # checking listing"

echo "=================================================="
echo "Advanced Suite Results: $PASSED_TESTS / $TOTAL_TESTS passed."
echo "=================================================="

if [ $PASSED_TESTS -eq $TOTAL_TESTS ]; then
    exit 0
else
    exit 1
fi
