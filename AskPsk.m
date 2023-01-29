%matlab code for digital modulation ASK and PSK
clc
clear all
close all

f = 5;
x = [1 0 1 0 1 0 1 0] %Input signal
nx = size(x,2);

i = 1;
while i <nx + 1
    t = i: 0.0001: i+1;
    if(x(i) == 1)
        ask = sin(2*pi*f*t);
        psk = sin(2*pi*f*t);
    else
        ask = sin(0);
        psk = sin(2*pi*f*t+pi);
    end
    
    
    % Amplitude Shift Key(ASK)
    subplot(2,1,1);
    plot(t,ask,'lineWidth', 2.5);
    hold on;
    grid on;
    axis([1 10 -2 2]);
    title('Amplitude Shift Key(ASK)')
    
    % Phase Shift Key(PSK)
    subplot(2,1,2);
    plot(t,psk,'lineWidth', 2.5);
    hold on;
    grid on;
    axis([1 10 -2 2]);
    title('Phase Shift Key(PSK)')
    
    i = i + 1;
    
    
end

