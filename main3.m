clc;
fileID=fopen('hayes-roth.data');
formatSpec='%d,%f,%f,%f,%f,%d';
sizeA=[6 Inf];
A=fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
data1=A';
data=data1(:,2:5);
Target=data1(:,6);
epochs=100;
eta=0.00001;
[w, iterations,od]=gradient_descent(data, Target, eta, epochs);%training Phase
fileID=fopen('hayes-roth.test');
formatSpec='%f,%f,%f,%f,%d';
sizeA=[5 Inf];
k=fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
test_data=k';
test=test_data(:,1:4);
test_label=test_data(:,5);
[rd1, cd1]=size(test);
 for i=1:rd1
     a=w(1,1)*(0.6180 + (0.6180*0.6180));
     b=w(1,2)*(test(i,1)+(test(i,1)*test(i,1)));
     c=w(1,3)*(test(i,2)+(test(i,2)*test(i,2)));
     d=w(1,4)*(test(i,3)+(test(i,3)*test(i,3)));
     e=w(1,5)*(test(i,4)+(test(i,4)*test(i,4)));
     temp1(i)=round(a+b+c+d+e);
     class1(i)=mod(temp1(i),3)+1; %% class label calculated for the test data using weights the obtained from the model
      end
  count=0;
  for i=1:rd1
      if class1(i)==test_label(i);
          count=count+1;
      else
          count=count;
      end
  end
Accuracy=count/rd1;
fprintf('The Accuracy of the testing data =%f \n',Accuracy);
train=data;
train_label=data1(:,6);
for i=1:rd2
     a=w(1,1)*(0.6180 + (0.6180*0.6180));
     b=w(1,2)*(train(i,1)+(train(i,1)*train(i,1)));
     c=w(1,3)*(train(i,2)+(train(i,2)*train(i,2)));
     d=w(1,4)*(train(i,3)+(train(i,3)*train(i,3)));
     e=w(1,5)*(train(i,4)+(train(i,4)*train(i,4)));
     temp2(i)=round(a+b+c+d+e);
     class2(i)=mod(temp2(i),3)+1; %% class label calculated for the test data using weights the obtained from the model
      end
  count2=0;
  [rd2, cd2]=size(train);
  for i=1:rd2
      if class2(i)==train_label(i);
          count2=count2+1;
      else
          count2=count2;
      end
  end
Accuracy2=count2/rd1;
fprintf('The Accuracy of the training data =%f \n',Accuracy2);