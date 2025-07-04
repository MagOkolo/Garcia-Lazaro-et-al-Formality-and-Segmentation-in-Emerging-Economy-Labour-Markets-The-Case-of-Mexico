# Formality and Segmentation in Emerging Economy Labour Markets: The Case of Mexico

Garcia-Lazaro, A., Martin, C., Okolo, M.

## Abstract

We investigate labour market segmentation in Mexico using clustering, a form of unsupervised Machine Learning. We have two main findings. 
First, education and occupation are more important determinants of segmentation than informality; this challenges the popular “formal-informal segmentation
hypothesis” which assumes that labour markets are segmented between formal and informal jobs.
Second, segmentation reflects interactions between different characteristics, especially education and occupation.
The nonlinearity implied by these interactions challenges the widely-used methodology of investigating segmentation using regressions.
We find that there are different wage premia associated with both segmentation and formality, supporting our argument that these are not synonymous. These vary across
the wage distribution, with the premium associated with segmentation being larger than that associated with formality at the higher end of the distribution but smaller at the lower end.

## How to Replicate the Results

`gen_mexico_data.do` generates Table 1. The full ENOE dataset used in this analysis is too large to be included in this repository but it is available from the Instituto Nacional de Estadística y Geografía (INEGI) at the following link: https://www.inegi.org.mx/programas/enoe/

`gen_table_2.m` executes `cluster_2_8` and `sil_stats` and generates Table 2.

`wage_distribution_mexico` generaes Figure 2.

`gen_table_3` uses `mexico_results_wage_data.dta` to generate Table 3.

`mexico_rpart_cm1.R` uses `tree_data.xlsx` to generate Figures 3 and 4.
