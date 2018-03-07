gap> n := 9;
9
gap> S := SymmetricGroup(n);
Sym( [ 1 .. 9 ] )
gap> A := AlternatingGroup(n);
Alt( [ 1 .. 9 ] )
gap> D := DihedralGroup(2*n); 
<pc group of size 18 with 3 generators>
gap> AvgOrderOfGroup(S);
3291487/362880
gap> AvgOrderOfGroup(A);
1516831/181440
gap> AvgOrderOfGroup(D);
79/18
