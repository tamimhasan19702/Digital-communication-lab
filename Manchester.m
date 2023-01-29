
Id = input('Enter your id: '); %taking my id as input

bi = de2bi(Id); % id converted to binary

bi = fliplr(bi) % flipping the bi array value in the left-right

n = length(bi);
x = [];
y = [];

for i=1:n
    x=[x i-1 i-1+0.5 i-1+0.5 i];
    if(bi(i)==0)
        y=[y 1 1 -1 -1];
    else
        y=[y -1 -1 1 1];
    end
end

plot(x,y,'g','LineWidth',2.25),axis([0,n,-2,2]);

xAxis = 0;

yAxis = 1.2;

bi = dec2bin(Id);

for i=1:n
    xAxis = i - 0.5;
    text(xAxis,yAxis,bi(i));
end

title('Manchester , id:1970201');

grid on;
