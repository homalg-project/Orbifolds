#############################################################################
##
##  Modules.gi                  Orbifolds package            Mohamed Barakat
##
##  Copyright 2008-2009, Mohamed Barakat, Universität des Saarlandes
##
##  Implementations of procedures for modules.
##
#############################################################################

####################################
#
# methods for operations:
#
####################################

##  <#GAPDoc Label="GroupInvariants">
##  <ManSection>
##    <Oper Arg="G" Name="GroupInvariants"/>
##    <Returns>a list of 2 or 3 homalg matrices</Returns>
##    <Description>
##      Compute the primary, secondary.
##      <Example><![CDATA[
##  gap> QQ := HomalgFieldOfRationalsInDefaultCAS( );;
##  gap> R := QQ * "x,y,z";;
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
##  [ [ z^2, y^2, x^2 ], [ 1, x*y*z ] ]
##  ]]></Example>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##  #rest: , and in the non-modular case the irreducible secondary invariants
##
InstallMethod( GroupInvariants,
        "for homalg rings",
        [ IsMatrixGroup, IsHomalgRing and IsFreePolynomialRing ],
        
  function( G, R )
    local RP, gens;
    
    RP := homalgTable( R );
    
    gens := GeneratorsOfMagmaWithInverses( G );
    
    gens := List( gens, g -> HomalgMatrix( TransposedMat( g ), R ) );
    
    return List( RP!.GroupInvariants( gens ){[1..2]}, EntriesOfHomalgMatrix );
    
end );

