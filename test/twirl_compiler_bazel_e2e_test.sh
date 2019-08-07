#!/usr/bin/env bash
# Borrowed from lucidsoftware/rules_twirl

set -e

bazel test //test:twirl-compiler-test
