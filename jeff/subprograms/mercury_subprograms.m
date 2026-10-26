% Mercury Subprograms Examples
% Demonstrating predicates, functions, and parameter modes

:- module subprograms.
:- interface.

:- import_module io.

:- main(io::di, io::uo) is det.

:- implementation.

:- import_module int, string, list.

% Function with return value (pure function)
:- func add(int, int) = int.
add(X, Y) = X + Y.

% Recursive function
:- func factorial(int) = int.
factorial(0) = 1.
factorial(N) = N * factorial(N - 1).

% Predicate with multiple solutions (non-deterministic)
:- pred even_or_odd(int, string).
even_or_odd(X, Result) :-
    ( if X mod 2 = 0 then
        Result = "even"
    else
        Result = "odd"
    ).

% Predicate with determinism declarations
:- pred greet(string, string, io::di, io::uo) is det.
greet(Name, Greeting, !IO) :-
    io.format("%s, %s!\n", [s(Greeting), s(Name)], !IO).

% Higher-order predicate (using lambda)
:- pred apply_operation(int, int, func(int, int) = int, int).
apply_operation(X, Y, Operation, Result) :-
    Result = Operation(X, Y).

% Predicate with output parameters
:- pred max_of_three(int, int, int, int).
max_of_three(X, Y, Z, Max) :-
    ( if X >= Y, X >= Z then
        Max = X
    else if Y >= Z then
        Max = Y
    else
        Max = Z
    ).

% List processing predicate
:- pred sum_list(list(int), int).
sum_list([], 0).
sum_list([H | T], Sum) :-
    sum_list(T, Rest),
    Sum = H + Rest.

main(!IO) :-
    io.write_string("=== Mercury Subprograms Examples ===\n\n"),
    
    % Function calls
    io.format("add(5, 3) = %d\n", [i(add(5, 3))], !IO),
    io.format("multiply(4, 7) = %d\n", [i(multiply(4, 7))], !IO),
    
    % Recursive function
    io.format("factorial(5) = %d\n", [i(factorial(5))], !IO),
    
    % Predicate with multiple solutions
    even_or_odd(4, Result1),
    io.write_string(Result1), io.nl(!IO),
    
    % Greeting predicate
    greet("Alice", "Hello", !IO),
    greet("Bob", "Hi there", !IO),
    
    % Higher-order
    apply_operation(10, 5, add, Result2),
    io.format("apply_operation(10, 5, add) = %d\n", [i(Result2)], !IO),
    
    % Max of three
    max_of_three(3, 7, 5, Max),
    io.format("max_of_three(3, 7, 5) = %d\n", [i(Max)], !IO),
    
    % Sum list
    sum_list([1, 2, 3, 4, 5], ListSum),
    io.format("sum_list([1,2,3,4,5]) = %d\n", [i(ListSum)], !IO).

% Additional helper functions
:- func multiply(int, int) = int.
multiply(X, Y) = X * Y.
