% Mercury Data Types and Binding Examples

:- module mercury_data_types_or_binding.
:- interface.

:- import_module io, string, int.

:- pred main(io::di, io::uo) is det.

:- implementation.

main(!IO) :-
    io.write_string("=== Mercury Data Types and Binding Examples ===\n\n", !IO),
    
    % Type examples using integers
    Age = 25,
    Name = "Alice",
    io.write_string(Name, !IO),
    io.write_string(" is ", !IO),
    io.write_int(Age, !IO),
    io.write_string(" years old\n", !IO),
    
    % Shape examples using integers (simplified - areas as integers)
    CircleArea = circle_area(5),
    io.write_string("Circle area: ", !IO),
    io.write_int(CircleArea, !IO),
    io.write_string("\n", !IO),
    
    RectangleArea = rectangle_area(4, 6),
    io.write_string("Rectangle area: ", !IO),
    io.write_int(RectangleArea, !IO),
    io.write_string("\n", !IO),
    
    SquareArea = square_area(3),
    io.write_string("Square area: ", !IO),
    io.write_int(SquareArea, !IO),
    io.write_string("\n", !IO),
    
    % Number classification with guards
    classify_number(-5, Class1),
    io.write_string(Class1, !IO),
    io.write_string("\n", !IO),
    
    classify_number(0, Class2),
    io.write_string(Class2, !IO),
    io.write_string("\n", !IO),
    
    classify_number(8, Class3),
    io.write_string(Class3, !IO),
    io.write_string("\n", !IO),
    
    classify_number(7, Class4),
    io.write_string(Class4, !IO),
    io.write_string("\n", !IO).

% Area functions (simplified to integers)
:- func circle_area(int) = int.
circle_area(Radius) = 3 * Radius * Radius.

:- func rectangle_area(int, int) = int.
rectangle_area(Width, Height) = Width * Height.

:- func square_area(int) = int.
square_area(Side) = Side * Side.

% Number classification using if-then-else
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
