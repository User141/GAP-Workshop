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

AvgOrderOfCollection := function(G)
local sum, g;
	sum := 0;
	for g in G do
		sum := sum + Order(g);
	od;
	return sum/Size(G);
end;

AvgOrderOfGroup := function(G)
local cc, sum, c;
cc:=ConjugacyClasses(G);
sum:=0;
for c in cc do
  sum := sum + Order( Representative(c) ) * Size(c);
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

TestOneGroup := G -> IsInt( AvgOrderOfGroup(G) );

TestOneOrder := function(f,n)
local i, G;
for i in [1..NrSmallGroups(n)] do
  Print(n, ":", i, "/", NrSmallGroups(n), "\r");
  G := SmallGroup( n, i );
  if f(G) then
    Print("\n");
    return [n,i];
  fi;
od;
Print("\n");
return fail;
end;

TestAllOrders:=function(f,n)
local i, res;
for i in [2..n] do
  res:=TestOneOrder(f,i);
  if res <> fail then
    return res;
  fi;
od;
return fail;
end;

TestAllOrders:=function(f,n)
local i, res;
for i in [2..n] do
  res:=TestOneOrder(f,i);
  if res <> fail then
    return res;
  fi;
od;
return fail;
end;

TestAllOrdersFrom := function(f,s,n)
local i, res;
for i in [s..n] do
  if not (IsPrimePowerInt(i)) then
  res:=TestOneOrder(f,i);
    if res <> fail then
      return res;
    fi;
  fi;
od;
return fail;
end;

ExerciseTest := function ()
local i;
i := 1536;
while true do
if not (IsPrimePowerInt(i)) then
TestOneOrder(TestOneGroup,i);
fi;
i := i + 1;
od;
end;