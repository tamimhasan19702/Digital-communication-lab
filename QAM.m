clc
clear all;
close all;

M  = 16;

point = 5;

bit = (randi([0 1],point*log2(M),1))

temp = reshape(bit,[log2(M) point])';

data = bin2dec(num2str(temp))'

map = 0:15;

qam = qammod(data,M,map,'PlotConstellation',true);

hold on

title('16-QAM, Custom Mapping')

plot([0 0],[-5 5],[-5 5],[0 0],'LineWidth',1); 

hold on

axis equal

scatter(real(qam),imag(qam),'black',"filled");

xlabel('In-Phase'); 

ylabel('Quadrature');

title('16QAM'); 

grid on;