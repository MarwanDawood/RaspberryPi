#ifndef F_CPU
#define F_CPU 4000000UL
#endif

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

// timer1 overflow
ISR(TIMER1_COMPA_vect)
{
    // XOR PORTA with 0x02 to toggle the LSB
    PORTC ^= 0x02;
}

int main(void)
{
    DDRC = 0xFF; /* set Port C as output */

    // prescale 16-bit T1 with /256 and CTC mode (Clear on Compare)
    TCCR1B = (1 << WGM12) | (1 << CS12);

    // initialize timer1 counter to value 0
    TCNT1 = 0;
    // initialize compare value timer=delay*prescale/freq
    OCR1A = 15625;
    // enable Overflow Interrupt fot T0 and Output Compare Interrupt for T1
    TIMSK = (1 << OCIE1A);
    // enable interrupts to toggle GPIO
    sei();

    // toggle GPIO using loop
    while (1)
    {
        // PORTC = 0xFF;
        //_delay_ms(1000);
        // PORTC = 0x00;
        //_delay_ms(1000);
    }
}
