function [F] = BIRWMDA(Y,Md,Mm)
%% bi-random walk on the heterogeneous network to calculate association scores for each disease-miRNA pair. 

%% normFun: Laplacian normalization for miRNA similarity and disease similarity
Md = normFun(Md);
Mm = normFun(Mm);

%% random walks Parameters 
%  alpha: decay facor; 
%  l: random walks steps in the miRNA similarity network
%  r: random walks steps in the disease similarity network

alpha = 0.9;
l = 2;
r = 1;

%%

Y = Y / sum(Y(:));
R = Y;
Max_Iter = max([l,r]);
mnumber = size(Mm,1);
dnumber = size(Md,1);

% bi-random walk on the heterogeneous network
for i = 1:Max_Iter
    ftl = 0;
    ftr = 0;
    
  % random walk on the miRNA similarity network
  if i<=l
     nRtleft = alpha * R * Mm + (1 - alpha)*Y;
     ftl = 1;
  end       
  
  % random walk on the disease similarity network
  if i<= r
     nRtright = alpha *  Md * R + (1-alpha)*Y;
     ftr = 1; 
  end       

  % R: predictive association scores between each miRNA-disease pair
    R = (ftl*nRtleft + ftr*nRtright)/(ftl + ftr);

end
  %%
    for i = 1 : dnumber
        for j = 1 : mnumber
            F(i,j)=R(i,j);
        end
    end


end
