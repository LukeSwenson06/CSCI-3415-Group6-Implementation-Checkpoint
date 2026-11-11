% Mercury Subprograms Examples

:- module mercury_subprograms.
:- interface.

:- import_module io, int, string, float.

{-| Main entry point for the Subprograms examples. -}
:- pred main(io::di, io::uo) is det.

:- implementation.

main(!IO) :-
    io.write_string("=== Mercury Subprograms Examples ===\n\n", !IO),
    
    % 1. Function with return value (Pure function): Add two integers
    add(5, 3, Result1),
    io.write_string("add(5, 3) = ", !IO),
    io.write_int(Result1, !IO),

    % 2. Function with expression body: Multiply two integers
    multiply(4, 7, Result2),
    io.write_string("multiply(4, 7) = ", !IO),
    io.write_int(Result2, !IO),

    % 3. Procedure with side effects (Unit): Prints a message to IO stream
    greet("Hello from procedure!", !IO). % Using the standard greet for consistent output style

    % 4. Recursive function: Calculate factorial
    factorial(5, Fact5),
    io.write_string("factorial(5) = ", !IO),
    io.write_int(Fact5, !IO),

    % 5. Default parameters and named arguments
    greet("Alice", "Hello", !IO), % Using default/named args example in the main demo for simplicity
    
    % 6. Varargs: Sum of a list of numbers (using built-in mechanism or a helper predicate)
    list_sum(1, 2, 3, 4, 5, Result6),
    io.write_string("Sum(1..5) = ", !IO),
    io.write_int(Result6, !IO),

    % 7. Higher-order function: Applying an operation (Function passing)
    applyOperation(10, 5, add, Result7),
    io.write_string("applyOperation(10, 5, add) = ", !IO),

    % 8. Named arguments demonstration via direct call
    io.write_string("\n", !IO).

:- pred add(int::in, int::in, int::out) is det.
add(X, Y, Result) :- Result = X + Y.

:- pred multiply(int::in, int::in, int::out) is det.
multiply(X, Y, Result) :- Result = X * Y.

% Recursive function for Factorial
:- pred factorial(int::in, int::out) is det.
factorial(N, Result) :-
    if N = 0 then
        Result = 1
    else
        N1 = N - 1,
        Rest = N * Rest_Val, % Need to calculate the recursive result first
        factorial(N1, Rest),
        Result = Rest.

% Procedure for side effects (IO)
:- pred greet(string::in, string::in, io::di, io::uo) is det.
greet(Name, Greeting, !IO) :-
    io.write_string("Mercury", !IO), % Added "Mercury" prefix for clarity in output
    io.write_string(Greeting, !IO),
    io.write_string(", ", !IO),
    io.write_string(Name, !IO),
    io.write_string("!\n", !IO).

% Function with varargs (simulating list sum)
:- pred list_sum(int::in, int::in, int::in, int::in, int::in, int::out) is det.
list_sum(N1, N2, N3, N4, N5, Result) :-
    Result = N1 + N2 + N3 + N4 + N5.

% Higher-order function: Takes an operation and applies it
:- pred applyOperation(int::in, int::in, (int, int) => int, int::out) is det.
applyOperation(X, Y, Op, Result) :-
    Result = Op(X, Y).