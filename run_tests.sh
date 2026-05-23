#!/bin/bash

# Main test runner
for test_file in tests/*.sh; do
    bash "$test_file"
done
