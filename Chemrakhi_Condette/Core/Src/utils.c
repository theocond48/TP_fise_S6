	/*
 * utils.c
 *
 *  Created on: Feb 2, 2026
 *      Author: ZafkieL
 */

#include "utils.h"
int GreenLED_state = 0;

void setup(void) {
    GreenLED_state = 1;
}
void loop(void) {
    LED_DriveGreen(GreenLED_state);
    GreenLED_state = 1 - GreenLED_state;
    UTILS_WaitN10ms(100);
}


void UTILS_WaitN10ms(int N){
	int n,i,s=0;
	for(n=1;n<=N;n++){
		for(i=0;i<2500;i++){
			s=s+i;
		}
	}
}

