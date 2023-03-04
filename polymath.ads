--  Name: Or Brener
--  Student Id: 1140102
--  CIS*3190 A2 W23

with polynomial; use polynomial;

package polymath is
    
    function addpoly(polyA : in termPtr; polyB : in termPtr) return termPtr;
    function subpoly(polyA : in termPtr; polyB : in termPtr) return termPtr;
    function multpoly(polyA : in termPtr; polyB : in termPtr) return termPtr;
    function evalpoly(poly : in termPtr; x : in integer) return integer;


end polymath;