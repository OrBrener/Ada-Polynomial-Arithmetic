--  with ada.Text_IO; use Ada.Text_IO;
--  with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--  with polylink; use polylink;

--  with polynomial; use polynomial;

package body polymath is 

  function addpoly(polyA : in termPtr; polyB : in termPtr) return termPtr is
    first : termPtr := polyA;
    second : termPtr := polyB;
    polyResult : termPtr := null;

    begin

    -- while both of the polynomials are not done: 
    while (first /= null or second /= null) loop

      -- in the case that one of the polynomials = null (no more terms), append the term of the non-null polynomial 
      if (first = null) then
        appendTerm(second.coefficient, second.degree, polyResult);
        second := second.nextTerm;
      elsif (second = null) then
        appendTerm(first.coefficient, first.degree, polyResult);
        first := first.nextTerm;

      -- otherwise, both polynomials still have terms 
      else
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

  function multpoly(polyA : in termPtr; polyB : in termPtr) return termPtr is
      first : termPtr := polyA;
      second : termPtr := polyB;
      temp : termPtr := null;
      polyResult : termPtr := null;
    begin

    -- general formula: each term of first * all of second, then add all like terms 

    -- for all terms in first
    while (first /= null) loop
      -- for all terms in second
      while (second /= null) loop
        -- temp polynomial is first * all of second
        appendTerm (first.coefficient * second.coefficient, first.degree + second.degree, temp);
        second := second.nextTerm;
      end loop;

      --polyResult is the sum of all the temps ( each term of first * all of second)
      if (polyResult = null) then
        while (temp /= null) loop
          appendTerm(temp.coefficient, temp.degree, polyResult);
          temp := temp.nextTerm;
        end loop;
      else
        polyResult := addpoly(polyResult, temp);
      end if;
      
      first := first.nextTerm;
      -- reset the head 
      second := polyB;
      temp := null;
    end loop;
    -- reset the head 
    first := polyA;
    second := polyB;

    -- return the result
    return polyResult;
  end multpoly;

end polymath;