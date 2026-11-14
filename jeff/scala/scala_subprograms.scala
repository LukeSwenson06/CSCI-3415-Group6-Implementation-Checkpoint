// Scala Subprograms Examples
// Demonstrating functions, procedures, and parameter passing

object Subprograms {
  
  // 1. Function with return value (pure function) - Basic call by value
  def add(a: Int, b: Int): Int = a + b
  
  // 2. Function with expression body (implicit return)
  def multiply(a: Int, b: Int): Int = a * b

  // Procedure with side effects (returns Unit)
  def printMessage(msg: String): Unit = {
    println(s"Message: $msg")
  }
  
  // 3. Recursive function - Shows standard recursion pattern
  def factorial(n: Int): BigInt = {
    if (n <= 1) 1
    else n * factorial(n - 1)
  }

  // Function with default parameters and named arguments
  def greet(name: String, greeting: String = "Hello"): String = {
    s"$greeting, $name!"
  }
  
  // Function with variable arguments (varargs)
  def sum(numbers: Int*): Int = {
    numbers.sum
  }

  // Higher-order function (takes function as parameter) - Demonstrating passing functions
  def applyOperation(x: Int, y: Int, operation: (Int, Int) => Int): Int = {
    operation(x, y)
  }
  
  // Function with named arguments and partial application
  def createPerson(name: String, age: Int, city: String): String = {
    s"$name is $age years old and lives in $city"
  }

  // Partial function application (Closure demonstration)
  def multiplyBy(factor: Int)(number: Int): Int = {
    factor * number
  }
  
  // Function demonstrating call-by-name evaluation 
  // The argument 'x' is re-evaluated every time it is used.
  def twice(x: => Int): Int = x + x

  // Demonstration of passing by reference/out mode (Conceptual for Scala)
  // In real life, mutable state would require careful handling or passing an object wrapper.
  // For this example, we simulate the effect of 'out' mode by returning a Pair/case class.
  def processPair(a: Int): (Int, Int) = {
    val b = a * 2 // Simulating out variable
    (a, b)
  }


  def main(args: Array[String]): Unit = {
    println("=== Scala Subprograms Examples ===\n")
    
    // Function calls & Expressions
    println("\n--- Basic Functions ---")
    println(s"add(5, 3) = ${add(5, 3)}")
    println(s"multiply(4, 7) = ${multiply(4, 7)}")
    printMessage("Hello from procedure!")

    // Recursive function
    println("\n--- Recursion ---")
    println(s"factorial(5) = ${factorial(5)}")

    // Default parameters & Named arguments
    println("\n--- Defaults and Names ---")
    println(greet("Alice")) // Uses default greeting
    println(greet("Bob", "Hi there")) // Overrides default greeting
    
    // Varargs
    println("\n--- Variable Arguments (varargs) ---")
    val sumResult = sum(1, 2, 3, 4, 5)
    println(s"sum(1,2,3,4,5) = $sumResult")

    // Higher-order function & Passing functions
    println("\n--- Higher-Order Functions ---")
    val result = applyOperation(10, 5, add)
    println(s"applyOperation(10, 5, add) = $result")
    
    // Named arguments
    println(createPerson(age = 25, name = "Charlie", city = "New York"))

    // Partial application (Closure demonstration)
    val double = multiplyBy(2)_
    println(s"double(7) = ${double(7)}")
    
    // Call by Name Demonstration: The argument is re-evaluated at each use.
    println("\n--- Call By Name Demo ---")
    var nextCounter = 0
    val counter = {
      nextCounter += 1 // First evaluation (counter=1)
      nextCounter
    }
    // Re-evaluating 'counter' forces re-execution of the block, incrementing nextCounter to 2.
    val resultAfterReeval = counter * 2 // Second evaluation (counter=2)
    println(s"Initial count: $counter")
    println(s"Result after re-evaluation: $resultAfterReeval")


  }
}