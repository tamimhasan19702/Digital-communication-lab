Id = input('Enter your id: '); %taking my id as input

bi = de2bi(Id); %id converted to binary

bi = fliplr(bi) %flipping the array value left to right

n = length(bi); %length of the binary value

x = []; %indicating x array

y = []; %indicating y array

for i=1:n   %for iteration taking value 1 to n;
    
                 %loop runs for i=1 to i=n. at each iteration 
    x=[x i-1 i]; %the value of i-1 and i are added to the vector x.
    
    if(bi(i)==1)  %checking if bi value 1 or zero
        
        y=[y 1 1];  %if 1 then fill the y array with two 1 
        
    else
        
        y=[y 0 0]; %if 0 then fill the y array with two 0 
        
    end
    
end

plot(x,y,'b','LineWidth',2.25),axis([0,n,-1,2]);

xAxis = 0;

yAxis = 1.2;

bi = dec2bin(Id);

for i=1:n
    xAxis = i - 0.5;
    text(xAxis,yAxis,bi(i));
end

title('Unipolar Line Coding , id:1970201');

grid on;



