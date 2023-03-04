--  Name: Or Brener
--  Student Id: 1140102
--  CIS*3190 A2 W23

with polynomial; use polynomial;

package polylink is
    
    procedure readPOLY(leadingTerm : in out termPtr);
    procedure writePOLY(leadingTerm: in termPtr);


end polylink;
