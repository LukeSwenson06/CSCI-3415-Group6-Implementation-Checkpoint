# Scala vs Mercury Comparison Examples

This project demonstrates key differences and similarities between Scala and Mercury programming languages through practical examples.

## Language Overview & Architecture

### Scala: Multi-Paradigm Powerhouse
Scala blends object-oriented and functional programming into a single cohesive language. It runs on the JVM and offers:
- **Flexible type system**: Supports both immutable (`val`) and mutable (`var`) state
- **Expressions everywhere**: `if` is an expression that returns values
- **Rich collection API**: For-comprehensions, pattern matching with guards
- **Sealed traits & Option**: Exhaustive pattern matching with compile-time safety

### Mercury: Logic Programming Purity
Mercury is a purely functional logic language designed for correctness:
- **Single assignment**: All variables are immutable by default
- **Mode system**: Compile-time determinism guarantees (`is det`, `is semidet`)
- **Predicates & functions**: Separate constructs with explicit input/output modes
- **No side effects**: Purity enforced at the type level

| Feature | Scala | Mercury |
|---------|-------|---------|
| Paradigm | Multi-paradigm (OOP + FP) | Logic/Functional hybrid |
| Typing | Static, flexible | Static, Hindley-Milner inference |
| State | `val` (immutable) / `var` (mutable) | Single assignment only |
| Control | Expressions (if), loops | Recursion, if-then-else |
| Error Handling | Try-catch-finally | Mode system + failing predicates |

## Running the Examples

### GitHub Actions CI/CD Workflow

The project includes a GitHub Actions workflow (`test-scala-mercury.yml`) that automatically runs on:
- Pushes to `main` or `develop` branches
- Pull requests targeting those branches
- Manual triggers via "Run workflow" button

**What happens:**
1. Repository is checked out
2. Docker container is built from the language-specific Dockerfile
3. Compiler version is confirmed inside the container
4. All examples are compiled and executed
5. Results are logged for review

### Running Locally (Docker)

You can run the same tests locally using Docker:

**Scala:**
```bash
# Build the container
docker build -t scala-test:latest -f jeff/scala/Dockerfile.scala .

# Run all tests
docker run --rm scala-test:latest bash /app/jeff/scala/test-scala.sh
```

**Mercury:**
```bash
# Build the container
docker build -t mercury-test:latest -f jeff/mercury/Dockerfile.mercury .

# Run all tests
docker run --rm mercury-test:latest bash /app/jeff/mercury/test-mercury.sh
```

### Running Manually (Inside Container)

For interactive debugging, start a shell in the container:

```bash
# Scala interactive shell
docker run -it --rm scala-test:latest bash
# Then inside:
cd /app/jeff/scala
scalac *.scala
scala scala_subprograms.scala

# Mercury interactive shell  
docker run -it --rm mercury-test:latest bash
# Then inside:
cd /app/jeff/mercury
mmc --make *.m
./mercury_subprograms
```

## File Structure

```
jeff/
├── README.md                          # This file
└── scala/
    ├── Dockerfile.scala               # Container build for Scala
    ├── scala_data_types_or_binding.scala
    ├── scala_control_structures.scala
    └── scala_subprograms.scala
└── mercury/
    ├── Dockerfile.mercury             # Container build for Mercury
    ├── mercury_data_types_or_binding.m
    ├── mercury_control_structures.m
    └── mercury_subprograms.m
```

## Requirements

- **Docker**: Required for running containers (free tier available)
- No local Scala/Mercury installation needed - everything is containerized
