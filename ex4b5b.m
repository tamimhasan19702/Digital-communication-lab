clc;
clear all;
close all;

data=[0 0 0 0; 0 0 0 1; 0 0 1 0; 0 0 1 1; 0 1 0 0; 0 1 0 1; 0 1 1 0; 0 1 1 1;
1 0 0 0; 1 0 0 1; 1 0 1 0; 1 0 1 1; 1 1 0 0; 1 1 0 1; 1 1 1 0; 1 1 1 1;]

code=[1 1 1 1 0; 0 1 0 0 1; 1 0 1 0 0; 1 0 1 0 1; 0 1 0 1 0; 0 1 0 1 1; 0 1 1 1 0; 0 1 1 1 1;
1 0 0 1 0; 1 0 0 1 1; 1 0 1 1 0; 1 0 1 1 1; 1 1 0 1 0; 1 1 0 1 1; 1 1 1 0 0; 1 1 1 0 1;]
%taking bit stream input

inp =input('Enter 4s multiple bits with [] arround them: \n')

%dividing the bit stream into 4 bit blocks 

inpt=reshape(inp, 4,[]) ;

inptx = transpose(inpt);

%finding the 5 bit code for each 4 bit data 

check = find(ismember(data,inptx,'rows'))

A1 = [code(check,:)];

A1 = reshape(A1,1, [])

%plot
stairs(A1),axis([1,10,-2,2]);

title('4B5B Block coding')

grid on;