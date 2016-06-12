# GenotypeImputation

## Project Description

This repository will contain the code for the final project for the CS M224 Computational Genetics Class. The goal of the project is to develop a fast and accurate method for imputing missing SNPs in genotype data. This project is mainly motivated by two issues: first -- SNP chips cost more for genotyping more SNPS; second -- different studies often use different SNP chips. Genotype imputation can be used both to reduce costs by using smaller SNP chips and imputing missing values, as well as to combine data from two different studies by imputing the values that are missing in each data set.

To obtain the same results and plots run the followin R scripts in order:
`MLR.R`

`nearestNeighbor.R`

`plotting.R`

The necessary data files should be on git.

## Bio

I am a 2nd year graduate student in the Bioinformatics IDP program, currently working in Jason Ernst's lab on machine learning techniques for investigating the non-coding areas of the human genome. 

## Final Goal
###5/1 
Use the LD structure of the genome to impute missing values.

## Updates

###5/12
1. Weekly progress

Set up README.md file and starting to think about how to tackle this project

2. Next week plan

Read at least a couple papers about how people do this.

3. Grade for week

A+ for starting project

4. Problems that came up

Had not started project

5. Problems solved this week

Actually started project

###5/19
1. Weekly progress

Read a few papers about what the state of the art is in this area. It seems there are a few ways to do this: HMMs, haplotype phasing then nearest neighbor, regression. My initial thought when seeing this was to do a regression based approach -- one classifier for each SNP. This seems reasonable and is probably how I'm going to approach this. Not inclined to do anything haplotype based because it seems that would involve doing the haplotype phasing project first. Either way some sort of reference/training data set is needed to infer the structure and predict the missing values. Downloaded 1000 Genomes to see if it's viable to use that.

2. Next week plan

Start writing code.

3. Grade for week

B because I basically just read some papers and downloaded a data set.

4. Problems that came up

The 1000 Genomes data formatting wasn't super intuitive. 

5. Problems solved this week

Downloaded data and started data wrangling.

###5/26
1. Weekly progress

Discarded 1000 Genomes data. The available data on CCLE is nicely formatted and easy enough to use. Set up exactly how I want to approach the problem: one multinomial logistic regression classifier for each SNP. Multinomial because outcome is discrete, logistic regression because relationship should be somewhat linear. Wrote up baseline method of just picking the most common allele at that variant. Seems reasonable.

2. Next week plan

Figure out some details about how the 'glmnet' package in R works. Seems to do everything I need but unclear on how the cross-validation is done.

3. Grade for week

A- because it took longer than I wanted to write up some code.

4. Problems that came up

Not sure how to deal with the testing data on CCLE which is just 100 SNPs without explanation on where they came from.

5. Problems solved this week

Figured out input data

###6/2
1. Weekly progress

Implemented MLR and it works well. Definitely outperforms picking mode. Might be interesting to also compare to a nearest neighbor approach but only done on genotype data. 

2. Next week plan

Put finishing touches on this. Implement nearest neighbor as well because why not.

3. Grade for week

A+ because I'm basically done.

4. Problems that came up

'glmnet' gave me some headaches due to sparse data and cross-validation. Explain this in final presentation.

5. Problems solved this week

Figured out sparse data issue.

###6/9
1. Weekly progress

Generated plots and working on slides.
 
2. Next week plan
Hand this in.

3. Grade for week

A+ for finishing.

4. Problems that came up

Figuring out how to plot things to properly showcase results was tricky.

5. Problems solved this week

Hopefully I did a good job in my plots.
