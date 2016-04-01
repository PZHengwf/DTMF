clc; clear; close all;
%% Read in audio
audio = audioread('dtmf.wav');
framelen = 882;
numwin = ceil(length(audio)/framelen);
Fs = 44100;
hamwin = hamming(framelen);
freqmat = zeros(numwin,2);
fftsize = 2048;
% Zero pad
audio = [audio; zeros(framelen*numwin-length(audio),1)];
for i = 1:numwin
    frame = audio((i-1)*framelen + 1:i*framelen).*hamwin;
    fftmag = abs(fft(frame, fftsize));
    fftmag = fftmag(1:fftsize/2);
    [maxima, loc] = findpeaks(fftmag);
    [maxima,ind] = sort(maxima,'descend');
    loc = loc(ind);
    if isempty(loc)
        freqmat(i,:) = 0;
    else
        freqmat(i,:) = loc(1:2)*Fs/fftsize;
    end
    
end
