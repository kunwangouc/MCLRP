clc;
clear


load('MMnormal.mat')
[CCLEcross] = getcrossMatrixs(MM);

parfor i=1:10
[CCLEcross] = getcrossMatrixs(MM);
 CCLEdata{i}=CCLEcross;
end
%%
load('ERKAUC30.mat')
parfor i=1:10
MM=ERKAUC30;
[ERKAUCcross] = getcrossMatrixs(MM);
 ERKAUCdata{i}=ERKAUCcross;
end

load('PI3KAUC.mat')
parfor i=1:10
MM=PI3KAUC;
[PI3KAUCcross] = getcrossMatrixs(MM);
PI3KAUCdata{i}=PI3KAUCcross;
end

load('ERKIC50.mat')
parfor i=1:10
MM=ERKIC50;
[ERKIC50cross] = getcrossMatrixs(MM);
ERKIC50data{i}=ERKIC50cross;
end

 load('PI3KIC50.mat')
 parfor i=1:10
 MM=PI3KIC50;
[PI3KIC50cross] = getcrossMatrixs(MM);
PI3KIC50data{i}=PI3KIC50cross;
end