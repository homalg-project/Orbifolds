#############################################################################
##
##  GIT-fan.gi                                             Orbifolds package
##
##  Copyright 2008-2012, Mohamed Barakat, University of Kaiserslautern
##                       Sebastian Gutsche, RWTH Aachen
##                       Simon Keicher, University of Tübingen
##
##  Implementations of procedures for GIT-fans.
##
#############################################################################

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( Is_aFace,
        "for a face and an ideal",
        [ IsList, IsHomalgModule and ConstructedAsAnIdeal ],
        
  function( gamma_0, a )
    local R, indets, r, indets0, R0, f, zero, map, a0;
    
    if IsGradedSubmoduleRep( a ) then
        a := UnderlyingModule( a );
    fi;
    
    R := HomalgRing( a );
    
    indets := Indeterminates( R );
    
    r := Length( indets );
    
    indets0 := List( indets{ gamma_0 }, String );
    
    R0 := CoefficientsRing( R ) * indets0;
    
    zero := Zero( R0 );
    
    map := RingMap( List( [ 1 .. r ],
                   function( i ) if i in gamma_0 then return indets[i]; else return zero; fi; end ), R, R0 );
    
    a0 := Pullback( map, a );
    
    if indets0 = [ ] then
        f := One( R0 );
    else
        f := JoinStringsWithSeparator( indets0, "*" ) / R0;
    fi;
    
    return not RadicalIdealMembership( f, a0 );
    
end );

##
InstallMethod( aFaces,
        "for an ideal and an integer",
        [ IsHomalgModule and ConstructedAsAnIdeal, IsInt ],
        
  function( a, i )
    local r, comb;
    
    r := Length( Indeterminates( HomalgRing( a ) ) );
    
    comb := Combinations( [ 1 .. r ], i );
    
    return Filtered( comb, gamma_0 -> Is_aFace( gamma_0, a ) );
    
end );

##
InstallMethod( aFaces,
        "for an ideal",
        [ IsHomalgModule and ConstructedAsAnIdeal ],
        
  function( a )
    local r;
    
    r := Length( Indeterminates( HomalgRing( a ) ) );
    
    return Concatenation( List( [ 0 .. r ], i -> aFaces( a, i ) ) );
    
end );

##
InstallMethod( OrbitCones,
        "for a homogeneous ideal and an integer",
        [ IsGradedSubmoduleRep and ConstructedAsAnIdeal, IsInt ],
        
  function( a, i )
    local R, Q, r, afaces, Qafaces, cones, Cl;
    
    R := HomalgRing( a );
    
    Q := WeightsOfIndeterminates( R );

    Q := List( Q, UnderlyingListOfRingElements );
    
    r := Length( Indeterminates( R ) );
    
    afaces := Concatenation( List( [ i .. r ], j -> aFaces( a, j ) ) );
    
    Qafaces := List( afaces, gamma_0 -> Q{ gamma_0 } );
    
    Qafaces := Set( Qafaces );
    
    Qafaces := Filtered( Qafaces, a -> RankMat( a ) = i );
    
    cones := List( Qafaces, Cone );
    
    Cl := DegreeGroup( R );
    
    Perform( cones, function( sigma ) SetContainingGrid( sigma, Cl ); end );
    
    cones := DuplicateFreeList( cones );
    
    if i = RankMat( Q ) then
        SetOrbitCones( a, cones );
    fi;
    
    return cones;
    
end );

##
InstallMethod( OrbitCones,
        "for a homogeneous ideal",
        [ IsGradedSubmoduleRep and ConstructedAsAnIdeal ],
        
  function( a )
    local R, Q;
    
    R := HomalgRing( a );
    
    Q := WeightsOfIndeterminates( R );

    Q := List( Q, UnderlyingListOfRingElements );

    return OrbitCones( a, RankMat( Q ) );
    
end );

##
InstallMethod( GIT_Cone,
        "for a homogeneous ideal and a weight list",
        [ IsGradedSubmoduleRep and ConstructedAsAnIdeal, IsList ],
        
  function( a, w )
    local cones;
    
    cones := OrbitCones( a );
    
    cones := Filtered( cones, omega -> w in omega );
    
    if cones = [ ] then
        Error( "w (the second argument) must in contained in the cone spanned by the weights\n" );
    fi;
    
    return Intersect( cones );
    
end );
