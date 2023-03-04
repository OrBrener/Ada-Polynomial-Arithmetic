--  Name: Or Brener
--  Student Id: 1140102
--  CIS*3190 A2 W23

package body polynomial is 

    procedure appendTerm(coefficient: Integer; degree: Integer; appendingTerm: in out termPtr) is
        begin
        
        -- linked list is empty
        if appendingTerm = null then
            appendingTerm := new term'(coefficient,degree,null);
        -- otherwise, linked list is not empty
        else 
            -- go to the last node in the list (so that it will be appended to the end)
            if appendingTerm.nextTerm /= null then
                appendTerm(coefficient, degree, appendingTerm.nextTerm);
            else
                appendingTerm.nextTerm := new term'(coefficient,degree,null);
            end if;
        end if;
        
    end appendTerm;
    

end polynomial;
