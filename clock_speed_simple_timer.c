#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>
#include <gbdk/console.h>

uint8_t  mins = 0u;
uint8_t  secs = 0u;
uint8_t  frames = 0u;
uint16_t totalframes = 0u;
uint8_t  buttons = 0u;

void main(void) {

    while(buttons == 0u) {
        buttons = joypad();
    }

    while (1) {
        vsync();

		totalframes++;
		frames++;
		if (frames >= 60u) {
			frames = 0u;

			secs++;
			if (secs >= 60u) {
				secs = 0u;
				mins += 1u;
			}
			gotoxy(0,0);
            printf("%hu \n%hu \n%u", (uint8_t)secs,  (uint8_t)mins, (uint16_t)totalframes);
		}
    }
}
