#############################################################################
##
##  SingularTools.gi            Orbifolds package            Mohamed Barakat
##
##  Copyright 2008-2009, Mohamed Barakat, Universität des Saarlandes
##
##  Implementations for the rings provided by Singular.
##
#############################################################################

####################################
#
# global variables:
#
####################################

InstallValue( OrbifoldsHomalgTableForSingularTools,
        
        rec(
               GroupInvariants :=
                 function( group_gens )
                   local R, P, S, IS;
                   
                   R := HomalgRing( group_gens[1] );
                   
                   P := HomalgVoidMatrix( "unknown", 1, R );
                   S := HomalgVoidMatrix( "unknown", 1, R );
                   IS := HomalgVoidMatrix( "unknown", 1, R );
                   
                   homalgSendBlocking( [ "matrix ", P, S, IS, "=invariant_ring(", group_gens, ")" ], "need_command", R, "break_lists", HOMALG_IO.Pictograms.GroupInvariants );
                   
                   return [ P, S, IS ];
                   
                 end,
               
               
        )
 );

## enrich the global homalg table for Singular:
AddToAhomalgTable( CommonHomalgTableForSingularTools, OrbifoldsHomalgTableForSingularTools );
