%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%Developed By : Subhadip Ghosh%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%Follow me on GitHub%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%FINDING THE PEAKS OF A GRAPH AND PLOTTING MAG. & PHASE RESPONSE%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
close all
Fs=1000;
T=1/Fs;
L=1500;
t=(0:L-1)*T;

S=5*sin(2*pi*15*t)+2*sin(2*pi*70*t);
X = S + 2*randn(size(t));
figure(1);
plot(t,X);
Y=fft(X);
%Compute the two-sided spectrum P2. Then compute the single-sided 
%spectrum P1 based on P2 and the even-valued signal length L
B1=(Y/L);
B2=B1(1:L/2+1);
B2(2:end-1)=2*B2(2:end-1);


%Define the frequency domain f and plot the single-sided amplitude 
%spectrum P1. The amplitudes are not exactly at 0.7 and 1, as expected,
% because of the added noise. On average, longer signals produce better
% frequency approximations.
freqshift = [findpeaks(abs(B2))];    %finding peaks in magnitude spectrum of MUX_shift
phasepeaks =[findpeaks(angle(B2))];
f = Fs*(0:(L/2))/L;
MagSpec = [abs(freqshift)];
PhaseSpec = [angle(phasepeaks)]*180/pi;
figure(2)
plot(f, abs(B2));  %k is frequency vector already declared & MUX_shift is signal function. Plot of magnitude spectrum.
figure(3)
plot(MagSpec, 'or');  %I am trying to plot red circles of peaks only in positive domain of frequency in magnitude spectrum.
figure(4)
plot(PhaseSpec, 'or'); %I am trying to plot red circles of peaks only in positive domain of frequency in phase spectrum.

