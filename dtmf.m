function [] = dtmf(key)

%% Generate DTMF Tones
Ts = 1/44100;
t = 0:Ts:1;
freq1 = zeros(4,3);
freq2 = zeros(4,3);
freq1(:,1) = 1209;
freq1(:,2) = 1336;
freq1(:,3) = 1477;
freq2(1,:) = 697;
freq2(2,:) = 770;
freq2(3,:) = 852;
freq2(4,:) = 941;
freq1 = freq1'; 
freq1 = freq1(:);
freq2 = freq2';
freq2 = freq2(:);

freq1 = freq1(key);
freq2 = freq2(key);

tone = cos(2*pi*freq1*t) + cos(2*pi*freq2*t);
soundsc(tone,44100);

end
