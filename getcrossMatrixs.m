function [crossdata] = getcrossMatrixs(MM)
N = nnz(MM(:));%
zeroM = zeros(size(MM));
D = randperm(N);
first = floor(N/10);%
[nrows,ncols] = find(MM);%
crossdata = {};
for i = 1:10
    crossdata{i} = zeroM;
end
for i = 1:10
    for j = 1+(i-1)*first:i*first
        crossdata{i}(nrows(D(j)),ncols(D(j))) = MM(nrows(D(j)),ncols(D(j)));
    end
end
 k=N -10*first ;
 i=10*first+1;
  for j=1:k
 crossdata{j}(nrows(D(i)),ncols(D(i))) = MM(nrows(D(i)),ncols(D(i)));
  i=i+1;
  end
end


