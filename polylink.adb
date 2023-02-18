with ada.Text_IO; use Ada.Text_IO;
--  with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--  with polynomial; use polynomial;

package body polylink is 

    procedure readPOLY is
      begin

      put_line("READPOLY WORKS");

    end readPOLY;


    procedure writePOLY(currentTerm: in termPtr) is
      begin
      
      if currentTerm /= null then
        put(integer'image(currentTerm.coefficient) & "x^" & integer'image(currentTerm.degree));
        writePOLY(currentTerm.nextTerm);
      end if;
      
    end writePOLY;
    

end polylink;