with Ada.Text_IO; use Ada.Text_IO;

with polynomial; use polynomial;
with polylink; use polylink;


procedure poly is    

    leadingTerm : termPtr := null;
    
    begin

    Put_Line("PROGRAM START");

    readPOLY(leadingTerm);

    writePOLY(leadingTerm, 1);


end poly;