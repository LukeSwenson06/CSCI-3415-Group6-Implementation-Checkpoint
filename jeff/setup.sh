#!/bin/bash

# Setup and test script for Scala vs Mercury comparison examples

set -e

echo "=== Setting up Scala vs Mercury Examples ==="
echo ""

# Check if we're in the correct directory
if [ ! -d "jeff" ]; then
    echo "Error: Must be run from project root"
    exit 1
fi

cd jeff

# Setup directories (in case they don't exist)
mkdir -p subprograms data_types_or_binding control_structures/control_structures

echo "✓ Directory structure ready"

# Check for Scala installation (optional)
if command -v scala &> /dev/null; then
    echo "Scala found: $(scala -version 2>&1 | head -1)"
else
    echo "Note: Scala not installed locally. Use Docker to run."
fi

# Check for Mercury installation (optional)
if command -v mmc &> /dev/null; then
    echo "Mercury found: $(mmc --version 2>&1 | head -1)"
else
    echo "Note: Mercury not installed locally. Use Docker to run."
fi

echo ""
echo "=== Files Created ==="
find . -type f \( -name "*.scala" -o -name "*.m" -o -name "*.md" \) | sort

echo ""
echo "=== Quick Test Commands ==="
echo ""
echo "Scala (using sbt):"
echo "  cd jeff/subprograms && scalac scala_subprograms.scala && scala Subprograms"
echo ""
echo "Mercury:"
echo "  cd jeff/subprograms && mmc -make && ./subprograms"
echo ""
echo "Docker (no installation needed):"
echo "  # Build and run Scala tests"
echo "  docker build -f .github/Dockerfile.scala -t scala-test ."
echo "  docker run --rm scala-test /app/jeff/subprograms/scala_subprograms.scala"
echo ""
echo "  # Build and run Mercury tests"
echo "  docker build -f .github/Dockerfile.mercury -t mercury-test ."
echo "  docker run --rm mercury-test mmc -make && ./subprograms"
