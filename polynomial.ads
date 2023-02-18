package polynomial is

type term;
    type termPtr is access term;

    type term is 
        record
            coefficient: integer;
            degree: integer;
            nextTerm: termPtr;
        end record;

    procedure appendTerm(coefficient: integer; degree: integer; appendingTerm: in out termPtr);

end polynomial;