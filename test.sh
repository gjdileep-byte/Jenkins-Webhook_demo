#!/bin/bash
echo "Running Application Tests"
if [ -f version.txt ]; then
echo "TEST PASSED: version.txt exists"
exit 0
else
echo "TEST FAILED: version.txt missing"
exit 1
fi
