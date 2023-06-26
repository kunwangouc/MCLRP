clc;clear;
tic
load('CGP_X.mat')
% load('VD.mat')
% load('CCLE_X.mat')
% load('VD1.mat')
% X=X;


cL=size(X,1);
X=X(:,1:1000);
load('PI3KAUC.mat')
MM=PI3KAUC;
load('PI3KAUCdata.mat')
crossdata=PI3KAUCdata;

% load('PI3KIC50.mat')
% MM=PI3KIC50;
% load('PI3KIC50data.mat')
% crossdata=PI3KIC50data;

% load('ERKAUC30.mat')
% MM=ERKAUC30;
% load('ERKAUCdata.mat')
% crossdata=ERKAUCdata;

% load('ERKIC50.mat')
% MM=ERKIC50;
% load('ERKIC50data.mat')
% crossdata=ERKIC50data;

% load('MMnormal.mat');
% load('CCLEdata.mat');
% crossdata=CCLEdata;
X=X(:,1:1000);
numDrug=size(MM,2);

warning off all
beta=1;
rho=1;
iter=100;
itol=0;
% tk=1/(rho*norm(MM,'fro')^2);
epsilon=0.9*nnz(MM)*0.01;
tk=3e-2;
% epsilon=0;
opts.tk=tk;
opts.epsilon=epsilon;
opts.rho=rho;
opts.beta=beta;
opts.iter=iter;
opts.itol=itol;

XT=X';


m=size(XT,2);
meanXT=mean(XT,2);
MX=XT-meanXT;
C=(1/m).*(MX*MX');
[V,D]=eig(C);



[D_sort,index]=sort(diag(D),'descend');
V_sort=V(index(1:cL),:);
U=V_sort*XT;
Err=[];
Exerr=[];
outF=[];
outM=[];
clear D V V_sort XT X

%%
% ERKIC50cell=cell(1,10);
for ii=1:1
crossData=crossdata{ii};      
w=zeros(size(MM));
ii
for i=1:10 
    
    fprintf('begin compute crossdata: %d\n',i);
    examdata=crossData{i};
    
    exM_E=examdata~=0;
    M=MM-examdata;
    [outM,outf,err,exerr]=solverMethodPCA2(U',M,examdata,opts);
    w=w+exM_E.*outM;
    outF=[outF;outf];
    Err=[Err;err];
    Exerr=[Exerr;exerr];
    
end
% ERKIC50cell{ii}=w;
end

%% 
% save('ERKIC50cell.mat','ERKIC50cell');



