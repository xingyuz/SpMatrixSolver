function L = ssmatrix(filename)
switch filename
    case 'fe_4elt2.mtx'
        ssm = 'P_4elt2.mtx';
    case 'fe_ocean.mtx'
        ssm = 'P_ocean.mtx';
    case 'fe_rotor.mtx'
        ssm = 'P_rotor.mtx';
    case 'fe_sphere.mtx'
        ssm = 'P_sphere.mtx';
    case 'fe_tooth.mtx'
        ssm = 'P_tooth.mtx';
    otherwise
        return;
end
%load the sparsified Laplacian from software GRASS
fileID = fopen(ssm, 'r');
B = textscan(fileID, '%d %d %f64 %f64', 'headerlines', 1);
aa=cell2mat(B(1));
bb=cell2mat(B(2));
cc=cell2mat(B(3));
L = sparse(double(aa), double(bb), cc);
