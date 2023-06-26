function [outN]=solverN(M_E,OriginM,tempN,tempM,tempY,rho,tk,epsilon)
Xk=(1-tk*rho)*tempN+tk*rho*(tempM+tempY);
normPX=norm(M_E.*(Xk-OriginM),'fro');

if normPX < epsilon
    outN=Xk;
else
    Xk2=(M_E.*(Xk-OriginM)/normPX) * epsilon +OriginM +(1-M_E).*Xk;
    outN=Xk2;
end


end