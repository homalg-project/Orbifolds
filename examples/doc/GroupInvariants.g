##  <#GAPDoc Label="GroupInvariants:example">
##      <Example><![CDATA[
##  gap> Q := HomalgFieldOfRationalsInDefaultCAS( );
##  Q
##  gap> R := GradedRing( Q * "x,y,z" );
##  Q[x,y,z]
##  (weights: yet unset)
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
##  gap> GroupInvariants( V4, R );
##  [ [ z^2, y^2, x^2 ], [ 1, x*y*z ], [ x*y*z ] ]
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Orbifolds" );

Q := HomalgFieldOfRationalsInDefaultCAS( );
R := GradedRing( Q * "x,y,z" );
V4 := [
       [ [ -1, 0, 0 ],
         [  0, 1, 0 ],
         [  0, 0,-1 ] ],
       
       [ [ -1, 0, 0 ],
         [  0,-1, 0 ],
         [  0, 0, 1 ] ]
       ];

V4 := Group( V4 );

S := InvariantRing( V4, R );

