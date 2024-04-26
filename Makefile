CC	= ../../gbdk2020/gbdk-2020-git/build/gbdk/bin/lcc -Wa-l -Wl-m -Wl-j

BINS	= clock_speed_simple_timer.gb
DUCKBINS	= clock_speed_simple_timer.duck

all:	$(BINS)
duck:	$(DUCKBINS)



compile.bat: Makefile
	@echo "REM Automatically generated from Makefile" > compile.bat
	@make -sn | sed y/\\//\\\\/ | grep -v make >> compile.bat

# Compile and link single file in one pass
%.gb:	%.c
	$(CC) $(LCCFLAGS) -o $@ $<

%.duck:	%.c
	$(CC) -msm83:duck $(LCCFLAGS) -o $@ $<


clean:
	rm -f *.o *.lst *.map *.gb *~ *.rel *.cdb *.ihx *.lnk *.sym *.asm *.noi

