function [ class,accuracy ] = KNN ( train,train_label,test,test_label,k )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

rowtrain = size(train,1);
rowtest = size(test,1);
col = size(train,1);

class = zeros(rowtest,1);    %��ʼ������ֵ��������


for i = 1:size(test,1)          %��ÿ������ֵ���з���
    test_now = test(i,:);

    class_num = zeros(2);

        test_mat = repmat(test_now,rowtrain,1);
        dif_mat = test_mat - train;
        dif_mat_squ = dif_mat.^2;
        dist(:,1) = sum(dif_mat_squ,2); 
    
    [~,index] = sort(dist);   %�Ծ����������
    
    for j = 1:k
        label = train_label(index(j));
        class_num(label + 1) = class_num(label+1) + 1; 
    end
    
    max_num = 0;
    max = 0;
    for j = 1:2
        if class_num(j) > max_num
            max = j;
            max_num = class_num(j);
        end
    end
    
    class(i,1) = max - 1;
    
end

anum = sum( class == test_label ); 

accuracy = anum / rowtest;


end

