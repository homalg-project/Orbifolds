##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "Modules" );

LoadPackage( "Orbifolds" );

LoadPackage( "IO_ForHomalg" );

HOMALG_IO.show_banners := false;

LoadPackage( "GAPDoc" );

list := [
         "../gap/Invariants.gd",
         "../gap/Invariants.gi",
         "../examples/OrbifoldV4TwistHochschild.g"
         ];

size := SizeScreen( );
SizeScreen([125]);

TestManualExamples( DirectoriesPackageLibrary( "Orbifolds", "doc" )[1]![1], "Orbifolds.xml", list );

GAPDocManualLab( "Orbifolds" );

SizeScreen( size );

quit;

