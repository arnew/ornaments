
FONT=omaeanderr

#test: clean ornamente.dvi nfssfont.dvi
test: clean nfssfont.dvi ${FONT}.dvi 


nfssfont.dvi: ${FONT}.mf
	echo -e "${FONT} \n \\\bigtest \\\bye\n" | latex nfssfont
	xdvi $@ &


%.dvi: %.2602gf
	gftodvi $<
	xdvi $@ &

%.2602gf: %.mf
	mf '\input $<'

clean:
	git clean -f
