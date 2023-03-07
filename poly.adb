--  Name: Or Brener
--  Student Id: 1140102
--  CIS*3190 A2 W23

with Ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with polynomial; use polynomial;
with polylink; use polylink;
with polymath; use polymath;


procedure poly is    
    -- define variables
    menuChoice : integer := 0;
    poly1 : termPtr;
    poly2 : termPtr;
    polyResult : termPtr;
    evalNum : integer;
    evalResult : integer;
    begin

    -- keep looping the menu until exit option (5) is chosen:
    while (menuChoice /= 5) loop
        -- reset all the polynomials and eval numbers
        poly1 := null;
        poly2 := null;
        polyResult := null;
        evalNum := 0;
        evalResult := 0;

        -- print the menu
        Put_Line("");
        Put_Line("POLYNOMIAL MENU:");
        Put_Line("  1. Add 2 polynomials");
        Put_Line("  2. Subtract 2 polynomials");
        Put_Line("  3. Multiply 2 polynomials");
        Put_Line("  4. Evaluate a polynomial");
        Put_Line("  5. Exit program");
        Put_Line("PLEASE ENTER YOUR CHOICE: ");
        -- get menu choice from user
        getInteger(menuChoice);
        Put_Line("");

        -- depending on the menu choice, do the requested action
        case menuChoice is
            -- add            
            when 1 =>
                put_line("ADDING 2 POLYNOMIALS");
                put_line("Must first input 2 polynomials");
                put_line("");

                put_line("Input first polynomial");
                readPOLY(poly1);
                put_line("");
                put_line("Polynomial 1:");
                writePOLY(poly1);
                put_line("");

                put_line("Input second polynomial");
                readPOLY(poly2);
                put_line("");
                put_line("Polynomial 2:");
                writePOLY(poly2);
                put_line("");

                polyResult := addpoly(poly1,poly2);
                put_line("Sum of the polynomials:");
                writePOLY(polyResult);

            -- subtract
            when 2 =>
                put_line("SUBTRACTING 2 POLYNOMIALS");
                put_line("Must first input 2 polynomials");
                put_line("");

                put_line("Input first polynomial");
                readPOLY(poly1);
                put_line("");
                put_line("Polynomial 1:");
                writePOLY(poly1);
                put_line("");

                put_line("Input second polynomial");
                readPOLY(poly2);
                put_line("");
                put_line("Polynomial 2:");
                writePOLY(poly2);
                put_line("");

                polyResult := subpoly(poly1,poly2);
                put_line("Differnece of the polynomials:");
                writePOLY(polyResult);
            
            -- multiply
            when 3 =>
                put_line("MULTIPLYING 2 POLYNOMIALS");
                put_line("Must first input 2 polynomials");
                put_line("");

                put_line("Input first polynomial");
                readPOLY(poly1);
                put_line("");
                put_line("Polynomial 1:");
                writePOLY(poly1);
                put_line("");

                put_line("Input second polynomial");
                readPOLY(poly2);
                put_line("");
                put_line("Polynomial 2:");
                writePOLY(poly2);
                put_line("");

                polyResult := multpoly(poly1,poly2);
                put_line("Product of the polynomials:");
                writePOLY(polyResult);

            -- evaluate
            when 4 =>
                put_line("EVALUATE A POLYNOMIAL");
                put_line("Must first input a polynomial and the variable to evaluate it with");
                put_line("");

                put_line("Input polynomial");
                readPOLY(poly1);
                put_line("");
                put_line("Polynomial:");
                writePOLY(poly1);
                put_line("");

                put_line("Input value to evaluate with (x=?)");
                getInteger(evalNum);
                put_line("");
                put_line("x =" & integer'image(evalNum));
                put_line("");

                evalResult := evalpoly(poly1,evalNum);
                put_line("Evaluate polynomial =" & integer'image(evalResult));

            -- end the program
            when 5 =>
                put_line("THANKS FOR USING THE PROGRAM, EXITING...");

            -- all other integers:
            when others =>
                Put_Line("NOT A VALID INPUT, TRY AGAIN");
        end case;
    end loop;

end poly;
