--  Name: Or Brener
--  Student Id: 1140102
--  CIS*3190 A2 W23

with ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body polylink is

    -- validate that the user input is an integer
    procedure getInteger(num : in out integer) is
      begin
        loop
        begin 
          -- get the input
          get(num);
          return;
          -- if not an integer, throw an exception, and keep asking for input unitl valid
        exception
          when data_error =>
          skip_line;
          put_line("Integer expected, try again");
          end;
        end loop;
    end getInteger;

    procedure readPOLY(leadingTerm : in out termPtr) is
      highestExponent : integer := -1;
      currentExponent : integer := -1;
      coefficient : integer := 0;
      begin

      -- get the highest exponent
      put("Highest exponent: ");
      getInteger(highestExponent);
      
      -- for all terms highest exponent to zero:
      for index in 0..highestExponent loop
        -- get the coefficent 
        currentExponent := highestExponent - index;
        put("Coefficient for exponent" & integer'image(currentExponent) & ": "); 
        getInteger(coefficient);

        -- if the user wants a zero polynomial
        if ((highestExponent = 0) and (coefficient = 0)) then
          leadingTerm := null;
          exit;
        end if;
        -- don't store terms with a coefficient of zero
        if (coefficient /= 0) then
          appendTerm(coefficient, currentExponent, leadingTerm);
        end if;
      end loop;

    end readPOLY;


    procedure writePOLY(leadingTerm: in termPtr) is
        isPositive : boolean := true;
        currentTerm : termPtr := leadingTerm;
        numTerms : integer := 0;
      begin

      if (leadingTerm = null) then
        put_line("No Polynomial -- empty list");
      end if;

      --  for all the terms in the polynomial
      while currentTerm /= null loop

        -- if the coefficient is zero, skip to the next term
        if (currentTerm.coefficient = 0) then
          currentTerm := currentTerm.nextTerm;
        -- otherwise (coefficent != 0): 
        else
          -- increment number of terms & re-initilize isPositive
          numTerms := numTerms + 1;
          isPositive := true;

          -- check if the coefficent is positive or negative
          if (currentTerm.coefficient < 0) then
            isPositive := false;
          end if;
          
          -- add a negaive sign for the leading term if the coefficient is negative 
          if ((numTerms = 1) and (isPositive = false)) then
            put("- ");
          end if;

          -- put a "+" / "-" on all terms after the leading term
          if (numTerms /= 1) then 
            if (isPositive) then
              put("+ ");
            else 
              put("- ");
            end if;
          end if;

          -- print the absolute value of the coefficient
          -- do not print the coefficient if it is 1 (ex: 1x^2 = x^2), UNLESSS it is the last term (5x + 1)
          if ((abs(currentTerm.coefficient) > 1) or (currentTerm.degree = 0)) then
            put(integer'image(abs(currentTerm.coefficient)));
          end if;

          -- print the degree of x
          if (currentTerm.degree > 1) then
            put(" x ^" & integer'image(currentTerm.degree) & "  ");
          elsif (currentTerm.degree = 1) then
            put(" x  ");
          end if;

          -- continue to the next term in the polynomial
          currentTerm := currentTerm.nextTerm;
          
        end if;
      end loop;
      -- print an ending newline
      put_line("");
    end writePOLY;
    
  
end polylink;
