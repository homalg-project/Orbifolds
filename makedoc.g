##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "homalg" );

LoadPackage( "GAPDoc" );

SetGapDocLaTeXOptions( "utf8" );

bib := ParseBibFiles( "doc/Orbifolds.bib" );
WriteBibXMLextFile( "doc/OrbifoldsBib.xml", bib );

Read( "ListOfDocFiles.g" );

MakeGAPDocDoc( "doc", "Orbifolds", list, "Orbifolds" );

GAPDocManualLab("Orbifolds");

quit;

