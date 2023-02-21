--  with ada.Text_IO; use Ada.Text_IO;
--  with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with polynomial; use polynomial;

package polymath is
    
    procedure addpoly(polyA : in termPtr; polyB : in termPtr; polyResult : out termPtr);
    --  procedure subpoly(polyA : in termPtr; polyB : in termPtr; polyResult : in out termPtr);
    --  procedure multpoly(polyA : in termPtr; polyB : in termPtr; polyResult : in out termPtr);
    --  procedure evalpoly(polyA : in termPtr; evalNum : in integer; polyResult : in out termPtr);


end polymath;