%% Outputs the two dominant frequencies per frame
clc; clear; close all;

% Read in audio
[audio, Fs] = audioread('dtmf.wav');

% Parameters
framelen = 882;
numwin = ceil(length(audio)/framelen);
hamwin = hamming(framelen);
freqmat = zeros(numwin,2);
fftsize = 2048;

% Zero pad
audio = [audio; zeros(framelen*numwin-length(audio),1)];

% Window by window processing
for i = 1:numwin
    frame = audio((i-1)*framelen + 1:i*framelen).*hamwin;
    fftmag = abs(fft(frame, fftsize));
    fftmag = fftmag(1:fftsize/2);
    % Find two largest peaks in FFT
    [maxima, loc] = findpeaks(fftmag);
    [maxima,ind] = sort(maxima,'descend');
    loc = loc(ind);
    if isempty(loc)
        freqmat(i,:) = 0; % If current frame doesn't have peaks in FFT
    else
        freqmat(i,:) = loc(1:2)*Fs/fftsize; % Store frequencies of 2 peaks per frame
    end
end
