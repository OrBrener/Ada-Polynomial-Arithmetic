package polynomial is

type term;
    type termPtr is access term;

    type term is 
        record
            coefficient: Integer;
            degree: Integer;
            nextTerm: termPtr;
        end record;

    procedure appendTerm(coefficient: Integer; degree: Integer; appendingTerm: in out termPtr);

end polynomial;