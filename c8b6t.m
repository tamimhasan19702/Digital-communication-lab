clc;
close all;
clear all;
%input data table(from decimal 0 to 20)
data= [0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 1; 0 0 0 0 0 0 1 0; 0 0 0 0 0 0 1 1;
0 0 0 0 0 1 0 0; 0 0 0 0 0 1 0 1; 0 0 0 0 0 1 1 0; 0 0 0 0 0 1 1 1;
0 0 0 0 1 0 0 0; 0 0 0 0 1 1 0 0; 0 0 0 1 0 0 0 0; 0 0 0 1 0 0 0 1;
0 0 0 1 0 0 1 0; 0 0 0 1 0 0 1 1; 0 0 0 1 0 1 0 0; 0 0 0 1 0 1 0 1;
0 0 1 0 0 0 0 0; 0 0 1 0 0 0 0 1; 0 0 1 0 0 0 1 0; 0 0 1 0 0 0 1 1;];
%mapping table
codeword=[-1 1 0 0 -1 1; 0 -1 1 -1 1 0; 0 -1 1 0 -1 1; 0 -1 1 1 0 -1;
-1 1 0 1 0 -1; 1 0 -1 -1 1 0; 1 0 -1 0 -1 1; 1 0 -1 1 0 -1;
-1 1 0 0 1 -1; -1 1 0 -1 0 1; 0 -1 1 0 1 -1; 0 -1 1 -1 0 1;
-1 1 0 -1 0 1; 1 0 -1 1 -1 0; 1 0 -1 0 1 -1; 1 0 -1 -1 0 1;
-1 1 1 -1 0 0; 1 0 0 1 -1 -1; -1 1 0 -1 1 1; 1 -1 0 -1 1 1;];
%taking bit stream input
inp = input('Enter 8s multiple bits with [ ;] around them: \n');
%dividing the bit stream into 8 bit blocks
inpt=reshape(inp, 8,[]);
inptx = transpose(inpt);
%finding the 6 bit codeward for each 8 bit data
for m=1:size(inptx,1)
RowIdx= find(ismember(data,[inptx(m,:)], 'rows'));
out= codeword(RowIdx, 1:6);
if m==1
outm= out;
end
if m>1
outm = [outm;out];
end
end


%weight calculation
[r,c]=size(outm);
for x=1:r
weight=0;
for y=1:c
weight = weight + outm(x,y);
end
fprintf('weight of %d th data = %d \n',x,weight);
weightv(x)= weight;
end

%dc balance
for j=2:r
if weightv(j-1)==1 && weightv(j)==1
for i=1:c
    outm(j-1,i)=(-1)*outm(j-1,i);
end
end
end

fprintf('\nThe codeword for the given bit stream is: ');

for p=1:r
    if p==1
        outs=outm;
    end
    if p>1
        outs=[outs(1,:) outm(p,:)];
    end
end

fprintf('%1.0f ', outs);
%plotting the encoded output
stairs(outs);
ylim([-2 2]);
xlim([1 length(outs)]);
title('8B6T Encoded output','color','r');
xlabel('Time','color','r');
ylabel('Output signal','color','r');
grid on;