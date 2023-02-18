with Ada.Text_IO; use Ada.Text_IO;

with polynomial; use polynomial;
with polylink; use polylink;


procedure poly is    

    leadingTerm : termPtr := null;
    firstInt : integer := 1;

    begin

    Put_Line("PROGRAM START");

    appendTerm(3, 5, leadingTerm);
    appendTerm(-2, 3, leadingTerm);
    appendTerm(1, 2, leadingTerm);
    appendTerm(4, 0, leadingTerm);
    writePOLY(leadingTerm, firstInt);


end poly;