# Scala vs Mercury: A Comparative Guide

## Overview

This document provides a side-by-side comparison of Scala and Mercury programming languages, highlighting their key differences and similarities through practical examples.

## Language Paradigms

| Aspect | Scala | Mercury |
|--------|-------|---------|
| Primary Paradigm | Multi-paradigm (OOP + FP) | Logic/Functional hybrid |
| Purity | Supports both mutable and immutable | Pure functional (immutable by default) |
| Typing | Static, object-oriented type system | Strong static typing with Hindley-Milner inference |
| Compilation | JVM bytecode or JavaScript | Native code compilation |

## Subprograms Comparison

### Scala Functions
```scala
// Function with explicit return type
def add(a: Int, b: Int): Int = {
  a + b
}

// Recursive function
def factorial(n: Int): BigInt = {
  if (n <= 1) 1 else n * factorial(n - 1)
}

// Higher-order function
def applyOperation(x: Int, y: Int, operation: (Int, Int) => Int): Int = {
  operation(x, y)
}
```

### Mercury Predicates and Functions
```mercury
% Pure function
:- func add(int, int) = int.
add(X, Y) = X + Y.

% Recursive function
:- func factorial(int) = int.
factorial(0) = 1.
factorial(N) = N * factorial(N - 1).

% Higher-order predicate
:- pred apply_operation(int, int, func(int, int) = int, int).
apply_operation(X, Y, Operation, Result) :-
    Result = Operation(X, Y).
```

**Key Differences:**
- Scala has both functions (return values) and procedures (Unit)
- Mercury separates pure functions from predicates (which may have multiple solutions)
- Mercury uses mode declarations for determinism guarantees

## Data Types Comparison

### Scala Case Classes
```scala
// Algebraic data type
sealed trait Shape
case class Circle(radius: Double) extends Shape
case class Rectangle(width: Double, height: Double) extends Shape

// Pattern matching
def shapeInfo(shape: Shape): String = {
  shape match {
    case Circle(r) => s"Circle with radius $r"
    case Rectangle(w, h) => s"Rectangle ${w}x$h"
  }
}
```

### Mercury Algebraic Data Types
```mercury
% Sum type definition
:- type shape -->
    circle(float) ;
    rectangle(float, float) ;
    square(float).

% Pattern matching via multiple clauses
area(circle(Radius)) = 3.14159 * Radius * Radius.
area(rectangle(Width, Height)) = Width * Height.
```

**Key Differences:**
- Scala uses case classes with inheritance for ADTs
- Mercury has built-in sum types with cleaner syntax
- Mercury's pattern matching is based on unification

## Control Structures Comparison

### Scala If-Expressions and Loops
```scala
// If is an expression (returns a value)
def max(a: Int, b: Int): Int = if (a > b) a else b

// For-loop with range
for (i <- 1 to 10) println(i)

// Match expression (like switch on steroids)
x match {
  case 0 => "zero"
  case n: Int if n > 0 => s"positive $n"
}
```

### Mercury Control Structures
```mercury
% If-then-else (statement, not expression)
( if A > B then
    Max = A
else
    Max = B
).

% Recursion replaces loops
print_range(Current, Max) :-
    ( if Current =< Max then
        io.write_string(string.int_to_string(Current)),
        print_range(Current + 1, Max)
    ).

% Case analysis via multiple clauses
classify_number(0, "zero").
classify_number(N, Result) :- N < 0, Result = "negative".
```

**Key Differences:**
- Scala's `if` is an expression that returns a value
- Mercury uses recursion instead of loops (purity requirement)
- Mercury's case analysis uses multiple predicate clauses with unification

## Type System Comparison

### Scala Type Inference
```scala
// Type inferred from initialization
val number = 42              // Int
val text = "hello"           // String

// Explicit type annotation
val explicit: List[Int] = List(1, 2, 3)

// Generic types
def head[T](list: List[T]): T = list.head
```

### Mercury Type System
```mercury
% Type synonyms
:- type age == int.
:- type name == string.

% Polymorphic types (built-in)
:- type list(T) -->
    [] ;
    [T | list(T)].

% Determinism modes
:- pred sort(list(int), list(int)) is det.     % always succeeds once
:- pred member(T, list(T)) is semidet.         % may fail
```

**Key Differences:**
- Scala's type system is more flexible but less restrictive
- Mercury has mode annotations for determinism guarantees
- Mercury uses Hindley-Milner type inference (similar to Haskell)

## Binding and Immutability

### Scala: Val vs Var
```scala
val immutable = 42    // Cannot be reassigned
var mutable = 10      // Can be reassigned

// Immutable by default in collections
val list = List(1, 2, 3)
val newList = list :+ 4  // Creates new list
```

### Mercury: Single Assignment
```mercury
% All variables are immutable (single assignment)
max_of_two(A, B, Max) :-
    ( if A > B then
        Max = A     % Unification, not assignment
    else
        Max = B
    ).
```

**Key Differences:**
- Scala supports both `val` (immutable) and `var` (mutable)
- Mercury enforces single assignment throughout (purity)
- Mercury uses unification rather than assignment

## Error Handling Comparison

### Scala: Try-Catch-Finally
```scala
def safeDivide(a: Int, b: Int): Double = {
  try {
    a.toDouble / b
  } catch {
    case _: ArithmeticException => Double.NaN
  } finally {
    println("Division attempted")
  }
}
```

### Mercury: Determinism and Errors
```mercury
% Option 1: Return error value
safe_divide(_, 0, nan) :- !.
safe_divide(A, B, Result) :-
    Result = float(A) / float(B).

% Option 2: Use default
divide_with_default(A, B, Default, Result) :-
    ( if B = 0 then
        Result = Default
    else
        Result is A // B
    ).
```

**Key Differences:**
- Scala uses try-catch-finally exception handling
- Mercury prefers returning error values or using determinism annotations
- Mercury's purity makes exceptions less common

## Testing in Docker

Both languages have been tested using Docker containers to ensure reproducible builds.

### Scala Test Container
```dockerfile
FROM hseeberger/scala-sbt:8u292_3.3.3_2.13.12
COPY jeff/subprograms/scala_subprograms.scala ./subprograms/
RUN scalac subprograms/scala_subprograms.scala
```

### Mercury Test Container
```dockerfile
FROM ubuntu:22.04
RUN apt-get install -y gcc make wget
# Install Mercury compiler from release
RUN mmc -make && ./subprograms
```

## Conclusion

| Feature | Scala Advantage | Mercury Advantage |
|---------|-----------------|-------------------|
| Flexibility | Multi-paradigm, integrates with Java | Purity guarantees, determinism checking |
| Learning Curve | Familiar to OOP developers | Unique logic programming concepts |
| Performance | JVM optimizations | Native code compilation |
| Error Prevention | Type system + Option type | Mode system + purity |
| Ecosystem | Rich Java ecosystem | Specialized but efficient |

## References

- [Scala Documentation](https://docs.scala-lang.org/)
- [Mercury Language Website](http://www.mercurylang.org/)
- [Programming Scala](https://www.artima.com/shop/programming_scala_3ed)
- [The Mercury User's Guide](http://dev.mercurylang.org/documentation)
