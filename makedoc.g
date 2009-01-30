##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "GAPDoc" );

SetGapDocLaTeXOptions( "utf8" );

bib := ParseBibFiles( "doc/Orbifolds.bib" );
WriteBibXMLextFile( "doc/OrbifoldsBib.xml", bib );

list := [
         "../gap/Invariants.gd",
         "../gap/Invariants.gi",
         "../examples/OrbifoldV4TwistHochschild.g"
         ];

MakeGAPDocDoc( "doc", "Orbifolds", list, "Orbifolds" );

GAPDocManualLab("Orbifolds");

quit;

