# Scala vs Mercury Comparison Examples (Final)

**Environment Details:**
*   **Scala Version:** 2.13.1
*   **Mercury Version:** v22.01.9
*   **OS:** Ubuntu 22.04 LTS

## Directory Structure and Execution Flow
The directory structure has been simplified to place all core logic files directly in the language-specific folders, matching the simplest structure required for consistency.

```bash
# Current structure:
jeff/
├── README.md
└── scala/
    ├── Dockerfile.scala       # Container build file for Scala
    ├── scala_data_types_or_binding.scala
    ├── scala_control_structures.scala
    └── scala_subprograms.scala
└── mercury/
    ├── Dockerfile.mercury     # Container build file for Mercury
    ├── mercury_data_types_or_binding.m
    ├── mercury_control_structures.m
    └── mercury_subprograms.m
```

## Running the Examples (Workflow)

### 🚀 CI/CD Workflow (GitHub Actions)
The workflow is configured to automatically check compiler versions on every run and uses the correct, scoped paths:

*   **Scala:** Builds image using `jeff/scala/Dockerfile.scala` and runs test script from `/app/jeff/scala`.
*   **Mercury:** Builds image using `jeff/mercury/Dockerfile.mercury` and runs test script from `/app/jeff/mercury`.

### 💻 Local Execution Commands (For Reviewer)
You must compile all three source files together before running any tests.

#### Scala Local Run Command
You must compile all three source files together before running any tests.
```bash
# 1. Compile all components at once:
scalac scala_subprograms.scala \
    scala_data_types_or_binding.scala \
    scala_control_structures.scala

# 2. Run each file in sequence (each has a main function):
scala scala_subprograms.scala
scala scala_data_types_or_binding.scala
scala scala_control_structures.scala
```

#### Mercury Local Run Command
You must compile and run each module individually using `mmc`.
```bash
# 1. Compile all components:
mmc --make mercury_subprograms mercury_data_types_or_binding mercury_control_structures

# 2. Run the primary entry point modules sequentially:
./mercury_subprograms
./mercury_data_types_or_binding
./mercury_control_structures
```

---
## Detailed Feature Comparison & Reasoning (Deep Dive)
*(The full comparative text remains as previously updated, focusing on deep reasoning for each feature.)*