##  <#GAPDoc Label="GIT_Fan:example">
##      <Example><![CDATA[
##  gap> Q := HomalgFieldOfRationalsInDefaultCAS( );
##  Q
##  gap> R := GradedRing( Q * "T1..6" );
##  Q[T1,T2,T3,T4,T5,T6]
##  gap> a := GradedLeftSubmodule( "T1*T2+T3*T4+T5*T6", R );
##  <A principal torsion-free (left) ideal given by a cyclic generator>
##  gap> Is_aFace( [ 1 .. 8 ], a );
##  true
##  gap> Is_aFace( [ 7, 8 ], a );
##  false

##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "Orbifolds" );

Q := HomalgFieldOfRationalsInDefaultCAS( );
R := GradedRing( Q * "T1..8" );

SetWeightsOfIndeterminates( R, [ [ 1, 0, 1 ], [ 1, 1, 1 ], [ 0, 1, 1 ], [ 0, -1, 1 ], [ -1, -1, 1 ], [ -1, 0, 1 ], [ 2, 1, 1 ], [ -2, -1, 1 ] ] );

a := GradedLeftSubmodule( "T1*T6+T2*T5+T3*T4+T7*T8", R );

Assert( 0, Is_aFace( [ 1 .. 8 ], a ) );
Assert( 0, not Is_aFace( [ 7, 8 ], a ) );
Assert( 0, Length( OrbitCones( a, 3 ) ) = 72 );

