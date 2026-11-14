# Scala vs Mercury Comparison Examples (v2)

**Environment Details:**
*   **Scala Version:** 2.13.1 (Compiled using `scalac`)
*   **Mercury Version:** v22.01.9 (Compiled using `mmc` from glot/mercury:latest)
*   **OS:** Ubuntu 22.04 LTS

## Directory Structure and Execution Flow

The directory structure is simplified to place all core logic files directly in the language-specific folders (`jeff/scala`, `jeff/mercury`) to maintain consistency with best practices (Feedback Point 2).

```bash
# Current structure:
jeff/
├── README.md
├── scala/
│   ├── Dockerfile.scala       # Container build file for Scala
│   ├── scala_data_types_or_binding.scala
│   ├── scala_control_structures.scala
│   └── scala_subprograms.scala
└── mercury/
    ├── Dockerfile.mercury     # Container build file for Mercury
    ├── mercury_data_types_or_binding.m
    ├── mercury_control_structures.m
    └── mercury_subprograms.m
```

## Running the Examples (Workflow)

The process involves three steps: **Build**, **Test**, and **Verify**. The Docker setup now copies all source code directly into `/app/jeff/scala` or `/app/jeff/mercury`, allowing scripts to reference files relative to their container directory.

### Scala Test Container
```bash
# 1. Build the image from the local 'jeff/scala' context:
docker build -t scala-test:latest -f jeff/scala/Dockerfile.scala .

# 2. Run tests (The test script now knows where to find all files):
docker run --rm scala-test:latest bash /app/jeff/scala/test-scala.sh
```

### Mercury Test Container
```bash
# 1. Build the image from the local 'jeff/mercury' context:
docker build -t mercury-test:latest -f jeff/mercury/Dockerfile.mercury .

# 2. Run tests (The test script now knows where to find all files):
docker run --rm mercury-test:latest bash /app/jeff/mercury/test-mercury.sh
```

---

## Detailed Feature Comparison & Reasoning

### 1. Subprograms (`subprograms/*.scala` / `mercury_subprograms.m`)

**Concept:** Demonstrating reusable code units with varying levels of side effects and parameter handling.

*   **Scala (Subprograms):** We demonstrate pure functions (`add`), procedures that print messages (`printMessage`), recursion (`factorial`), default/named arguments, varargs (`sum`), higher-order functions (`applyOperation`), and call-by-name evaluation (`twice`).
    *   *Reasoning:* Scala excels at blending functional purity with imperative features. The use of `val` ensures immutability where desired, while the explicit handling of side effects via `Unit` makes flow control clear.
*   **Mercury (Subprograms):** We demonstrate core Mercury concepts like **predicates**, which are primary logic units; using specific modes (`is det`) to guarantee execution paths, and passing parameters explicitly using in/out bindings for state mutation simulation.
    *   *Reasoning:* By relying on predicates, we naturally enforce that the goal succeeds at most once (determinism). This structure is foundational to Mercury's deductive nature.

### 2. Data Types and Binding (`data_types_or_binding/*.scala` / `mercury_data_types_or_binding.m`)

**Concept:** Showing how both languages model structured data and variable binding.

*   **Scala (DataTypesAndBinding):** We use **sealed traits** to define a closed set of possible types, making pattern matching exhaustive at compile time. The `Option[T]` type forces the developer to explicitly handle potential absence of a value (`None`), preventing runtime NullPointerExceptions.
    *   *Reasoning:* Scala's combination of ADTs and Option greatly improves code safety compared to traditional null-handling mechanisms. The `var`/`val` demonstration highlights its flexible approach to state management while maintaining immutability by default.
*   **Mercury (DataTypesAndBinding):** We demonstrate Mercury's fundamental types including integers, strings, and arithmetic operations. The file shows how Mercury handles variable binding with single assignment semantics.
    *   *Reasoning:* Mercury enforces that all variables are immutable (single assignment) which eliminates many classes of bugs related to state mutation. This example focuses on basic type handling rather than complex ADT syntax.

### 3. Control Structures (`control_structures/*.scala` / `mercury_control_structures.m`)
**Concept:** Demonstrating flow control constructs from iteration to error handling.

*   **Scala (ControlStructures):** Scala offers *expressions* for control structures. The `if/else` is an expression that yields a value, allowing assignment like `val x = if (...) { ... }`. We use standard loops (`for`/`while`) and the robust `try-catch` block to handle predictable errors.
    *   *Reasoning:* The ability for control structures to act as expressions makes code very concise and functional. Using `try-catch` is the idiomatic way to manage runtime exceptions in Scala.
*   **Mercury (ControlStructures):** Mercury replaces loops with **recursion**. Control flow decisions are managed via explicit conditional goals (`if-then-else`) or through pattern matching clauses. Error handling relies on failing predicates, not exceptions.
    *   *Reasoning:* Since side effects break purity, all iteration must be modeled recursively, which is the fundamental pillar of logic programming.

## Comparative Analysis

| Feature | Scala Advantage | Mercury Advantage | Notes/Difference |
| :--- | :--- | :--- | :--- |
| **Flexibility** | Multi-paradigm approach allows seamless mixing of OOP and FP. | Enforces absolute purity and strong type safety by default. | Scala is broader; Mercury is deeper in its guarantees. |
| **Type Modeling** | `sealed trait` and `Option[T]` provide a powerful, idiomatic way to model bounded sets and potential absence. | Sum types (`--->`) are extremely declarative for defining union structures. | Both excel at ADTs, but syntax differs greatly. |
| **State Management**| Supports both mutable (`var`) and immutable (`val`), offering flexibility when required.| Strictly enforces single assignment (unification), eliminating state bugs entirely. | Mercury's strictness is a guarantee; Scala provides controlled escape hatches. |
| **Iteration/Control**| `if` as an *expression* allows flow control to return values directly. | Forces recursion, which models computation in a pure mathematical fashion. | The concept of "looping" differs fundamentally between the two languages. |

## Conclusion (What is what)
Scala is a powerful, versatile language best suited for large-scale, complex enterprise systems that need to integrate with Java or require mutable state where necessary. Mercury is ideal for domains where absolute correctness and logical rigor are paramount, such as formal verification or AI rule engines.

**Final Reminder:** For both languages, always use the official documentation when integrating new features; your current implementation showcases core concepts well!
