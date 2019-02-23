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

#! @Chapter GIT-fans

#! @Section a-faces

#! @Description
#!  Check if the torus orbit corresponding to <A>gamma_0</A> meets the vanishing set of the ideal <A>a</A>.
#! @Arguments gamma_0, a
#! @Returns <C>true</C> or <C>false</C>
DeclareOperation( "Is_aFace",
        [ IsList, IsHomalgModule ] );


#! @Description
#!  Compute the torus orbits intersecting the vanishing set of <A>a</A>.
#! @Arguments a
#! @Returns a list of lists of indices
DeclareAttribute( "aFaces",
        IsHomalgModule );

#! @Description
#!  Compute the torus orbits of dimension <A>i</A> intersecting the vanishing set of <A>a</A>.
#! @Arguments a,i
#! @Returns a list of lists of indices
DeclareOperation( "aFaces",
        [ IsHomalgModule, IsInt ] );

#! @Section Orbit cones

#! @Description
#!  Compute the full dimensional orbit cones of the homogeneous ideal <A>a</A>.
#! @Arguments a
#! @Returns a list of cones
DeclareAttribute( "OrbitCones",
        IsHomalgGradedModule );

#! @Description
#!  Compute the orbit cones of the homogeneous ideal <A>a</A>.
#! @Arguments a,i
#! @Returns a list of cones
DeclareOperation( "OrbitCones",
        [ IsHomalgGradedModule, IsInt ] );

#! @Section GIT-cone

#! @Description
#!  Compute the GIT cone of the given vector <A>w</A> w.r.t. the homogeneous ideal <A>a</A>.
#! @Arguments a, w
#! @Returns a cone
DeclareOperation( "GIT_Cone",
        [ IsHomalgGradedModule, IsList ] );

#! @Description
#!  Compute the GIT cone of the given vector <A>w</A> w.r.t. the homogeneous ideal <A>a</A>.
#! @Arguments a, w
#! @Returns a cone
DeclareOperation( "GIT_Cone",
        [ IsHomalgGradedModule, IsHomalgModuleElement ] );

#! @Section GIT-fan

#! @Description
#!  Compute the GIT fan of the vanishing set of the homogeneous ideal <A>a</A>
#!  under the action of the of the torus corresponding to the grading of the the underlying ring.
#! @Arguments a
#! @Returns a fan
DeclareAttribute( "GIT_Fan",
        IsHomalgGradedModule );
