##  <#GAPDoc Label="InvariantRing:example">
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
##  gap> S := InvariantRing( V4, R );
##  Q[I1,I2,I3,I4]/( I1*I2*I3-I4^2 )
##  (weights: [ 2, 2, 2, 3 ])
##  gap> IsCohenMacaulay( S );
##  true
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

Assert( 0, IsCohenMacaulay( S ) );
