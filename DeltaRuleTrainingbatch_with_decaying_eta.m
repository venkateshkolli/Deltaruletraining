function [w, iterations, e, wcount]=DeltaRuleTrainingbatch_with_decaying_eta(Data, Target, eta, error, epochs)

[rd, cd]=size(Data);
[rt, ct]=size(Target);
wcount=0;
if rt ~= rt
    error('num data points not equal to num target');
else
    w=rand(1,cd+1);
    iterations=0;
    e=error;
while e >= error && iterations < epochs
 iterations=iterations+1;
 wrong=0;
 deltaw=zeros(1,3);
for i=1:rd
     
 % delta rule 
     
% % %      %%%%% Perceptron rule
    temp=sum(w .* [Data(i,:),1]);
    if temp < 0
        out(i) = -1;
    else
        out(i)=+1;
    end %%%%%%%%%% perceptron rule

    deltaw=eta*(Target(i)-out(i))*[Data(i,:),1];
    err(i)=(Target(i)- out(i))^2;
    eta=eta*0.9;
    if err(i)>0
        wrong=wrong+1;
    end
end
 
 w=w+sum(deltaw);
 wcount=wcount+1;
 
% for i=1:rd
% total error for perceptron
% e=wrong/rd;

% error for delta rule
e=sum(err)/rd;
end
end