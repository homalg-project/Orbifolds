#############################################################################
##
##  GIT-fan.gd                                             Orbifolds package
##
##  Copyright 2008-2012, Mohamed Barakat, University of Kaiserslautern
##                       Sebastian Gutsche, RWTH Aachen
##                       Simon Keicher, University of Tübingen
##
##  Declarations of procedures for GIT-fans.
##
#############################################################################

####################################
#
# global functions and operations:
#
####################################

# basic operations:

DeclareOperationWithDocumentation( "Is_aFace",
        [ IsList, IsHomalgModule ],
        [ "check if the torus orbit corresponding to <A>gamma_0</A> meets the vanishing set of the ideal <A>a</A>" ],
        "<C>true</C> or <C>false</C>",
        "gamma_0, a",
        [ "GIT-fans", "a-faces" ] );

DeclareOperationWithDocumentation( "aFaces",
        [ IsHomalgModule, IsInt ],
        [ "Compute the torus orbits of dimension <A>i</A> intersecting the vanishing set of <A>a</A>" ],
        "a list of lists of indices",
        "a,i",
        [ "GIT-fans", "a-faces" ] );

DeclareOperationWithDocumentation( "aFaces",
        [ IsHomalgModule ],
        [ "Compute the torus orbits intersecting the vanishing set of <A>a</A>" ],
        "a list of lists of indices",
        "a",
        [ "GIT-fans", "a-faces" ] );

DeclareOperationWithDocumentation( "OrbitCones",
        [ IsHomalgGradedModule, IsInt ],
        [ "Compute the orbit cones of the homogeneous ideal <A>a</A>" ],
        "a list of cones",
        "a,i",
        [ "GIT-fans", "Orbit_cones" ] );

DeclareOperationWithDocumentation( "OrbitCones",
        [ IsHomalgGradedModule ],
        [ "Compute the full dimensional orbit cones of the homogeneous ideal <A>a</A>" ],
        "a list of cones",
        "a",
        [ "GIT-fans", "Orbit_cones" ] );

DeclareOperationWithDocumentation( "GIT_Cone",
        [ IsHomalgGradedModule, IsList ],
        [ "Compute the GIT cone of the given vector <A>w</A> w.r.t. the homogeneous ideal <A>a</A>" ],
        "a cone",
        "a, w",
        [ "GIT-fans", "GIT-cone" ] );

DeclareOperationWithDocumentation( "GIT_Fan",
        [ IsHomalgGradedModule ],
        [ "Compute the GIT fan of the vanishing set of the homogeneous ideal <A>a</A>",
          "under the action of the of the torus corresponding to the grading of the the underlying ring" ],
        "a fan",
        "a",
        [ "GIT-fans", "GIT-fan" ] );
