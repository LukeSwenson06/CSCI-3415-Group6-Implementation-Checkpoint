// Scala Data Types and Binding Examples
// Demonstrating type system, pattern matching, and binding

object DataTypesAndBinding {
  
  // Primitive types
  val integerExample: Int = 42
  val doubleExample: Double = 3.14
  val booleanExample: Boolean = true
  val charExample: Char = 'A'
  val stringExample: String = "Hello"

  // Type inference (type is inferred, not declared)
  val inferredInt = 100
  val inferredString = "Inferred type"

  // Case class for custom data types
  case class Person(name: String, age: Int)
  case class Point(x: Double, y: Double)

  // sealed trait for algebraic data types
  sealed trait Shape
  case class Circle(radius: Double) extends Shape
  case class Rectangle(width: Double, height: Double) extends Shape
  case class Square(side: Double) extends Shape
  
  // --- Variable Binding Demonstration (val vs var) ---
  var mutableCounter: Int = 0 // Using var for mutable state
  val immutableCount: Int = 1 // Immutable by default
  
  def demonstrateVarVal(): Unit = {
    println("\n--- Val vs Var Demo ---")
    // Initial assignment (both val and var can do this)
    var counter: Int = 0
    val fixedValue: String = "Immutable"
    println(s"Initial counter value: $counter")
    
    // Reassigning 'var' is fine, but fails compilation for 'val'
    counter += 1 // OK

    // Demonstrating reassignment failure on val (commented out)
    // fixedValue = "Attempt to change val" // Compile Error: reassignment to val
  }

  def shapeInfo(shape: Shape): String = {
    shape match {
      case Circle(r) => s"Circle with radius $r"
      case Rectangle(w, h) => s"Rectangle ${w}x$h"
      case Square(s) => s"Square with side $s"
    }
  }

  def describeNumber(n: Int): String = {
    n match {
      case _ if n < 0 => "negative number"
      case 0 => "zero"
      case n if n % 2 == 0 => s"positive even number $n"
      case n => s"positive odd number $n"
    }
  }

  def listProcessor(list: List[Int]): String = {
    list match {
      case Nil => "empty list"
      case List(x) => s"single element: $x"
      case List(x, y) => s"two elements: $x, $y"
      case head :: tail => s"list with head $head and ${tail.length} more elements"
    }
  }

  // Tuple type for demonstration
  val tupleExample: (String, Int, Double) = ("Alice", 25, 3.14)

  def processTuple(t: (String, Int, Double)): String = {
    val (name, age, value) = t
    s"$name is $age years old with value $value"
  }

  // Option type for handling nulls
  def safeDivide(a: Int, b: Int): Option[Double] = {
    if (b == 0) None
    else Some(a.toDouble / b)
  }

  // For-comprehension with pattern matching
  def extractNames(people: List[Person]): List[String] = {
    for { Person(name, _) <- people } yield name
  }

  def main(args: Array[String]): Unit = {
    println("=== Scala Data Types and Binding Examples ===\n")
    
    // Type examples
    println(s"Integer: $integerExample")
    println(s"Double: $doubleExample")
    println(s"Boolean: $booleanExample")
    println(s"Inferred Int: $inferredInt (type: ${inferredInt.getClass.getSimpleName})")
    
    // Case class usage
    val person = Person("Bob", 30)
    println(s"\nPerson: ${person.name}, ${person.age}")

    // Algebraic data types
    val shapes = List(Circle(5.0), Rectangle(4.0, 6.0), Square(3.0))
    shapes.foreach { shape => println(shapeInfo(shape)) }

    println("\n--- Pattern Matching & Guards ---")
    // Pattern matching with guards
    println(describeNumber(-5))
    println(describeNumber(0))
    println(describeNumber(8))
    println(describeNumber(7))
    
    // List pattern matching
    println("\nList Processor:")
    println(listProcessor(Nil))
    println(listProcessor(List(1)))
    println(listProcessor(List(1, 2)))
    println(listProcessor(List(1, 2, 3, 4)))

    // Tuple destructuring
    println("\nTuple Processor:")
    println(processTuple(tupleExample))

    // Option handling
    safeDivide(10, 2).foreach(result => println(s"10/2 = $result"))
    val zeroDivisionResult = safeDivide(10, 0)
    println(s"10/0 attempt: ${zeroDivisionResult.toString}") // Expected output is None

    // For-comprehension
    println("\nFor-comprehension:")
    val people = List(Person("Alice", 25), Person("Charlie", 35))
    println(extractNames(people).mkString(", "))

    // Demonstrate var/val binding
    demonstrateVarVal()
  }
}