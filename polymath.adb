--  with ada.Text_IO; use Ada.Text_IO;
--  with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--  with polynomial; use polynomial;

package body polymath is 

  procedure addpoly(polyA : in termPtr; polyB : in termPtr; polyResult : out termPtr) is
    first : termPtr := polyA;
    second : termPtr := polyB;

    begin
    while (first /= null or second /= null) loop

      if (second.degree > first.degree) then
        appendTerm(second.coefficient, second.degree, polyResult);

        second := second.nextTerm;

      elsif (first.degree > second.degree) then
        appendTerm(first.coefficient, first.degree, polyResult);

        first := first.nextTerm;

      else
        appendTerm(first.coefficient + second.coefficient, first.degree, polyResult);

        first := first.nextTerm;
        second := second.nextTerm;
      end if;    
    end loop;

  end addpoly;

end polymath;