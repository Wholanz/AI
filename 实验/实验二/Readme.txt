本次实验由于涉及数据量较大，程序运行需要较长时间，大约1小时左右，需要耐心等待。
运行过程中会逐渐输出每个测试点的类别。
结果已经打包，其中，k5class, k10class, k20class 文件分别是在k=5, k=10, k=20时各个测试点的分类结果，而k5c, k10c, k20c则是对应的精度。
Test为程序源代码，classfication为分类函数，函数根据输入输出对应的分类矩阵和精度。

其中，本次实验中的精度分别为：
k=5时，	accuracy = 0.8747
k=10时,	accuracy = 0.9067
k=20时，accuracy = 0.8193

由此可见，k的值不能选取过小，会增大噪声，亦不能选取过大，会放大无关点对分类的影响！ 