# Fusing multiple biological networks to effectively predict miRNA-disease associations

The data download from: https://github.com/IMCMDAsourcecode/IMCMDA

# Inferring disease-related microRNAs via BIRWMDA

## How to use the tool?

Just run 'BIRWMDA_predict.m' to produce the result.

Data set：The data download from: https://github.com/IMCMDAsourcecode/IMCMDA

disease semantic similarity matrix 1.txt : disease semantic similarity 1(383×383)

disease semantic similarity matrix 2.txt : disease semantic similarity 2(383×383)

functional similarity matrix.txt ：microRNA functional similarity(495×495)

knowndiseasemirnainteraction.txt：known microRNA-disease associations(5430*2)

disease name.xlsx : ID of all diseases

miRNA name.xlsx : ID of all microRNAs

## Program：

BIRWMDA_predict.m：main interface for running the program

gaussiansimilarity.m：calculate Gaussian interaction profile kernel similarity for microRNA and disease

SNF.m：fusion of multiple biological information networks

BIRWMDA.m：random walk microRNA and disease similarity network, respectively

Rank.m：sorting disease-related microRNAs scores

Write_file.m：write results to excel

## Operating environment：

software：matlab 2016a or later

processor：Intel(R) Xeon(R) CPU E5-1630 v4 @3.70GHz

recommended memory：8G

## Citation：

If you use the code of this project, please cite our paper.  

Source of the paper: https://www.eurekaselect.com/183785/article  

@article{2020Fusing,
  title={Fusing multiple biological networks to effectively predict miRNA-disease associations},  
  author={Qingqi Zhu, Yongxian Fan and Xiaoyong Pan},  
  journal={Current Bioinformatics},
  volume={16},
  page={371-384},  
  year={2021},
  doi={10.2174/1574893615999200715165335}  
}


## Contacts：

If you have any questions or comments, please feel free to email augustqq@163.com
