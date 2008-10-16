
FONT=omaenader
FONT=ofloor
FONT=ohund
FONT=oblaetter

all: test

%_nfssfont.dvi: %.mf
	#echo -e "${FONT} \n \\\bigtest \\\bye\n" | latex nfssfont
	echo -e "$< \n \\\bigtest \\\bye\n" | latex -jobname=$(basename $@) nfssfont
	xdvi $@ &

%.dvi: %.2602gf
	gftodvi $<
	xdvi $@ &

%.2602gf: %.mf
	mf '\input $<'

# \
clean \
${FONT}_nfssfont.dvi \
#
test: \
clean \
${FONT}.dvi \
#
	latex test
	#pdflatex test
	xdvi test.dvi &


clean:
	git add ${FONT}.mf
	git clean -f
