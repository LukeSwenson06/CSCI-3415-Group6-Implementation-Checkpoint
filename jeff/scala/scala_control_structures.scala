// Scala Control Structures Examples
// Demonstrating if-else, loops, for-comprehensions, and exception handling

object ControlStructures {
  
  // If-else expressions (if is an expression that returns a value)
  def max(a: Int, b: Int): Int = {
    if (a > b) a else b
  }
  
  // Multi-line if-else with block
  def minWithBlock(a: Int, b: Int): Int = {
    val result = if (a < b) {
      println("a is smaller")
      a
    } else {
      b
    }
    result
  }
  
  // For-loop with range
  def printRange(n: Int): Unit = {
    for (i <- 1 to n) {
      print(s"$i ")
    }
    println()
  }
  
  // For-loop with filter (for-comprehension)
  def evenNumbers(n: Int): List[Int] = {
    (for {
      i <- 1 to n
      if i % 2 == 0
    } yield i).toList
  }
  
  // Nested loops
  def multiplicationTable(size: Int): Unit = {
    for {
      i <- 1 to size
      j <- 1 to size
    } println(s"$i × $j = ${i * j}")
  }
  
  // While loop
  def countdown(n: Int): Unit = {
    var i = n
    while (i > 0) {
      print(s"$i ")
      i -= 1
    }
    println("Blast off!")
  }
  
  // Do-while loop
  def doWhileExample(): Unit = {
    var i = 0
    do {
      print(s"$i ")
      i += 1
    } while (i < 5)
    println()
  }
  
  // Match expression (Scala's switch on steroids)
  def describeValue(x: Any): String = {
    x match {
      case 0 => "zero"
      case 1 | 2 | 3 => "small number"
      case n: Int if n > 3 => s"large integer: $n"
      case s: String => s"string: $s"
      case true => "boolean true"
      case false => "boolean false"
      case _: Double => "a double"
      case _ => "unknown type"
    }
  }
  
  // Try-catch-finally
  def safeDivide(a: Int, b: Int): Double = {
    try {
      a.toDouble / b
    } catch {
      case _: ArithmeticException => Double.NaN
      case e: Exception => throw e
    } finally {
      println("Division attempted")
    }
  }
  
  // Pattern matching in for-comprehension
  def filterPeople(people: List[(String, Int)]): List[String] = {
    for {
      (name, age) <- people
      if age >= 18
    } yield name
  }
  
  // For-comprehension with multiple generators
  def combinations(list1: List[Int], list2: List[String]): List[(Int, String)] = {
    for {
      num <- list1
      str <- list2
    } yield (num, str)
  }
  
  def main(args: Array[String]): Unit = {
    println("=== Scala Control Structures Examples ===\n")
    
    // If-else
    println(s"max(5, 3) = ${max(5, 3)}")
    println(s"minWithBlock(5, 3) = ${minWithBlock(5, 3)}")
    
    // For-loop
    print("Range 1 to 5: ")
    printRange(5)
    
    // For-comprehension with filter
    println(s"Even numbers 1-10: ${evenNumbers(10).mkString(", ")}")
    
    // Multiplication table (first 3 rows)
    println("Multiplication table (3x3):")
    multiplicationTable(3)
    println()
    
    // While loop
    print("Countdown from 5: ")
    countdown(5)
    
    // Do-while
    print("Do-while 0-4: ")
    doWhileExample()
    
    // Match expression
    println(describeValue(0))
    println(describeValue(2))
    println(describeValue(100))
    println(describeValue("hello"))
    println(describeValue(true))
    println(describeValue(3.14))
    println(describeValue(List(1, 2, 3)))
    
    // Try-catch
    println(s"safeDivide(10, 2) = ${safeDivide(10, 2)}")
    println(s"safeDivide(10, 0) = ${safeDivide(10, 0)}")
    
    // Pattern matching in for-comprehension
    val people = List(("Alice", 25), ("Bob", 17), ("Charlie", 30))
    val adults = filterPeople(people)
    println(s"Adults: ${adults.mkString(", ")}")
    
    // Combinations
    val combos = combinations(List(1, 2), List("a", "b"))
    println(s"Combinations: $combos")
  }
}
