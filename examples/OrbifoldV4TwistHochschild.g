##  <#GAPDoc Label="OrbifoldV4TwistHochschild">
##  <Section Label="OrbifoldV4TwistHochschild">
##  <Heading>Hochschild cohomology of a V4 global quotient orbifold (with twist)</Heading>
##  <Example><![CDATA[
##  gap> QQ := HomalgFieldOfRationalsInDefaultCAS( );;
##  gap> R := QQ * "x,y,z";;
##  ]]></Example>
## The double of <M>R</M>: <M>R^e := R \otimes_k R^{op}</M>:
##  <Example><![CDATA[
##  gap> Re := R * "X,Y,Z";;
##  gap> Re!.ByASmallerPresentation := true;
##  true
##  ]]></Example>
## The sum of the nontrivial linear characters of the Klein four group <M>V_4=\{1,a,b,c\}</M>:
##  <Example><![CDATA[
##  gap> V4 := [
##  > [ [ -1, 0, 0 ],
##  >   [  0, 1, 0 ],
##  >   [  0, 0,-1 ] ],
##  > 
##  > [ [ -1, 0, 0 ],
##  >   [  0,-1, 0 ],
##  >   [  0, 0, 1 ] ]
##  > ];;
##  gap> V4 := Group( V4 );;
##  gap> gens := GeneratorsOfMagmaWithInverses( V4 );
##  [ [ [ -1, 0, 0 ], [ 0, 1, 0 ], [ 0, 0, -1 ] ], [ [ -1, 0, 0 ], [ 0, -1, 0 ], [ 0, 0, 1 ] ] ]
##  gap> a := HomalgMatrix( gens[1], QQ );
##  <A 3 x 3 matrix over an external ring>
##  gap> b := HomalgMatrix( gens[2], QQ );
##  <A 3 x 3 matrix over an external ring>
##  gap> c := a * b;
##  <An unevaluated 3 x 3 matrix over an external ring>
##  gap> xyz := HomalgMatrix( "[ x, y, z ]", 3, 1, Re );
##  <A 3 x 1 matrix over an external ring>
##  gap> XYZ := HomalgMatrix( "[ X, Y, Z ]", 3, 1, Re );
##  <A 3 x 1 matrix over an external ring>
##  ]]></Example>
##  Define <M>R</M> as a module over its double <M>R^e</M>:
##  <Example><![CDATA[
##  gap> R1 := xyz - XYZ;;
##  gap> R1 := LeftPresentation( R1 );
##  <A cyclic left module presented by 3 relations for a cyclic generator>
##  gap> Display( R1 );
##  Q[x,y,z][X,Y,Z]/< x-X, y-Y, z-Z >
##  ]]></Example>
##  Express the <M>V_4</M> over <A>Re</A>:
##  <Example><![CDATA[
##  gap> A := ( Re * a );;
##  gap> B := ( Re * b );;
##  gap> C := ( Re * c );;
##  ]]></Example>
##  Finally define the twisted modules. <Br/><Br/>
##  The module <M>Ra</M>:
##  <Example><![CDATA[
##  gap> Ra := xyz - A * XYZ;;
##  gap> Ra := LeftPresentation( Ra );
##  <A cyclic left module presented by 3 relations for a cyclic generator>
##  gap> Display( Ra );
##  Q[x,y,z][X,Y,Z]/< x+X, y-Y, z+Z >
##  ]]></Example>
##  The module <M>Rb</M>:
##  <Example><![CDATA[
##  gap> Rb := xyz - B * XYZ;;
##  gap> Rb := LeftPresentation( Rb );
##  <A cyclic left module presented by 3 relations for a cyclic generator>
##  gap> Display( Rb );
##  Q[x,y,z][X,Y,Z]/< x+X, y+Y, z-Z >
##  ]]></Example>
##  The module <M>Rb</M>:
##  <Example><![CDATA[
##  gap> Rc := xyz - C * XYZ;;
##  gap> Rc := LeftPresentation( Rc );
##  <A cyclic left module presented by 3 relations for a cyclic generator>
##  gap> Display( Rc );
##  Q[x,y,z][X,Y,Z]/< x-X, y+Y, z+Z >
##  ]]></Example>
##  The Hochschild cohomologies <M>HH^*(R,R\sigma)</M>, <M>\sigma \in V_4</M>. <Br/><Br/>
##  <M>HH^*(R,R)</M>:
##  <Log><![CDATA[
##  gap> HHRR1 := Ext( R1, R1 );
##  <A graded cohomology object consisting of 4 right modules at degrees [ 0 .. 3 ]>
##  gap> Display( HHRR1 );
##  ---------------------------
##  at cohomology degree: 0
##  Q[x,y,z][X,Y,Z]/< z-Z, y-Y, x-X >
##  ---------------------------
##  at cohomology degree: 1
##  z-Z,0,  0,  y-Y,0,  0,  x-X,0,  0, 
##  0,  z-Z,0,  0,  y-Y,0,  0,  x-X,0, 
##  0,  0,  z-Z,0,  0,  y-Y,0,  0,  x-X
##  Cokernel of the map
##  
##  R^(9x1) --> R^(3x1), ( for R := Q[x,y,z][X,Y,Z] )
##  
##  currently represented by the above matrix
##  ---------------------------
##  at cohomology degree: 2
##  z-Z,0,  0,  y-Y,0,  0,  x-X,0,  0, 
##  0,  z-Z,0,  0,  y-Y,0,  0,  x-X,0, 
##  0,  0,  z-Z,0,  0,  y-Y,0,  0,  x-X
##  Cokernel of the map
##  
##  R^(9x1) --> R^(3x1), ( for R := Q[x,y,z][X,Y,Z] )
##  
##  currently represented by the above matrix
##  ---------------------------
##  at cohomology degree: 3
##  Q[x,y,z][X,Y,Z]/< z-Z, y-Y, x-X >
##  ---------------------------
##  ]]></Log>
##  <M>HH^*(R,Ra)</M>:
##  <Log><![CDATA[
##  gap> HHRRa := Ext( R1, Ra );
##  <A graded cohomology object consisting of 4 right modules at degrees [ 0 .. 3 ]>
##  gap> Display( HHRRa );
##  ---------------------------
##  at cohomology degree: 0
##  0
##  ---------------------------
##  at cohomology degree: 1
##  0
##  ---------------------------
##  at cohomology degree: 2
##  Q[x,y,z][X,Y,Z]/< Z, X, z, y-Y, x >
##  ---------------------------
##  at cohomology degree: 3
##  Q[x,y,z][X,Y,Z]/< Z, X, z, y-Y, x >
##  ---------------------------
##  ]]></Log>
##  <M>HH^*(R,Rb)</M>:
##  <Log><![CDATA[
##  gap> HHRRb := Ext( R1, Rb );
##  <A graded cohomology object consisting of 4 right modules at degrees [ 0 .. 3 ]>
##  gap> Display( HHRRb );
##  ---------------------------
##  at cohomology degree: 0
##  0
##  ---------------------------
##  at cohomology degree: 1
##  0
##  ---------------------------
##  at cohomology degree: 2
##  Q[x,y,z][X,Y,Z]/< Y, X, z-Z, y, x >
##  ---------------------------
##  at cohomology degree: 3
##  Q[x,y,z][X,Y,Z]/< Y, X, z-Z, y, x >
##  ---------------------------
##  ]]></Log>
##  <M>HH^*(R,Rc)</M>:
##  <Log><![CDATA[
##  gap> HHRRc := Ext( R1, Rc );
##  <A graded cohomology object consisting of 4 right modules at degrees [ 0 .. 3 ]>
##  gap> Display( HHRRc );
##  ---------------------------
##  at cohomology degree: 0
##  0
##  ---------------------------
##  at cohomology degree: 1
##  0
##  ---------------------------
##  at cohomology degree: 2
##  Q[x,y,z][X,Y,Z]/< Z, Y, z, y, x-X >
##  ---------------------------
##  at cohomology degree: 3
##  Q[x,y,z][X,Y,Z]/< Z, Y, z, y, x-X >
##  ---------------------------
##  ]]></Log>
##  <M>HH^*(R,R)^{V_4}\cong R^{V_4}</M>:
##  <Example><![CDATA[
##  gap> GroupInvariants( V4, R );
##  [ [ z^2, y^2, x^2 ], [ 1, x*y*z ] ]
##  ]]></Example>
##  </Section>
##  <#/GAPDoc>

LoadPackage( "Orbifolds" );

QQ := HomalgFieldOfRationalsInDefaultCAS( );
R := QQ * "x,y,z";

## the double of R: R^\mathrm{e} := R \otimes_k R^\mathrm{op}
Re := R * "X,Y,Z";

Re!.ByASmallerPresentation := true;

## the sum of the nontrivial linear characters of the Klein four group V4:

V4 := [
[ [ -1, 0, 0 ],
  [  0, 1, 0 ],
  [  0, 0,-1 ] ],

[ [ -1, 0, 0 ],
  [  0,-1, 0 ],
  [  0, 0, 1 ] ]
];

V4 := Group( V4 );

gens := GeneratorsOfMagmaWithInverses( V4 );

a := HomalgMatrix( gens[1], QQ );
b := HomalgMatrix( gens[2], QQ );
c := a * b;

xyz := HomalgMatrix( "[ x, y, z ]", 3, 1, Re );
XYZ := HomalgMatrix( "[ X, Y, Z ]", 3, 1, Re );


LoadPackage( "Modules" );

## the twisted modules:
R1 := xyz - XYZ;
R1 := LeftPresentation( R1 );

## as matrices over Re
A := ( Re * a );
B := ( Re * b );
C := ( Re * c );

Ra := xyz - A * XYZ;
Ra := LeftPresentation( Ra );

Rb := xyz - B * XYZ;
Rb := LeftPresentation( Rb );

Rc := xyz - C * XYZ;
Rc := LeftPresentation( Rc );

## the Hochschild cohomologies:
HHRR1 := Ext( R1, R1 );

HHRRa := Ext( R1, Ra );

HHRRb := Ext( R1, Rb );

HHRRc := Ext( R1, Rc );

