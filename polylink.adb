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


    procedure writePOLY(leadingTerm: in termPtr) is
        isPositive : boolean := true;
        currentTerm : termPtr := leadingTerm;
        numTerms : integer := 0;
      begin

      while currentTerm /= null loop
        numTerms := numTerms + 1;
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
          elsif (currentTerm.degree = 0) then
            put_line("");
          end if;
        end if;

        currentTerm := currentTerm.nextTerm;
      end loop;
    end writePOLY;
    

end polylink;