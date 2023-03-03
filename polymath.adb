--  with ada.Text_IO; use Ada.Text_IO;
--  with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--  with polynomial; use polynomial;

package body polymath is 

  function addpoly(polyA : in termPtr; polyB : in termPtr) return termPtr is
    first : termPtr := polyA;
    second : termPtr := polyB;
    polyResult : termPtr := null;

    begin

    -- while both of the polynomials are not done: 
    while (first /= null or second /= null) loop

      -- if the second polynomial is larger than the first (-2x+9 vs. 3x^2+2x-5)
      if (second.degree > first.degree) then
        -- the sum term is the second polynomial term
        appendTerm(second.coefficient, second.degree, polyResult);
        second := second.nextTerm;

      -- if the first polynomial is larger than the second (3x^2+2x-5 vs. -2x+9)
      elsif (first.degree > second.degree) then
        -- the sum term is the first polynomial term
        appendTerm(first.coefficient, first.degree, polyResult);
        first := first.nextTerm;

      -- if both polynomails are the same length
      else
        -- the sum term is the sum of the two coefficients
        appendTerm(first.coefficient + second.coefficient, first.degree, polyResult);
        first := first.nextTerm;
        second := second.nextTerm;
      end if;    
    end loop;

    return polyResult;

  end addpoly;

  function subpoly(polyA : in termPtr; polyB : in termPtr) return termPtr is
      second : termPtr := polyB;
      polyResult : termPtr := null;
    begin

    -- swap the coefficient signs of the second polynomial
    while (second /= null) loop
      second.coefficient := second.coefficient * (-1);
      second := second.nextTerm;
    end loop;
    -- reset the head 
    second := polyB;

    -- A-B = A+(-B) 
    polyResult := addpoly(polyA,second);

    -- reset the second polynomial to it's original state
    while (second /= null) loop
      second.coefficient := second.coefficient * (-1);
      second := second.nextTerm;
    end loop;
    second := polyB;

    -- return the result
    return polyResult;
  end subpoly;

end polymath;