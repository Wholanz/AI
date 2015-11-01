function entropy = entropycalc( valuecount )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明

numsum = size(valuecount,1);

count = sum(valuecount(:,1));

entropy = 0;

for i = 1:numsum
 
    pt = valuecount(i) / count;
    
    if (pt==0)
        continue;
    else
        entropy = entropy - pt * (log(pt) / log(2));
    end
end


end

