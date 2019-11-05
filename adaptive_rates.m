x1=randi([-20,20],1,200);
x2=randi([-20,20],1,200);
data=[x1;x2]';
class=[];
err1=[];
[rd, cd]=size(data);
epochs=[5,10,50,100];
weights1=[];
ep=0.5;
th=0.15;
c=1;
while c<=4
    epoch=epochs(c);
    for i=1:rd
        for j=1
            v=data(i,j)+2.*data(i,j+1)-2
        end
        if v > 0
            class(i)=1;
        else
            class(i)=-1;
        end
        class=[class class(i)]
    end
 target=class';
 eta=0.2;
 error=0.2;
 [w1, iterations1, e1, nowu1]=DeltaRuleTraining(data, target, eta, error, epoch);
 %nowu means no of weights updated.
 diff=e1-ep;
 if(diff>th)
     eta=eta*0.9;
 else
     err1(c)=e1*100;
     weights1(c,:)=w1;
     c=c+1;
 end
end
figure(1)
scatter(epochs,err1)
title('plot of error vs epochs with incremental process')
xlabel('epochs') 
ylabel('error percentage')
xlim([0 110]) 
ylim([-1 100])
figure(2)
txt1='hyper planes plots for incremental method';
plothyper(weights1,txt1);