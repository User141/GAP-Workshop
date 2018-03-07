ColorPrompt(true);
LogTo("workshop.txt");
ProgramCode := function(str)
Exec(Concatenation("cat ", str));
end;
