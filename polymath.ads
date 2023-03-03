--  with ada.Text_IO; use Ada.Text_IO;
--  with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with polynomial; use polynomial;

package polymath is
    
    procedure addpoly(polyA : in termPtr; polyB : in termPtr; polyResult : out termPtr);
    function subpoly(polyA : in termPtr; polyB : in termPtr) return termPtr;
    --  procedure multpoly(polyA : in termPtr; polyB : in termPtr; polyResult : out termPtr);
    --  procedure evalpoly(polyA : in termPtr; evalNum : in integer; polyResult : out termPtr);


end polymath;