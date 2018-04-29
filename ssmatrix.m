function L = ssmatrix(filename)
%load the sparsified Laplacian from software GRASS
fileID = fopen(filename, 'r');
B = textscan(fileID, '%d %d %f64 %f64', 'headerlines', 1);
aa=cell2mat(B(1));
bb=cell2mat(B(2));
cc=cell2mat(B(3));
L = sparse(double(aa), double(bb), cc);
