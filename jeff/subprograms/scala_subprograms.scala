// Scala Subprograms Examples
// Demonstrating functions, procedures, and parameter passing

object Subprograms {
  
  // Function with return value (pure function)
  def add(a: Int, b: Int): Int = {
    a + b
  }
  
  // Function with expression body (implicit return)
  def multiply(a: Int, b: Int): Int = a * b
  
  // Procedure with side effects (returns Unit)
  def printMessage(msg: String): Unit = {
    println(s"Message: $msg")
  }
  
  // Recursive function
  def factorial(n: Int): BigInt = {
    if (n <= 1) 1
    else n * factorial(n - 1)
  }
  
  // Function with default parameters
  def greet(name: String, greeting: String = "Hello"): String = {
    s"$greeting, $name!"
  }
  
  // Function with variable arguments (varargs)
  def sum(numbers: Int*): Int = {
    numbers.sum
  }
  
  // Higher-order function (takes function as parameter)
  def applyOperation(x: Int, y: Int, operation: (Int, Int) => Int): Int = {
    operation(x, y)
  }
  
  // Function with named arguments
  def createPerson(name: String, age: Int, city: String): String = {
    s"$name is $age years old and lives in $city"
  }
  
  // Partial function application
  def multiplyBy(factor: Int)(number: Int): Int = {
    factor * number
  }
  
  def main(args: Array[String]): Unit = {
    println("=== Scala Subprograms Examples ===\n")
    
    // Function calls
    println(s"add(5, 3) = ${add(5, 3)}")
    println(s"multiply(4, 7) = ${multiply(4, 7)}")
    printMessage("Hello from procedure!")
    
    // Recursive function
    println(s"factorial(5) = ${factorial(5)}")
    
    // Default parameters
    println(greet("Alice"))
    println(greet("Bob", "Hi there"))
    
    // Varargs
    println(s"sum(1,2,3,4,5) = ${sum(1, 2, 3, 4, 5)}")
    
    // Higher-order function
    val result = applyOperation(10, 5, add)
    println(s"applyOperation(10, 5, add) = $result")
    
    // Named arguments
    println(createPerson(age = 25, name = "Charlie", city = "New York"))
    
    // Partial application
    val double = multiplyBy(2)_
    println(s"double(7) = ${double(7)}")
  }
}
