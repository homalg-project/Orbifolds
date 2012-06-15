#############################################################################
##
##  Invariants.gd                                          Orbifolds package
##
##  Copyright 2008-2012, Mohamed Barakat, University of Kaiserslautern
##
##  Declarations of procedures for group invariants.
##
#############################################################################

####################################
#
# global functions and operations:
#
####################################

# basic operations:

DeclareOperation( "GroupInvariants",
        [ IsMatrixGroup, IsHomalgRing ] );

DeclareOperation( "InvariantRing",
        [ IsMatrixGroup, IsHomalgRing ] );
