% 0 = toggle

% 1 = zero level

id = input('Input your ID: ');%taking my id as input

bi = de2bi(id)%id converted to binary

bi = fliplr(bi);%flipping the bi array value in the left-right

n = length(bi);%length of the binary value

x = [];

y = [];

a=1;

for i=1:n
    
    x=[x i-1 i];
    
    if(bi(i)== 0)
        
        y=[y a a];
        
        a=a*(-1);
        
    else
        
        y=[y 0 0];
        
    end
end

plot(x,y,'LineWidth',1.25),axis([0,n,-2,2]);

xAxis = 0;

yAxis = 1.2;

bi = dec2bin(id);

for i=1:n
    xAxis = i - 0.5;
    text(xAxis,yAxis,bi(i));
end


title('Bipolar Pseudoternary , id:19702021');

xlabel('Time');

ylabel('Amplitude');

grid on