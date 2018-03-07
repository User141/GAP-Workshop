GetMaxLetters := function(l)
local max,list,e;
max := 0;
list := [];
for e in l do
	if e[2] = max then
       		Add(list,e[1]);
	fi;
 	if e[2] > max then
		list := [e[1]];
        max := e[2];
	fi;
od;
return list;
end;

AvgOrderOfGroup := function(G)
local sum, g;
	sum := 0;
	for g in G do
		sum := sum + Order(g);
	od;
	return sum/Size(G);
end;

getKommutatorOfGroup := function(G)
local Set,i,j;
Set := [];
for i in G do
	for j in G do
		Add(Set, i*j*i^(-1)*j^(-1));
	od;
od;
Set := Set(Set);
return Set;
end;

AvgOrderOfKommutator := function(G)
local M;
M := getKommutatorOfGroup(G);
return AvgOrderOfGroup(M);
end;
