// Scala Control Structures Examples
// Demonstrating control flow constructs (If/Else, Match, For/While)

object ControlStructures {
  
  def main(args: Array[String]): Unit = {
    println("=== Scala Control Structures Examples ===\n")
    
    // 1. If / Else (Basic Conditional Logic)
    val locationRating: Double = 9.7 // Example variable to test logic flow

    println("--- If/Else Demo ---")
    if (locationRating >= 9.0) {
        println(s"High rating ($locationRating): A must-visit location!")
    } else if (locationRating >= 7.0) {
        println(s"Medium rating ($locationRating): I'll consider it a place to visit.")
    } else {
        println("Low rating: Better luck next time.")
    }

    // 2. Matching with Guards and Matchers
    println("\n--- Pattern Matching & Guards Demo ---")
    val difficulty = 'A' match {
      case 'A' => "Challenging"
      case 'B' => "Moderate"
      case 'C' => "Easy"
      case c if c.isLetter && c.toUpper.isNaN => "Invalid Character" // Guard example
      case _ => "Unknown Difficulty"
    }
    println(s"Adventure difficulty: $difficulty")

    // 3. For loop (Iteration)
    println("\n--- For Loop Demo ---")
    val adventureDestinations: List[String] = List("Yosemite", "Niagara Falls", "Grand Canyon")
    for (location <- adventureDestinations) {
        println(s"Exploring $location.")
    }

    // 4. While loop (Iteration until condition fails)
    println("\n--- While Loop Demo ---")
    var days = 3
    while (days > 0) {
        println(s"$days day(s) left to go and having fun!")
        days -= 1
    }
    println("Time to go home now.")

    // 5. Try / Catch Demo (Fixing the floating point division issue)
    println("\n--- Exception Handling Demo ---")
    try {
      // Integer division throws ArithmeticException when b == 0, which is what we want to catch here.
      val result = 10 / 2 // This will successfully calculate
      println(s"Successful division (10/2) = $result")

      val zeroDivisionResult: Int = 10 / 0 // This WILL throw ArithmeticException
    } catch {
      case _: ArithmeticException => 
        println("Caught an expected exception: Division by zero occurred.")
    } finally {
        println("Finally block always executes.")
    }
  }
}