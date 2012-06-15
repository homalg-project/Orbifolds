#############################################################################
##
##  Invariants.gi                                          Orbifolds package
##
##  Copyright 2008-2012, Mohamed Barakat, University of Kaiserslautern
##
##  Implementations of procedures for group invariants.
##
#############################################################################

####################################
#
# methods for operations:
#
####################################

##  <#GAPDoc Label="GroupInvariants">
##  <ManSection>
##    <Oper Arg="G, R" Name="GroupInvariants"/>
##    <Returns>a list of lists of ring elements</Returns>
##    <Description>
##      Compute the primary, secondary, and in the non-modular case the irreducible secondary invariants
##      of <A>G</A> acting on the ring <A>R</A>.
##      <#Include Label="GroupInvariants:example">
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
InstallMethod( GroupInvariants,
        "for homalg rings",
        [ IsMatrixGroup, IsHomalgRing and IsFreePolynomialRing ],
        
  function( G, R )
    local RP, gens;
    
    RP := homalgTable( R );
    
    gens := GeneratorsOfMagmaWithInverses( G );
    
    gens := List( gens, g -> HomalgMatrix( TransposedMat( g ), R ) );
    
    return List( RP!.GroupInvariants( gens ){[ 1 .. 3 ]}, EntriesOfHomalgMatrix );
    
end );

##
InstallMethod( GroupInvariants,
        "for homalg rings",
        [ IsMatrixGroup, IsHomalgGradedRingRep and IsFreePolynomialRing ],
        
  function( G, S )
    local R, inv;
    
    if IsBound( G!.group_invariants ) then
        inv := First( G!.group_invariants, p -> IsIdenticalObj( p[1], S ) )[2];
        if inv <> fail then
            return inv;
        fi;
    else
        G!.group_invariants := [ ];
    fi;
    
    R := UnderlyingNonGradedRing( S );
    
    inv := GroupInvariants( G, R );
    
    inv := List( inv, a -> List( a, I -> I / S ) );
    
    Add( G!.group_invariants, [ S, inv ] );
    
    return inv;
    
end );

##  <#GAPDoc Label="InvariantRing">
##  <ManSection>
##    <Oper Arg="G, R" Name="InvariantRing"/>
##    <Returns>a homalg ring</Returns>
##    <Description>
##      Compute the invariant ring of <A>G</A> as a subring of <A>R</A>.
##      <#Include Label="InvariantRing:example">
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
##
InstallMethod( InvariantRing,
        "for homalg rings",
        [ IsMatrixGroup, IsHomalgRing and IsFreePolynomialRing ],
        
  function( G, R )
    local inv, data, n, k, S, Hilbert_map;
    
    inv := GroupInvariants( G, R );
    
    data := First( G!.group_invariants, p -> IsIdenticalObj( p[1], R ) );
    
    if Length( data ) = 3 then
        return data[3];
    fi;
    
    inv := Concatenation( inv[1], inv[3] );
    
    n := Length( inv );
    
    k := CoefficientsRing( R );
    
    S := k * Concatenation( "I1..", String( n ) );
    
    if IsHomalgGradedRingRep( R ) then
        S := GradedRing( S );
        SetWeightsOfIndeterminates( S, List( inv, Degree ) );
    fi;
    
    Hilbert_map := RingMap( inv, S, R );
    
    S := S / KernelSubobject( Hilbert_map );
    
    ## get the weights from the ambient ring
    if IsHomalgGradedRingRep( S ) then
        WeightsOfIndeterminates( S );
    fi;
    
    S!.Group := G;
    S!.HilbertMap := Hilbert_map;
    
    Add( data, S );
    
    return S;
    
end );
