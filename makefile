all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g maketest.g \
		doc/Orbifolds.xml doc/title.xml \
		doc/intro.xml doc/install.xml \
		doc/Orbifolds.bib gap/*.gd gap/*.gi \
		doc/Invariants.xml \
		doc/examples.xml doc/appendix.xml \
		examples/* \
		VERSION
	        gapL makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gapL maketest.g

archive: doc
	(mkdir -p ../tar; cd ..; tar czvf tar/Orbifolds.tar.gz --exclude ".DS_Store" Orbifolds/doc/*.* Orbifolds/gap/*.{gi,gd} Orbifolds/{CHANGES,PackageInfo.g,README,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g})

WEBPOS=~/gap/pkg/Orbifolds/public_html
WEBPOS_FINAL=~/Sites/Orbifolds

towww: archive
	echo '<?xml version="1.0" encoding="UTF-8"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.Orbifolds
	cp doc/manual.pdf ${WEBPOS}/Orbifolds.pdf
	cp doc/*.{css,html} ${WEBPOS}
	cp ${WEBPOS}/* ${WEBPOS_FINAL}
#	cp ../tar/Orbifolds.tar.gz ${WEBPOS}

