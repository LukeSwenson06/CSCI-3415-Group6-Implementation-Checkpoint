#!/bin/bash

# Test script for Scala examples
set -e

echo "=== Testing Scala Examples ==="

cd /app/jeff/scala
scala scala_subprograms.scala 2>&1 || { echo "Failed to run scala_subprograms"; exit 1; }

scala scala_data_types_or_binding.scala 2>&1 || { echo "Failed to run scala_data_types_or_binding"; exit 1; }

scala scala_control_structures.scala 2>&1 || { echo "Failed to run scala_control_structures"; exit 1; }

echo "All Scala examples executed successfully!"
