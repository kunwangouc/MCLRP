function [outM,outf,err,exerr]=solverMethodPCA2(XU,M,examdata,opts)
OriginM=M;
tempM=M;

w=zeros(size(M));
exM_E=examdata~=0;
M_E=M~=0;
beta=opts.beta;
tk=opts.tk;
epsilon=opts.epsilon;
iter=opts.iter;
itol=opts.itol;
rho=opts.rho;
outf=[];
err=[];
exerr=[];
Upca=XU;
UTU=Upca'*Upca;
[L,U]=lu(UTU);
tempN=tempM;
tempY=M_E.*(tempN-OriginM);

for j=1:iter
    if mod(j,50)==0
        fprintf('iter: %d\n',j);
    end
    ML=zeros(size(M));
    
    outLam=solverLamMethod1(L,U,Upca,tempM);
    ML=XU*outLam;
    
    lastM=tempM;

    tempM=solverMMethod2(ML,tempY,tempN,rho,beta);
    tempN=solverN(M_E,OriginM,tempN,tempM,tempY,rho,tk,epsilon);
    
    tempY=tempY+tempM-tempN;
    
    PULM=(ML-tempM);
    [u,s,v]=svd(tempM,'econ');
    ts=trace(s);
   
   
    valuef=0.5*norm(PULM,'fro')^2+beta*ts;
    outf=[outf valuef];
    ErrM=tempM-lastM;
    exErrM=tempM.*exM_E-examdata;
    error=norm(ErrM,'fro')/norm(tempM,'fro');
    e=norm(exErrM,'fro')/norm(examdata,'fro');
    exerr=[exerr e];
    err=[err error];
    if error<itol
        break;
    end
end
outM=tempM;

end