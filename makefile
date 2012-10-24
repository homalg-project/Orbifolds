all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g maketest.g ListOfDocFiles.g \
		PackageInfo.g \
		doc/Orbifolds.bib doc/*.xml \
		gap/*.gd gap/*.gi examples/*.g
		gap createautodoc.g
	        gap makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap maketest.g

archive: test
	(mkdir -p ../tar; cd ..; tar czvf tar/Orbifolds.tar.gz --exclude ".DS_Store" --exclude "*~" Orbifolds/doc/*.* Orbifolds/doc/clean Orbifolds/gap/*.{gi,gd} Orbifolds/{CHANGES,PackageInfo.g,README,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g,ListOfDocFiles.g} Orbifolds/examples/*.g)

WEBPOS=public_html
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
	rm -f ${WEBPOS}/*.tar.gz
	mv ../tar/Orbifolds.tar.gz ${WEBPOS}/Orbifolds-`cat VERSION`.tar.gz
	rm -f ${WEBPOS_FINAL}/*.tar.gz
	cp ${WEBPOS}/* ${WEBPOS_FINAL}
	ln -s Orbifolds-`cat VERSION`.tar.gz ${WEBPOS_FINAL}/Orbifolds.tar.gz

