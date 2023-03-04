with Ada.Text_IO; use Ada.Text_IO;

with polynomial; use polynomial;
with polylink; use polylink;
with polymath; use polymath;


procedure poly is    

    leadingTerm : termPtr := null;
    output : termPtr := null;
    test : termPtr := null;
    begin

    Put_Line("PROGRAM START");

    readPOLY(leadingTerm);
    writePOLY(leadingTerm);
    readPOLY(test);
    writePOLY(test);
    output := multpoly(leadingTerm, test);
    Put_Line ("Multiplying:");
    writePOLY(output);



end poly;