SNRdB = [0:30]; %decibel SNR value ranged between 0 to 30

SNR_L = 10.^(SNRdB./10); %decibel to linear

W= 21; %bandwidth

h=0.8; %environmental matrix/fading coefficient

H= abs(h); %absolute value

c= W.*log2(1+SNR_L); %AWGN Channel

c2=W.*log2(1+(H*H.*SNR_L)); %Fading channel

plot(SNRdB,c,'-o','LineWidth',3); %AWGN PLOT

hold on;

grid on;

plot(SNRdB,c2,'g:.','LineWidth',3);%Fading channel plot


