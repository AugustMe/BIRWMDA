clc;
clear;
tic;
%%
% A: Binary relations between disease and miRNA, 1st column:disease, 2nd column:miRNA
A=textread('knowndiseasemirnainteraction.txt');
% nd:the number of diseases
% nm:the number of miRNA
% pp:the number of known disease-miRNA associations
nd=max(A(:,1)); 
nm=max(A(:,2));
[pp,qq]=size(A);
% interaction: adjacency matrix for the disease-miRNA association network
% interaction(i,j)=1 means disease i is related to miRNA j
for i=1:pp
    interaction(A(i,1),A(i,2))=1;
end

save interaction interaction;

% FS:the function similarity between m(i) and m(j)
% SSx:the semantic similarity between d(i) and d(j).

FS = load('.\4.miRNA functional similarity\MiRNA functional similarity.txt');      
SS1 = load('.\2.disease semantic similarity 1\Disease semantic similarity model 1.txt');
SS2 = load('.\3.disease semantic similarity 2\Disease semantic similarity model 2.txt');

[kd,km] = gaussiansimilarity(interaction,nd,nm);

Md = SNF({SS1,SS2,kd},4,5);
Mm = SNF({FS,km},4,5);
F= BIRWMDA(interaction,Md,Mm);

%%  write excel
% load the original datasets
[~,miRNA_list,~] = xlsread('.\1.miRNA-disease association data\miRNA number.xlsx');
[~,disease_list,~] = xlsread('.\1.miRNA-disease association data\disease number.xlsx');
F = F';
interaction = interaction';

% rank 
[F,LP_rank_known] =Rank( F, interaction ,miRNA_list,disease_list);
Write_file( F );

%%
toc;

