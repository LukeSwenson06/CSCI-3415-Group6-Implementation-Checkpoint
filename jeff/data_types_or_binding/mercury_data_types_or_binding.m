% Mercury Data Types and Binding Examples
% Demonstrating type system, pattern matching, and binding

:- module data_types_or_binding.
:- interface.

:- import_module io.

:- main(io::di, io::uo) is det.

:- implementation.

:- import_module string, list, int.

% Custom type using type synonym
:- type age == int.
:- type name == string.

% Algebraic data types (sum types)
:- type shape -->
    circle(float) ;
    rectangle(float, float) ;
    square(float).

% Polymorphic list type (built-in, but shown for reference)
% :- type list(T) -->
%     [] ;
%     [T | list(T)].

% Pattern matching with multiple clauses
:- func area(shape) = float.
area(circle(Radius)) = 3.14159 * Radius * Radius.
area(rectangle(Width, Height)) = Width * Height.
area(square(Side)) = Side * Side.

% Predicate with pattern matching
:- pred describe_shape(shape, string).
describe_shape(circle(R), Desc) :-
    string.format("Circle with radius %.2f", [f(R)], Desc).
describe_shape(rectangle(W, H), Desc) :-
    string.format("Rectangle %.2fx%.2f", [f(W), f(H)], Desc).
describe_shape(square(S), Desc) :-
    string.format("Square with side %.2f", [f(S)], Desc).

% Pattern matching on lists
:- pred list_describe(list(int), string).
list_describe([], "empty list").
list_describe([X], SingleStr) :-
    string.int_to_string(X, Str),
    string.append("single element: ", Str, SingleStr).
list_describe([X, Y], TwoStr) :-
    string.int_to_string(X, XStr),
    string.int_to_string(Y, YStr),
    string.concat(["two elements: ", XStr, ", ", YStr], TwoStr).
list_describe([H | T], Result) :-
    string.int_to_string(H, HStr),
    list_length(T, Len),
    string.format("list with head %s and %d more elements", [s(HStr), i(Len)], Result).

% Pattern matching with guards (using if-then-else)
:- pred classify_number(int, string).
classify_number(N, Result) :-
    ( if N < 0 then
        Result = "negative number"
    else if N = 0 then
        Result = "zero"
    else if N mod 2 = 0 then
        string.format("positive even number %d", [i(N)], Result)
    else
        string.format("positive odd number %d", [i(N)], Result)
    ).

% Tuple types (using record syntax)
:- type person -->
    person{name::string, age::int}.

:- pred print_person(person, io::di, io::uo) is det.
print_person(Person, !IO) :-
    Person = person{Name = Name, Age = Age},
    io.format("Person: %s, %d years old\n", [s(Name), i(Age)], !IO).

% Higher-order functions
:- pred apply_to_list(func(int) = int, list(int), list(int)).
apply_to_list(Func, [], []).
apply_to_list(Func, [H | T], [Func(H) | Rest]) :-
    apply_to_list(Func, T, Rest).

main(!IO) :-
    io.write_string("=== Mercury Data Types and Binding Examples ===\n\n"),
    
    % Type examples
    Age = 25 :: age,
    Name = "Alice" :: name,
    io.format("Person: %s, %d years old\n", [s(Name), i(Age)], !IO),
    
    % Shape examples
    Shapes = [circle(5.0), rectangle(4.0, 6.0), square(3.0)],
    list.foldl(print_shape, Shapes, !IO),
    
    % Area calculations
    io.format("Circle area: %.2f\n", [f(area(circle(5.0)))], !IO),
    io.format("Rectangle area: %.2f\n", [f(area(rectangle(4.0, 6.0)))], !IO),
    
    % List pattern matching
    list_describe([], Result1),
    io.write_string(Result1), io.nl(!IO),
    
    list_describe([1], Result2),
    io.write_string(Result2), io.nl(!IO),
    
    list_describe([1, 2], Result3),
    io.write_string(Result3), io.nl(!IO),
    
    list_describe([1, 2, 3, 4], Result4),
    io.write_string(Result4), io.nl(!IO),
    
    % Number classification
    classify_number(-5, Class1),
    io.write_string(Class1), io.nl(!IO),
    
    classify_number(0, Class2),
    io.write_string(Class2), io.nl(!IO),
    
    classify_number(8, Class3),
    io.write_string(Class3), io.nl(!IO),
    
    classify_number(7, Class4),
    io.write_string(Class4), io.nl(!IO),
    
    % Person record
    print_person(person{name="Bob", age=30}, !IO),
    
    % Higher-order function
    apply_to_list(double, [1, 2, 3], Doubled),
    io.format("Doubled list: %s\n", [s(list.show(int.show, Doubled))], !IO).

:- pred print_shape(shape, io::di, io::uo) is det.
print_shape(Shape, !IO) :-
    describe_shape(Shape, Desc),
    io.write_string(Desc), io.nl(!IO).

:- func double(int) = int.
double(X) = X * 2.

:- func list_length(list(T)) = int :- type(T).
list_length([]) = 0.
list_length([_ | T]) = 1 + list_length(T).
