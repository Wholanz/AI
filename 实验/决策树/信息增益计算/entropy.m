function  gain = entropy( TrainData )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明



[row,col] = size(TrainData);
attrcount = col - 2;

A = linspace(1,attrcount,attrcount);
gain = [A', zeros(attrcount,1)];

class = TrainData(:,col);
classtype = typecount(class);
classvalue = classtype(:,2);
HC = entropycalc(classvalue);


for i = 1:attrcount
    
    attr = TrainData(:,i+1);
    attrtype = typecount(attr);
    
    sortattr = sortrows(TrainData,i+1);
    
    count = 0;
    
    for j = 1:size(attrtype,1)
        cnt = attrtype(j,2);
        
        valuetype = typecount(sortattr(count + 1: count + cnt,col));
        valuecount = valuetype(:,2);
        
        pt = cnt / row;
        
        gain(i,2) = gain(i,2) + pt * (entropycalc(valuecount)); 
        
        count = count + cnt;
    end 
    
    gain(i,2) = HC - gain(i,2);
    
end


end

