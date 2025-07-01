
% A) SET-UP AND PREP
clearvars; clear session; close all; clc;
rng('default');
% load the data
load mexico_data_to_cluster_wage_data.mat;

%%%%%%%%%%%%%%%%%%%%
% now define the set of variables to use in clustering 
%data=[informal ed_upto_15 ed_upto_18 vocational Undergrad_plus...
data=[informal ed_has_secondary ed_has_highschool ed_has_degree_voc...
    occ_high occ_medb occ_lowb... %occ_lowb ...    
    govjob ten_long female kids...
    workers_25_39 workers_40_54 workers_55_65plus... 
    North CentreNorth CentreX South...
    ];
 %nokids kids12  kids35 kids6plus ... 
 % We rescale the data so that all variables are between 0 and 1
% it is recommended to do this with clustering analysis
colmin = min(data);
colmax = max(data);
X = rescale(data,'InputMin',colmin,'InputMax',colmax);
nobs=size(data,1);
nvar=size(data,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% K-MEDOIDS ESTIMATION USING THE FULL SAMPLE FOR A RANGE OF VaLUES FOR K
cluster_2_8
% calculate the centroids for k=2
cent_1=X(MIDX_2(1,1),:)';
cent_2=X(MIDX_2(2,1),:)';

cent_3_1=X(MIDX_3(1,1),:)';
cent_3_2=X(MIDX_3(2,1),:)';
cent_3_3=X(MIDX_3(3,1),:)';

cent_4_1=X(MIDX_4(1,1),:)';
cent_4_2=X(MIDX_4(2,1),:)';
cent_4_3=X(MIDX_4(3,1),:)';
cent_4_4=X(MIDX_4(4,1),:)';



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   SILHOUETTES and STATISTICS
% size_sil is the proportion of the sample to use in calculating sil stats
size_sil=0.1;
% the next codes calculate silhouette stats for the whole sample
% Results stored in sil_stat_summary_s
sil_stats

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
