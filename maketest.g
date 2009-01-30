##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "Orbifolds" );

HOMALG_IO.show_banners := false;

LoadPackage( "GAPDoc" );

list := [
         "../gap/Invariants.gd",
         "../gap/Invariants.gi",
         "../examples/OrbifoldV4TwistHochschild.g"
         ];

TestManualExamples( "doc", "Orbifolds.xml", list );

GAPDocManualLab("Orbifolds");

quit;

