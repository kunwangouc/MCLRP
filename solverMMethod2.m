function [outM]=solverMMethod2(ML,tempY,tempN,rho,beta)
rho_1=1/(1+rho);
tm=ML+rho*tempN-rho*tempY;
tm2=rho_1*tm;
threshold=beta*rho_1;
[u,s,v]=svd(tm2,'econ');
SS=max(s-threshold*ones(size(s)),0);
outM=u*SS*v';

end