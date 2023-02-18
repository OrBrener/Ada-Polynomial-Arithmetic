package body polynomial is 

    procedure appendTerm(coefficient: Integer; degree: Integer; appendingTerm: in out termPtr) is
        begin
        
        if appendingTerm = null then
            appendingTerm := new term'(coefficient,degree,null);
        else 
            if appendingTerm.nextTerm /= null then
                appendTerm(coefficient, degree, appendingTerm.nextTerm);
            else
                appendingTerm.nextTerm := new term'(coefficient,degree,null);
            end if;
        end if;
        
    end appendTerm;
    

end polynomial;


