
test: clean ornamente.dvi nfssfont.dvi
	xdvi ornamente.dvi&
	xdvi nfssfont.dvi&

nfssfont.dvi: ornamente.mf
	echo -e "ornamente \n \\\bigtest \\\bye\n" | latex nfssfont


%.dvi: %.2602gf
	gftodvi $<

%.2602gf: %.mf
	mf '\input $<'

clean:
	rm -f a.600pk
	rm -f a.dvi
	rm -f a.log
	rm -f a.tfm
