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
    addpoly(leadingTerm, test, output);
    Put_Line ("Adding");
    writePOLY(output);


end poly;