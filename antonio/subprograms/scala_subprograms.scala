def fibonacci(num:Int): Int =
  if num == 0 then
    0
  else
    if num == 1 then
      1
    else
      fibonacci(num-1)+fibonacci(num-2)
end fibonacci

@main
def main():Unit = {
  //var fib:Int = 10
  //var result = fibonacci(fib)
  for fib <- 0 until 11 do
    println("Fibonacci number " + fib + ": " + fibonacci(fib))
}
