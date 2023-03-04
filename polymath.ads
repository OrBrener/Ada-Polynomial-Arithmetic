--  with ada.Text_IO; use Ada.Text_IO;
--  with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with polynomial; use polynomial;

package polymath is
    
    function addpoly(polyA : in termPtr; polyB : in termPtr) return termPtr;
    function subpoly(polyA : in termPtr; polyB : in termPtr) return termPtr;
    function multpoly(polyA : in termPtr; polyB : in termPtr) return termPtr;
    --  procedure evalpoly(polyA : in termPtr; evalNum : in integer; polyResult : out termPtr);


end polymath;