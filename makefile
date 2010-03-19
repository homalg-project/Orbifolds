all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g maketest.g \
		PackageInfo.g VERSION \
		doc/Orbifolds.bib doc/*.xml \
		gap/*.gd gap/*.gi \
		examples/*
	        gap makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap maketest.g

archive: test
	(mkdir -p ../tar; cd ..; tar czvf tar/Orbifolds.tar.gz --exclude ".DS_Store" --exclude "*~" Orbifolds/doc/*.* Orbifolds/doc/clean Orbifolds/gap/*.{gi,gd} Orbifolds/{CHANGES,PackageInfo.g,README,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g} Orbifolds/examples/*.g)

WEBPOS=~/gap/pkg/Orbifolds/public_html
WEBPOS_FINAL=~/Sites/homalg-project/Orbifolds

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
	cp ../tar/Orbifolds.tar.gz ${WEBPOS}

