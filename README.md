# Simple Shell Test Suite

## Description
This project is an automated test suite designed to validate the Simple Shell UNIX command language interpreter. It ensures the shell meets all requirements from Task 0 to Task 20, covering both regular operations and edge cases.

## Features
* **Automated Execution:** Run all test cases instantly using a single script.
* **Modular Design:** Individual test scripts for each task.
* **Broad Coverage:** Tests regular commands, arguments, PATH resolution, and built-ins.
* **Edge Case Validation:** Handles inputs like EOF (Ctrl+D) and non-existent commands.

## Requirements
* All files will be executed on Ubuntu 20.04 LTS.
* The shell executable must be named hsh.
* Contributions must follow the Betty style.

## Compilation and Installation
To run the test suite, clone this repository and execute the following commands:
chmod +x run_tests.sh
./run_tests.sh

## Examples

### Interactive Mode
$ ./run_tests.sh
Testing Task 0 (Files)...
[PASS] README.md exists.
[PASS] AUTHORS exists.

## Authors
* Abeer Alsaiari - Tasks 0-5, 19
* Ahaad AlQahtani  - Tasks 6-12
* Reem Alanazi - Tasks 16-19
* Afnan Fahad Aljohani - Tasks 14-16
