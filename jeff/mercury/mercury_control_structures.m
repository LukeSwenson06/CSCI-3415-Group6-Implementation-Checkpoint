% Mercury Control Structures Examples

:- module mercury_control_structures.
:- interface.

:- import_module io, string, int.

{-| Main entry point for the Control Structures examples. -}
:- pred main(io::di, io::uo) is det.

:- implementation.

main(!IO) :-
    io.write_string("=== Mercury Control Structures Examples ===\n\n", !IO),
    
    % 1. If/Else (Demonstrates conditional logic)
    max_of_two(5, 3, Max1),
    io.write_string("Max of Two: ", !IO),
    io.write_int(Max1, !IO),
    io.write_string("\n", !IO),

    min_of_two(5, 3) = Min1,
    io.write_string("Min of Two: ", !IO),
    io.write_int(Min1, !IO),
    io.write_string("\n", !IO),
    
    % 2. Iteration (While loop equivalent using recursion)
    io.write_string("Range 1 to 5: ", !IO),
    print_range(1, 5, !IO),
    io.write_string("\n", !IO),
    
    % 3. Factorial (Recursion)
    factorial(5, Fact5),
    io.write_string("Factorial of 5: ", !IO),
    io.write_int(Fact5, !IO),
    io.write_string("\n", !IO),
    
    % 4. Pattern Matching (Case Analysis)
    classify_number(0, Class1),
    io.write_string("Class of 0: ", !IO),
    io.write_string(Class1, !IO),
    io.write_string("\n", !IO),

    classify_number(-5, Class2),
    io.write_string("Class of -5: ", !IO),
    io.write_string(Class2, !IO),
    io.write_string("\n", !IO).


:- pred max_of_two(int::in, int::in, int::out) is det.
max_of_two(A, B, Max) :-
    ( A > B -> Max = A ; Max = B ).

% Recursive min function
:- func min_of_two(int, int) = int.
min_of_two(A, B) = (if A < B then A else B).

% While loop equivalent using recursion with proper IO threading
:- pred print_range(int::in, int::in, io::di, io::uo) is det.
print_range(Current, Max, !IO) :-
    ( Current =< Max ->
        io.write_string("Range element: ", !IO),
        io.write_int(Current, !IO),
        io.write_string(", ", !IO),
        Next = Current + 1,
        print_range(Next, Max, !IO)
    ; 
        true
    ).

% Factorial predicate using if-then-else (recursion is the primary control structure here)
:- pred factorial(int::in, int::out) is det.
factorial(N, Result) :-
    if N = 0 then
        Result = 1
    else
        N1 = N - 1,
        Rest = N * Rest_Val, % Need to calculate the recursive result first
        factorial(N1, Rest),
        Result = Rest.

% Case/switch equivalent using guards (Pattern matching is preferred)
:- pred classify_number(int::in, string::out) is det.
classify_number(N, Result) :-
    ( N < 0 -> 
        Result = "negative" !IO ;
    N = 0 ->
        Result = "zero" !IO ;
    N mod 2 = 0 ->
        Result = "positive even" !IO ;
    Result = "positive odd"!IO).