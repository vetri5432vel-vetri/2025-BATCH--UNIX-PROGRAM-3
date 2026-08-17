#!/bin/bash

echo "======================================"
echo "    MKDIR PRACTICAL AUTOGRADER"
echo "======================================"

PASS=0
FAIL=0

pass_test()
{
    echo "PASS: $1"
    PASS=$((PASS + 1))
}

fail_test()
{
    echo "FAIL: $1"
    FAIL=$((FAIL + 1))
}


# --------------------------------------
# Test 1: Check student file
# --------------------------------------

if [ -f mkdir_practical.sh ]; then
    pass_test "mkdir_practical.sh file exists"
else
    fail_test "mkdir_practical.sh file is missing"
    exit 1
fi


# --------------------------------------
# Test 2: Bash syntax
# --------------------------------------

if bash -n mkdir_practical.sh; then
    pass_test "Bash syntax is correct"
else
    fail_test "Bash syntax is incorrect"
fi


# --------------------------------------
# Test 3: mkdir command
# --------------------------------------

if grep -Eq '(^|[[:space:];])mkdir[[:space:]]+bscit([[:space:]]|$)' mkdir_practical.sh; then
    pass_test "mkdir bscit command is present"
else
    fail_test "mkdir bscit command is missing"
fi


# --------------------------------------
# Test 4: mkdir -p
# --------------------------------------

if grep -Eq 'mkdir[[:space:]]+-p[[:space:]]+/home/user/my_folder/sub_folder' mkdir_practical.sh; then
    pass_test "mkdir -p parent directory command is present"
else
    fail_test "mkdir -p parent directory command is missing"
fi


# --------------------------------------
# Test 5: Multiple directories
# --------------------------------------

if grep -Eq 'mkdir[[:space:]]+projects[[:space:]]+documents[[:space:]]+downloads' mkdir_practical.sh; then
    pass_test "Multiple directory creation command is present"
else
    fail_test "Multiple directory creation command is missing"
fi


# --------------------------------------
# Test 6: ls command
# --------------------------------------

if grep -Eq '(^|[[:space:];])ls([[:space:]]|$)' mkdir_practical.sh; then
    pass_test "ls command is present"
else
    fail_test "ls command is missing"
fi


# --------------------------------------
# Test 7: Safe execution
# --------------------------------------

MOCK_DIR=$(mktemp -d)
LOG_FILE="$MOCK_DIR/mkdir.log"

cat > "$MOCK_DIR/mkdir" <<'EOF'
#!/bin/bash

echo "$*" >> "$MKDIR_LOG"

exit 0
EOF

chmod +x "$MOCK_DIR/mkdir"


cat > "$MOCK_DIR/ls" <<'EOF'
#!/bin/bash

echo "bscit"
echo "my_folder"
echo "projects"
echo "documents"
echo "downloads"

exit 0
EOF

chmod +x "$MOCK_DIR/ls"


export MKDIR_LOG="$LOG_FILE"


if timeout 10s env PATH="$MOCK_DIR:$PATH" \
    bash mkdir_practical.sh \
    </dev/null \
    >/tmp/mkdir_student_output \
    2>/tmp/mkdir_student_error
then
    pass_test "Student program executed successfully"
else
    fail_test "Student program execution failed"
    cat /tmp/mkdir_student_error 2>/dev/null
fi


# --------------------------------------
# Test 8: Check mkdir bscit execution
# --------------------------------------

if grep -Fxq "bscit" "$LOG_FILE" 2>/dev/null; then
    pass_test "mkdir bscit was executed"
else
    fail_test "mkdir bscit was not executed"
fi


# --------------------------------------
# --------------------------------------
# Test 9: Check mkdir -p execution
# --------------------------------------

if grep -Fq -- "-p /home/user/my_folder/sub_folder" "$LOG_FILE"; then
    pass_test "mkdir -p parent directory was executed"
else
    fail_test "mkdir -p parent directory was not executed"
    echo "DEBUG: mkdir command log:"
    cat "$LOG_FILE" 2>/dev/null
fi


# --------------------------------------
# Test 10: Check multiple directories
# --------------------------------------

if grep -Fxq "projects documents downloads" "$LOG_FILE" 2>/dev/null; then
    pass_test "Multiple directories were created"
else
    fail_test "Multiple directory creation was not executed"
fi


# --------------------------------------
# Final result
# --------------------------------------

rm -rf "$MOCK_DIR"

echo
echo "======================================"
echo "             FINAL RESULT"
echo "======================================"

echo "Tests Passed : $PASS"
echo "Tests Failed : $FAIL"

if [ "$FAIL" -eq 0 ]; then
    echo
    echo "RESULT: PASS"
    exit 0
else
    echo
    echo "RESULT: FAIL"
    exit 1
fi
