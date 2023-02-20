with ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--  with polynomial; use polynomial;

package body polylink is 

    procedure readPOLY(leadingTerm : in out termPtr) is
      hightestExponent : integer;
      currentExponent : integer;
      coefficient : integer;
      begin

      put_line("Enter a polynomial");
      put("Highest exponent: ");
      get(hightestExponent);
      
      for index in 0..hightestExponent loop
        currentExponent := hightestExponent - index;
        put("Coefficient for exponent" & integer'image(currentExponent) & ": "); 
        get(coefficient);
        appendTerm(coefficient, currentExponent, leadingTerm);
      end loop;

    end readPOLY;


    procedure writePOLY(currentTerm: in termPtr; numTerms: in integer) is
        isPositive : boolean := true;
        numTermsOutput : constant integer := numTerms + 1;
      begin

      if currentTerm /= null then
        if (currentTerm.coefficient /= 0) then

          if (currentTerm.coefficient < 0) then
            isPositive := false;
          end if;

          if (numTerms /= 1) then 
            if (isPositive) then
              put("+ ");
            else 
              put("- ");
            end if;
          end if;

          put(integer'image(abs(currentTerm.coefficient)));
          
          if (currentTerm.degree > 0) then
            put(" x ^");
            put(integer'image(currentTerm.degree));
            put("  ");
          end if;
        end if;
        writePOLY(currentTerm.nextTerm, numTermsOutput);
      end if;

    end writePOLY;
    

end polylink;