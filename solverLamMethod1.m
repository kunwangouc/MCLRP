function [outLam]=solverLamMethod1(L,U,PU,tempM)
B=PU'*tempM;
LB=L\B;
outLam=U\LB;

end