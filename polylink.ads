--  with ada.Text_IO; use Ada.Text_IO;
--  with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with polynomial; use polynomial;

package polylink is
    
    procedure readPOLY(leadingTerm : in out termPtr);
    procedure writePOLY(leadingTerm: in termPtr);


end polylink;