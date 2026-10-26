#!/bin/bash

# Test script for Mercury examples
set -e

echo "=== Testing Mercury Examples ==="

cd /app/jeff/mercury
mmc mercury_subprograms.m 2>&1 || { echo "Failed to compile mercury_subprograms"; exit 1; }
./mercury_subprograms

mmc mercury_data_types_or_binding.m 2>&1 || { echo "Failed to compile mercury_data_types_or_binding"; exit 1; }
./mercury_data_types_or_binding

mmc mercury_control_structures.m 2>&1 || { echo "Failed to compile mercury_control_structures"; exit 1; }
./mercury_control_structures

echo "All Mercury examples compiled and executed successfully!"
