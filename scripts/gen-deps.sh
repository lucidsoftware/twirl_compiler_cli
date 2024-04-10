#!/bin/sh -e

#
# Regenerates the external dependencies lock file using rules_jvm_external
#

cd "$(dirname "$0")/.."
echo "$(dirname "$0")/.."

echo "generating dependencies for main workspace"
bazel run @unpinned_twirl_compiler_cli_maven//:pin
bazel run @unpinned_twirl_compiler_cli_test_maven//:pin

