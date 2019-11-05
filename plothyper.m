function plothyper(w,text)
for i=1:4
    m=-1*(w(i,2)/w(i,3));
    c=-1*(w(i,1)/w(i,3));
    x=randi([1,100],1,50);
    y=m*x+c;
    txt= [num2str(i),'th plot'];
    plot(x,y,'DisplayName',txt)
    title(text)
    hold on;
end
