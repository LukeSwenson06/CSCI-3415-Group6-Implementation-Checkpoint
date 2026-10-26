# Scala vs Mercury Comparison Examples

This directory contains example code demonstrating the differences and similarities between Scala and Mercury programming languages.

## Directory Structure

```
jeff/
├── README.md                          # This file
├── subprograms/                       # Function/predicate examples
│   ├── scala_subprograms.scala        # Scala function examples
│   └── mercury_subprograms.m          # Mercury predicate/function examples
├── data_types_or_binding/             # Type system and binding examples
│   ├── scala_data_types_or_binding.scala
│   └── mercury_data_types_or_binding.m
└── control_structures/control_structures/  # Control flow examples
    ├── scala_control_structures.scala
    └── mercury_control_structures.m
```

## Examples Covered

### 1. Subprograms (`subprograms/`)
- **Scala**: Functions with return values, procedures (Unit), recursion, default parameters, varargs, higher-order functions
- **Mercury**: Pure functions, predicates (with modes), recursion, higher-order predicates, non-deterministic predicates

### 2. Data Types and Binding (`data_types_or_binding/`)
- **Scala**: Case classes, sealed traits (algebraic data types), pattern matching, type inference, Option type, tuples
- **Mercury**: Type synonyms, algebraic data types, polymorphic types, record syntax, pattern matching with multiple clauses

### 3. Control Structures (`control_structures/`)
- **Scala**: If-expressions, for-loops, while-loops, match expressions, try-catch-finally, for-comprehensions
- **Mercury**: If-then-else, recursion (replacing loops), case analysis via multiple clauses, error handling patterns

## Running the Examples

### Scala
```bash
# Compile
scalac subprograms/scala_subprograms.scala
scalac data_types_or_binding/scala_data_types_or_binding.scala
scalac control_structures/scala_control_structures.scala

# Run
scala Subprograms
```

### Mercury
```bash
# Compile
mmake subprograms
mmake data_types_or_binding
mmake control_structures

# Run
./subprograms
```

## Key Differences

| Feature | Scala | Mercury |
|---------|-------|---------|
| Functions vs Procedures | All functions return values (Unit is a type) | Separate functions and predicates |
| Binding | Val (immutable), Var (mutable) | All variables are immutable (single assignment) |
| Control Flow | Loops, if-expressions, match | Recursion, if-then-else, multiple clause predicates |
| Pattern Matching | Match expressions with guards | Multiple clauses with unification and cuts |
| Types | Object-oriented type system | Strong static typing with Hindley-Milner inference |

## Notes

- Mercury is a logic/functional hybrid with purity as a core principle
- Scala is a multi-paradigm language supporting both OOP and functional programming
- Mercury's mode system ensures determinism guarantees at compile time
- Scala's type system is more flexible but less restrictive than Mercury's
