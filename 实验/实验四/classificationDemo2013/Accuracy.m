function rate = Accuracy(classlabel, L)

classnum = max(L);
rate = zeros(1, classnum);
for i = 1:classnum
    index = find(L==i);
    rate(i) = length(find(classlabel(index)==i))/length(index);
end

end