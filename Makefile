

%.dvi: %.2602gf
	gftodvi $<
	xdvi $@

%.2602gf: %.mf
	mf '\input $<'
