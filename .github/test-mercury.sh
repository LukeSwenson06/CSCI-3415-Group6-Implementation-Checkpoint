#!/bin/bash

# Test script for Mercury examples
set -e

echo "=== Testing Mercury Examples ==="

cd /app/jeff/subprograms
mmc -make 2>&1 || { echo "Failed to compile mercury_subprograms"; exit 1; }

cd ../data_types_or_binding
mmc -make 2>&1 || { echo "Failed to compile mercury_data_types_or_binding"; exit 1; }

cd ../control_structures/control_structures
mmc -make 2>&1 || { echo "Failed to compile mercury_control_structures"; exit 1; }

echo "All Mercury examples compiled successfully!"
