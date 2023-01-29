clc;
clear all;
close all;

data = [1 0 0 0 0 0 0 0 0 1 0 0 0 0]

n = 1000;

T = length(data);

N = n*length(data);


dt = T/N;

t = 0:dt:T;

x = zeros(1,length(t));

counter = 0;
lastbit = 1;
for i=1:length(data)
  if data(i)==0
    counter = counter + 1;
    if counter==8
      x((i-1-7)*n+1:(i-7)*n) = 0;
      x((i-1-6)*n+1:(i-6)*n) = 0;
      x((i-1-5)*n+1:(i-5)*n) = 0;
      x((i-1-4)*n+1:(i-4)*n) = lastbit;
      x((i-1-3)*n+1:(i-3)*n) = -lastbit;
      lastbit = -lastbit;
      x((i-1-2)*n+1:(i-2)*n) = 0;
      x((i-1-1)*n+1:(i-1)*n) = lastbit;
      x((i-1)*n+1:i*n) = -lastbit;
      lastbit = -lastbit;
      counter = 0;
    end
  else
    counter = 0;
    x((i-1)*n+1:i*n) = -lastbit;
    lastbit = -lastbit;
  end
end


plot(t, x,'lineWidth', 2.5), axis([0,T,-2,2]);


title('B8ZS scrambling')

grid on;

xAxis = 0;
yAxis = 1.3;

bits = dec2bin(data);

for i = 1:T
    xAxis = i - 0.5;
    text(xAxis,yAxis, num2str(bits(i)));
end

