function typecount = typecount( col )
%UNTITLED5 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

num = size(col,1);
typecount = zeros(1,2);
typecount(1,1) = 1;

for i = 1:num
    
    class = col(i);
    
    if class > size(typecount,1)
        for j = (size(typecount,1)+1):(class-1)
            typecount = [typecount;[j,0]];
        end
        typecount = [typecount;[class,1]];
    else 
        typecount(class,2) = typecount(class,2) + 1;
    end
    
end

end

