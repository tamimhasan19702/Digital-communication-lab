clc
close all
clear all

t = 0:0.0001:20; %sampling at niquist rate

bitDepth = 2 %bit depth of PCM coding

part = -1:0.1:1;%A quantization partition defines several contiguous, nonoverlapping ranges
%of values within the set of real numbers.

codebook = -1:0.1:1.1;%A codebook tells the quantizer which common value to assign to inputs that
%fall into each range of the partition.

%message signal
msg = cos(t);

subplot(3,1,1);
plot(t,msg,'lineWidth',2.5);
axis([1,20,-2,2])
title('Message Signal');

%quantanization
[~,quants] = quantiz(msg,part,codebook);%returns a vector that tells which interval each input is in

subplot(3,1,2);
plot(t,quants,'lineWidth',2.5);
axis([1,20,-2,2])
title('Quantized Signal');

% encoding a signal using uniform quantanization method 
y = uencode(quants,bitDepth);
ybin=dec2bin(y,bitDepth);%converting it to final binary form to make it transmit ready

subplot(3,1,3);
plot(t,y,'lineWidth',2.5);
axis([1,20,-2,4])
title('PCM PLOT');