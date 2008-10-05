
test: clean ornamente.dvi 
	#nfssfont.dvi

nfssfont.dvi: ornamente.mf
	echo -e "ornamente \n \\\bigtest \\\bye\n" | latex nfssfont
	xdvi $@ &


%.dvi: %.2602gf
	gftodvi $<
	xdvi $@ &

%.2602gf: %.mf
	mf '\input $<'

clean:
	git clean -f
