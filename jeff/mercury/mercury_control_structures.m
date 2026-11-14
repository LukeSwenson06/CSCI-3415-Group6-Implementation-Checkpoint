% Mercury Control Structures Examples

:- module mercury_control_structures.
:- interface.

:- import_module io, string, int.

:- pred main(io::di, io::uo) is det.

:- implementation.

main(!IO) :-
    io.write_string("=== Mercury Control Structures Examples ===\n\n", !IO),
    
    % If-then-else
    max_of_two(5, 3, Max1),
    io.write_string("max_of_two(5, 3) = ", !IO),
    io.write_int(Max1, !IO),
    io.write_string("\n", !IO),
    
    min_of_two(5, 3) = Min1,
    io.write_string("min_of_two(5, 3) = ", !IO),
    io.write_int(Min1, !IO),
    io.write_string("\n", !IO),
    
    % While loop equivalent using recursion
    io.write_string("Range 1 to 5: ", !IO),
    print_range(1, 5, !IO),
    io.write_string("\n", !IO),
    
    % Factorial
    factorial(5, Fact5),
    io.write_string("factorial(5) = ", !IO),
    io.write_int(Fact5, !IO),
    io.write_string("\n", !IO),
    
    % Case/switch equivalent using guards
    classify_number(0, Class1),
    io.write_string(Class1, !IO),
    io.write_string("\n", !IO),
    
    classify_number(-5, Class2),
    io.write_string(Class2, !IO),
    io.write_string("\n", !IO),
    
    classify_number(8, Class3),
    io.write_string(Class3, !IO),
    io.write_string("\n", !IO),
    
    classify_number(7, Class4),
    io.write_string(Class4, !IO),
    io.write_string("\n", !IO).

% If-then-else predicate
:- pred max_of_two(int::in, int::in, int::out) is det.
max_of_two(A, B, Max) :-
    ( A > B -> Max = A ; Max = B ).

% Recursive min function
:- func min_of_two(int, int) = int.
min_of_two(A, B) = (if A < B then A else B).

% While loop using recursion with proper IO threading
:- pred print_range(int::in, int::in, io::di, io::uo) is det.
print_range(Current, Max, !IO) :-
    ( Current =< Max ->
        print_range_helper(Current, !IO),
        Next = Current + 1,
        print_range(Next, Max, !IO)
    ; 
        true
    ).

% Helper to separate IO from condition
:- pred print_range_helper(int::in, io::di, io::uo) is det.
print_range_helper(N, !IO) :-
    io.write_int(N, !IO),
    io.write_string(" ", !IO).

% Factorial predicate using if-then-else
:- pred factorial(int::in, int::out) is det.
factorial(N, Result) :-
    if N = 0 then
        Result = 1
    else
        N1 = N - 1,
        factorial(N1, Rest),
        Result = N * Rest.

% Case/switch equivalent using guards with if-then-else
:- pred classify_number(int::in, string::out) is det.
classify_number(N, Result) :-
    ( N < 0 -> 
        Result = "negative"
    ; N = 0 ->
        Result = "zero"
    ; N mod 2 = 0 ->
        Result = "positive even"
    ; 
        Result = "positive odd"
    ).
