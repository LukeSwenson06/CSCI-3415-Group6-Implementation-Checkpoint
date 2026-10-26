#!/bin/bash

# Test script for Scala examples
set -e

echo "=== Testing Scala Examples ==="

cd /app/jeff/subprograms
scalac scala_subprograms.scala 2>&1 || { echo "Failed to compile scala_subprograms"; exit 1; }

cd ../data_types_or_binding
scalac scala_data_types_or_binding.scala 2>&1 || { echo "Failed to compile scala_data_types_or_binding"; exit 1; }

cd ../control_structures
scalac scala_control_structures.scala 2>&1 || { echo "Failed to compile scala_control_structures"; exit 1; }

echo "All Scala examples compiled successfully!"
