--  Name: Or Brener
--  Student Id: 1140102
--  CIS*3190 A2 W23

package polynomial is


    type term;
    type termPtr is access term;

    -- a node in a linked list (polynomial)
    type term is 
        record
            coefficient: integer;
            degree: integer;
            nextTerm: termPtr;
        end record;

    -- adds a node in the end of the linked list
    procedure appendTerm(coefficient: integer; degree: integer; appendingTerm: in out termPtr);

end polynomial;
