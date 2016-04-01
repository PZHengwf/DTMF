# DTMF - Dual Tone Multi Frequency Signaling
Pressing a phone key generates a synthetic tone composed to two sinusoids at different frequencies.  

Every key from 0-9 has a different combination of frequencies.

## dtmf.m
dtmf(arg1,arg2) plays the DTMF tone for key 'arg1' for duration 'arg2' seconds.

'arg1' should be an integer between 0 and 9.

## addnumber.m
Performs STFT on 'dtmf.wav' and outputs the two dominant frequencies per frame.

Used to find the four keypresses in 'dtmf.wav'.s
