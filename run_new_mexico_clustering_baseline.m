
% A) SET-UP AND PREP
clearvars; clear session; close all; clc;
rng('default');
% load the data
load 'new_mexico_data';

%%%%%%%%%%%%%%%%%%%%
% now define the set of variables to use in clustering 
%data=[informal ed_upto_15 ed_upto_18 vocational Undergrad_plus...
data=[informal ed_upto_15 ed_upto_18 vocational Undergrad_plus...
    occ_high occ_medb... %occ_lowb ...    
    govjob ...
    ten_long ten_short...
    female kids...
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
size_sil=0.05;
% the next codes calculate silhouette stats for the whole sample
% Results stored in sil_stat_summary_s
sil_stats
% the next codes do the same for 10 random subsamples
% results stored in best_av_k(1,ii) and best_min_k
sil_stats_by_decile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate the OMEGA Statistics 
omega_stats%  Calculate gamma statistics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  results stored in gamma_stat
gamma_stats
%%%%%%%%%%%%%

% ALTERNATIVE CLUSTERING ALGORITHMS 
% results stored in pc_same_kmean and pc_same_fuzz
alt_algo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% SAVE RESULTS INTO AN EXCEL FILE FOR READING INTO STATA


T = table(informal,occ_high, occ_medb, occ_lowb,...
    ed_upto_15, ed_upto_18, vocational, Undergrad_plus,...    
    ten_long, ten_short,...
    workers_25_39, workers_40_54,workers_55_65plus,... 
    North, CentreNorth, CentreX, South,...
    govjob, ...
    female,kids, ... 
    IDX_2,IDX_3,IDX_4,...
    log_w_h,log_w_m    );
filename = 'm_to_e_mexico_new.xlsx';
writetable(T,filename,'Sheet',1);

%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%

type=zeros(nobs,1);
%1
for i=1:nobs
   if Undergrad_plus(i,1)==1
       if occ_high(i,1)==1
                  type(i,1)=1;
       end
   end
end
%2
for i=1:nobs
   if Undergrad_plus(i,1)==1
       if occ_medb(i,1)==1
                  type(i,1)=2;
       end
   end
end
%3
for i=1:nobs
   if Undergrad_plus(i,1)==1
       if occ_lowb(i,1)==1
                  type(i,1)=3;
       end
   end
end
%4
for i=1:nobs
   if Undergrad_plus(i,1)==0
       if occ_high(i,1)==1
                  type(i,1)=4;
       end
   end
end
%5
for i=1:nobs
   if Undergrad_plus(i,1)==0
       if occ_medb(i,1)==1
                  type(i,1)=5;
       end
   end
end
%6
for i=1:nobs
   if Undergrad_plus(i,1)==0
       if occ_lowb(i,1)==1
                  type(i,1)=6;
       end
   end
end

zz1=zeros(6,1)
zz1(1,1)=sum(type(:,1) == 1)/nobs
zz1(2,1)=sum(type(:,1) == 2)/nobs
zz1(3,1)=sum(type(:,1) == 3)/nobs
zz1(4,1)=sum(type(:,1) == 4)/nobs
zz1(5,1)=sum(type(:,1) == 5)/nobs
zz1(6,1)=sum(type(:,1) == 6)/nobs

% zz1=zeros(6,1)
% zz1(1,1)=sum(type(:,1) == 1)/nobs
% zz1(2,1)=sum(type(:,1) == 2)/nobs
% zz1(3,1)=sum(type(:,1) == 3)/nobs
% zz1(1,2)=sum(type(:,1) == 4)/nobs
% zz1(2,2)=sum(type(:,1) == 5)/nobs
% zz1(3,2)=sum(type(:,1) == 6)/nobs

figure(41)
a2=bar(zz1,'stacked')
%legend({'With Degree','No Degree'})
xlabel('High And Graduate                 Medium And Graduate              Low And Graduate                    High Not Graduate              Medium Not Graduate              Low Not Graduate')
ylabel('Proportion of Employment')
title('Composition of Employment By Education and Occupation')
%%%%%%%
type2=zeros(nobs,1);
%1
for i=1:nobs
   if type(i,1)==1
       if IDX_2(i,1)==1
                  type2(i,1)=1;
       end
   end
end
%2
for i=1:nobs
   if type(i,1)==1
       if IDX_2(i,1)==2
                  type2(i,1)=2;
       end
   end
end
%3
for i=1:nobs
   if type(i,1)==2
       if IDX_2(i,1)==1
                  type2(i,1)=3;
       end
   end
end
%4
for i=1:nobs
   if type(i,1)==2
       if IDX_2(i,1)==2
                  type2(i,1)=4;
       end
   end
end
%5
for i=1:nobs
   if type(i,1)==3
       if IDX_2(i,1)==1
                  type2(i,1)=5;
       end
   end
end
%6
for i=1:nobs
   if type(i,1)==3
       if IDX_2(i,1)==2
                  type2(i,1)=6;
       end
   end
end
%7
for i=1:nobs
   if type(i,1)==4
       if IDX_2(i,1)==1
                  type2(i,1)=7;
       end
   end
end
%8
for i=1:nobs
   if type(i,1)==4
       if IDX_2(i,1)==2
                  type2(i,1)=8;
       end
   end
end
%9
for i=1:nobs
   if type(i,1)==5
       if IDX_2(i,1)==1
                  type2(i,1)=9;
       end
   end
end
%10
for i=1:nobs
   if type(i,1)==5
       if IDX_2(i,1)==2
                  type2(i,1)=10;
       end
   end
end
%11
for i=1:nobs
   if type(i,1)==6
       if IDX_2(i,1)==1
                  type2(i,1)=11;
       end
   end
end
%12
for i=1:nobs
   if type(i,1)==6
       if IDX_2(i,1)==2
                  type2(i,1)=12;
       end
   end
end


zz2=zeros(6,2)
zz2(1,1)=sum(type2(:,1) == 1)/nobs
zz2(1,2)=sum(type2(:,1) == 2)/nobs
zz2(2,1)=sum(type2(:,1) == 3)/nobs
zz2(2,2)=sum(type2(:,1) == 4)/nobs
zz2(3,1)=sum(type2(:,1) == 5)/nobs
zz2(3,2)=sum(type2(:,1) == 6)/nobs
zz2(4,1)=sum(type2(:,1) == 7)/nobs
zz2(4,2)=sum(type2(:,1) == 8)/nobs
zz2(5,1)=sum(type2(:,1) == 9)/nobs
zz2(5,2)=sum(type2(:,1) == 10)/nobs
zz2(6,1)=sum(type2(:,1) == 11)/nobs
zz2(6,2)=sum(type2(:,1) == 12)/nobs


figure(42)
a42=bar(zz2,'stacked')
legend({'Low Productivity Segment','High Productivity Segment'})
xlabel('High And Graduate                 Medium And Graduate              Low And Graduate                    High Not Graduate              Medium Not Graduate              Low Not Graduate')
ylabel('Proportion of Employment')
title('Composition of Employment By Education, Occupation and Segment (2 Segment Case)')
set(a42,{'FaceColor'},{'r';'b'});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

type3=zeros(nobs,1);
%1
for i=1:nobs
   if type2(i,1)==1
       if informal(i,1)==0
                  type3(i,1)=1;
       end
   end
end
%2
for i=1:nobs
   if type2(i,1)==1
       if informal(i,1)==1
                  type3(i,1)=2;
       end
   end
end
%3
for i=1:nobs
   if type2(i,1)==2
       if informal(i,1)==0
                  type3(i,1)=3;
       end
   end
end
%4
for i=1:nobs
   if type2(i,1)==2
       if informal(i,1)==1
                  type3(i,1)=4;
       end
   end
end
%5
for i=1:nobs
   if type2(i,1)==3
       if informal(i,1)==0
                  type3(i,1)=5;
       end
   end
end
%6
for i=1:nobs
   if type2(i,1)==3
       if informal(i,1)==1
                  type3(i,1)=6;
       end
   end
end
%7
for i=1:nobs
   if type2(i,1)==4
       if informal(i,1)==0
                  type3(i,1)=7;
       end
   end
end
%8
for i=1:nobs
   if type2(i,1)==4
       if informal(i,1)==1
                  type3(i,1)=8;
       end
   end
end
%9
for i=1:nobs
   if type2(i,1)==5
       if informal(i,1)==0
                  type3(i,1)=9;
       end
   end
end
%10
for i=1:nobs
   if type2(i,1)==5
       if informal(i,1)==1
                  type3(i,1)=102;
       end
   end
end
%11
for i=1:nobs
   if type2(i,1)==6
       if informal(i,1)==0
                  type3(i,1)=11;
       end
   end
end
%12
for i=1:nobs
   if type2(i,1)==6
       if informal(i,1)==1
                  type3(i,1)=12;
       end
   end
end
%13
for i=1:nobs
   if type2(i,1)==7
       if informal(i,1)==0
                  type3(i,1)=13;
       end
   end
end
%14
for i=1:nobs
   if type2(i,1)==7
       if informal(i,1)==1
                  type3(i,1)=14;
       end
   end
end
%15
for i=1:nobs
   if type2(i,1)==8
       if informal(i,1)==0
                  type3(i,1)=15;
       end
   end
end
%16
for i=1:nobs
   if type2(i,1)==8
       if informal(i,1)==1
                  type3(i,1)=16;
       end
   end
end
%17
for i=1:nobs
   if type2(i,1)==9
       if informal(i,1)==0
                  type3(i,1)=17;
       end
   end
end
%18
for i=1:nobs
   if type2(i,1)==9
       if informal(i,1)==1
                  type3(i,1)=18;
       end
   end
end
%19
for i=1:nobs
   if type2(i,1)==10
       if informal(i,1)==0
                  type3(i,1)=19;
       end
   end
end
%20
for i=1:nobs
   if type2(i,1)==10
       if informal(i,1)==1
                  type3(i,1)=20;
       end
   end
end
%21
for i=1:nobs
   if type2(i,1)==11
       if informal(i,1)==0
                  type3(i,1)=21;
       end
   end
end
%22
for i=1:nobs
   if type2(i,1)==11
       if informal(i,1)==1
                  type3(i,1)=22;
       end
   end
end
%23
for i=1:nobs
   if type2(i,1)==12
       if informal(i,1)==0
                  type3(i,1)=23;
       end
   end
end
%24
for i=1:nobs
   if type2(i,1)==12
       if informal(i,1)==1
                  type3(i,1)=24;
       end
   end
end

zz3=zeros(6,4)
zz3(1,1)=sum(type3(:,1) == 1)/nobs
zz3(1,2)=sum(type3(:,1) == 2)/nobs
zz3(1,3)=sum(type3(:,1) == 3)/nobs
zz3(1,4)=sum(type3(:,1) == 4)/nobs
zz3(2,1)=sum(type3(:,1) == 5)/nobs
zz3(2,2)=sum(type3(:,1) == 6)/nobs
zz3(2,3)=sum(type3(:,1) == 7)/nobs
zz3(2,4)=sum(type3(:,1) == 8)/nobs
zz3(3,1)=sum(type3(:,1) == 9)/nobs
zz3(3,2)=sum(type3(:,1) == 10)/nobs
zz3(3,3)=sum(type3(:,1) == 11)/nobs
zz3(3,4)=sum(type3(:,1) == 12)/nobs
zz3(4,1)=sum(type3(:,1) == 13)/nobs
zz3(4,2)=sum(type3(:,1) == 14)/nobs
zz3(4,3)=sum(type3(:,1) == 15)/nobs
zz3(4,4)=sum(type3(:,1) == 16)/nobs
zz3(5,1)=sum(type3(:,1) == 17)/nobs
zz3(5,2)=sum(type3(:,1) == 18)/nobs
zz3(5,3)=sum(type3(:,1) == 19)/nobs
zz3(5,4)=sum(type3(:,1) == 20)/nobs
zz3(6,1)=sum(type3(:,1) == 21)/nobs
zz3(6,2)=sum(type3(:,1) == 22)/nobs
zz3(6,3)=sum(type3(:,1) == 23)/nobs
zz3(6,4)=sum(type3(:,1) == 24)/nobs

figure(44)
a44=bar(zz3,'stacked')
legend({'Low Productivity Segment Formal','Low Productivity Segment Informal','High Productivity Segment Formal','High Productivity Segment Informal'})
xlabel('High And Graduate                 Medium And Graduate              Low And Graduate                    High Not Graduate              Medium Not Graduate              Low Not Graduate')
ylabel('Proportion of Employment')
title('Composition of Employment By Education, Occupation, Segment and Informality')

zz4=zeros(6,2)
zz4(1,1)=zz3(1,1)+zz3(1,3)
zz4(1,2)=zz3(1,2)+zz3(1,4)
zz4(2,1)=zz3(2,1)+zz3(2,3)
zz4(2,2)=zz3(2,2)+zz3(2,4)
zz4(3,1)=zz3(3,1)+zz3(3,3)
zz4(3,2)=zz3(3,2)+zz3(3,4)
zz4(4,1)=zz3(4,1)+zz3(4,3)
zz4(4,2)=zz3(4,2)+zz3(4,4)
zz4(5,1)=zz3(5,1)+zz3(5,3)
zz4(5,2)=zz3(5,2)+zz3(5,4)
zz4(6,1)=zz3(6,1)+zz3(6,3)
zz4(6,2)=zz3(6,2)+zz3(6,4)


figure(43)
a43=bar(zz4,'stacked')
legend({'Formal','Informal'})
xlabel('High And Graduate                 Medium And Graduate              Low And Graduate                    High Not Graduate              Medium Not Graduate              Low Not Graduate')
ylabel('Proportion of Employment')
title('Composition of Employment By Education, Occupation and Informality')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

type5=zeros(nobs,1);
%1
for i=1:nobs
   if type(i,1)==1
       if IDX_3(i,1)==1
                  type5(i,1)=1;
       end
   end
end
%2
for i=1:nobs
   if type(i,1)==1
       if IDX_3(i,1)==2
                  type5(i,1)=2;
       end
   end
end
%3
for i=1:nobs
   if type(i,1)==1
       if IDX_3(i,1)==3
                  type5(i,1)=3;
       end
   end
end
%4
for i=1:nobs
   if type(i,1)==2
       if IDX_3(i,1)==1
                  type5(i,1)=4;
       end
   end
end
%5
for i=1:nobs
   if type(i,1)==2
       if IDX_3(i,1)==2
                  type5(i,1)=5;
       end
   end
end
%6
for i=1:nobs
   if type(i,1)==2
       if IDX_3(i,1)==3
                  type5(i,1)=6;
       end
   end
end
%7
for i=1:nobs
   if type(i,1)==3
       if IDX_3(i,1)==1
                  type5(i,1)=7;
       end
   end
end
%8
for i=1:nobs
   if type(i,1)==3
       if IDX_3(i,1)==2
                  type5(i,1)=8;
       end
   end
end
%9
for i=1:nobs
   if type(i,1)==3
       if IDX_3(i,1)==3
                  type5(i,1)=9;
       end
   end
end
%10
for i=1:nobs
   if type(i,1)==4
       if IDX_3(i,1)==1
                  type5(i,1)=10;
       end
   end
end
%11
for i=1:nobs
   if type(i,1)==4
       if IDX_3(i,1)==2
                  type5(i,1)=11;
       end
   end
end
%12
for i=1:nobs
   if type(i,1)==4
       if IDX_3(i,1)==3
                  type5(i,1)=12;
       end
   end
end
%13
for i=1:nobs
   if type(i,1)==5
       if IDX_3(i,1)==1
                  type5(i,1)=13;
       end
   end
end
%14
for i=1:nobs
   if type(i,1)==5
       if IDX_3(i,1)==2
                  type5(i,1)=14;
       end
   end
end
%15
for i=1:nobs
   if type(i,1)==5
       if IDX_3(i,1)==3
                  type5(i,1)=15;
       end
   end
end
%16
for i=1:nobs
   if type(i,1)==6
       if IDX_3(i,1)==1
                  type5(i,1)=16;
       end
   end
end
%17
for i=1:nobs
   if type(i,1)==6
       if IDX_3(i,1)==2
                  type5(i,1)=17;
       end
   end
end
%18
for i=1:nobs
   if type(i,1)==6
       if IDX_3(i,1)==3
                  type5(i,1)=18;
       end
   end
end

zz5=zeros(6,2)
zz5(1,1)=sum(type5(:,1) == 1)/nobs
zz5(1,2)=sum(type5(:,1) == 2)/nobs
zz5(1,3)=sum(type5(:,1) == 3)/nobs
zz5(2,1)=sum(type5(:,1) == 4)/nobs
zz5(2,2)=sum(type5(:,1) == 5)/nobs
zz5(2,3)=sum(type5(:,1) == 6)/nobs
zz5(3,1)=sum(type5(:,1) == 7)/nobs
zz5(3,2)=sum(type5(:,1) == 8)/nobs
zz5(3,3)=sum(type5(:,1) == 9)/nobs
zz5(4,1)=sum(type5(:,1) == 10)/nobs
zz5(4,2)=sum(type5(:,1) == 11)/nobs
zz5(4,3)=sum(type5(:,1) == 12)/nobs
zz5(5,1)=sum(type5(:,1) == 13)/nobs
zz5(5,2)=sum(type5(:,1) == 14)/nobs
zz5(5,3)=sum(type5(:,1) == 15)/nobs
zz5(6,1)=sum(type5(:,1) == 16)/nobs
zz5(6,2)=sum(type5(:,1) == 17)/nobs
zz5(6,3)=sum(type5(:,1) == 18)/nobs


figure(45)
a45=bar(zz5,'stacked')
legend({'Low Productivity Segment','Segment 2','High Productivity Segment'})
xlabel('High And Graduate                 Medium And Graduate              Low And Graduate                    High Not Graduate              Medium Not Graduate              Low Not Graduate')
ylabel('Proportion of Employment')
title('Composition of Employment By Education, Occupation and Segment (3 Segment Case)')
set(a45,{'FaceColor'},{'r';'g';'b'});


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
zz6=zeros(2,2)
%LP-F
zz6(2,1)=zz3(1,1)+zz3(2,1)+zz3(3,1)+zz3(4,1)+zz3(5,1)+zz3(6,1)
% LP-I
zz6(2,2)=zz3(1,2)+zz3(2,2)+zz3(3,2)+zz3(4,2)+zz3(5,2)+zz3(6,2)
%HP-F
zz6(1,1)=zz3(1,3)+zz3(2,3)+zz3(3,3)+zz3(4,3)+zz3(5,3)+zz3(6,3)
% HP-I
zz6(1,2)=zz3(1,4)+zz3(2,4)+zz3(3,4)+zz3(4,4)+zz3(5,4)+zz3(6,4)

figure(46)
a46=bar(zz6,'stacked')
xlabel('High Productivity Segment                                                       Low Productvity Segment')
ylabel('Proportion of Employment')
legend({'Formal','Informal'})
title('Composition of Employment By Segment and Informality')
%%%%%%%%%%%%%

share_formal=sum(informal(:,1) == 0)/nobs
share_high_prod=sum(IDX_2(:,1) == 2)/nobs

%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure(441)
a2=bar(zz1,'stacked')
%legend({'With Degree','No Degree'})
xlabel('High And Graduate                 Medium And Graduate              Low And Graduate                    High Not Graduate              Medium Not Graduate              Low Not Graduate')
ylabel('Proportion of Employment')
title('Composition of Employment By Education and Occupation')
zz1p = zz1'
xbarCnt = vertcat(a2.XEndPoints); 
ybarTop = vertcat(a2.YEndPoints);
ybarCnt = ybarTop - zz1p/2;

% Create text strings
txt = compose('%.3f',zz1p);
% Add text 
th = text(xbarCnt(:), ybarCnt(:), txt(:), ...
    'HorizontalAlignment', 'center', ....
    'VerticalAlignment', 'middle', ...
    'Color', 'w',....
    'FontSize', 12);
%%%


figure(442)
a42=bar(zz2,'stacked')
legend({'Low Productivity Segment','High Productivity Segment'})
xlabel('High And Graduate                 Medium And Graduate              Low And Graduate                    High Not Graduate              Medium Not Graduate              Low Not Graduate')
ylabel('Proportion of Employment')
title('Composition of Employment By Education, Occupation and Segment (2 Segment Case)')
set(a42,{'FaceColor'},{'r';'b'});
zz2p = zz2'
xbarCnt = vertcat(a42.XEndPoints); 
ybarTop = vertcat(a42.YEndPoints);
ybarCnt = ybarTop - zz2p/2;
% Create text strings
txt = compose('%.3f',zz2p);
%textp=txt'
% Add text 
th = text(xbarCnt(:), ybarCnt(:), txt(:), ...
    'HorizontalAlignment', 'center', ....
    'VerticalAlignment', 'middle', ...
    'Color', 'w',....
    'FontSize', 12);

%%%

figure(446)
a44=bar(zz3,'stacked')
legend({'Low Productivity Segment Formal','Low Productivity Segment Informal','High Productivity Segment Formal','High Productivity Segment Informal'})
xlabel('High And Graduate                 Medium And Graduate              Low And Graduate                    High Not Graduate              Medium Not Graduate              Low Not Graduate')
ylabel('Proportion of Employment')
title('Composition of Employment By Education, Occupation, Segment and Informality')
zz3p = zz3'
xbarCnt = vertcat(a44.XEndPoints); 
ybarTop = vertcat(a44.YEndPoints);
ybarCnt = ybarTop - zz3p/2;
% Create text strings
txt = compose('%.3f',zz3p);
%textp=txt'
% Add text 
th = text(xbarCnt(:), ybarCnt(:), txt(:), ...
    'HorizontalAlignment', 'center', ....
    'VerticalAlignment', 'middle', ...
    'Color', 'w',....
    'FontSize', 12);

%%%%%

figure(443)
a43=bar(zz4,'stacked')
legend({'Formal','Informal'})
xlabel('High And Graduate                 Medium And Graduate              Low And Graduate                    High Not Graduate              Medium Not Graduate              Low Not Graduate')
ylabel('Proportion of Employment')
title('Composition of Employment By Education, Occupation and Informality')
zz4p = zz4'
xbarCnt = vertcat(a43.XEndPoints); 
ybarTop = vertcat(a43.YEndPoints);
ybarCnt = ybarTop - zz4p/2;
% Create text strings
txt = compose('%.3f',zz4p);
%textp=txt'
% Add text 
th = text(xbarCnt(:), ybarCnt(:), txt(:), ...
    'HorizontalAlignment', 'center', ....
    'VerticalAlignment', 'middle', ...
    'Color', 'w',....
    'FontSize', 12);
%%%%%%

figure(446)
a446=bar(zz6,'stacked')
xlabel('High Productivity Segment                                                       Low Productvity Segment')
ylabel('Proportion of Employment')
legend({'Formal','Informal'})
title('Composition of Employment By Segment and Informality')
zz6p = zz6'
xbarCnt = vertcat(a446.XEndPoints); 
ybarTop = vertcat(a446.YEndPoints);
ybarCnt = ybarTop - zz6p/2;
% Create text strings
txt = compose('%.3f',zz6p);
% Add text 
th = text(xbarCnt(:), ybarCnt(:), txt(:), ...
    'HorizontalAlignment', 'center', ....
    'VerticalAlignment', 'middle', ...
    'Color', 'w',....
    'FontSize', 12);
%%%%%%%%%%%


figure(445)
a445=bar(zz5,'stacked')
legend({'Low Productivity Segment','Segment 2','High Productivity Segment'})
xlabel('High And Graduate                 Medium And Graduate              Low And Graduate                    High Not Graduate              Medium Not Graduate              Low Not Graduate')
ylabel('Proportion of Employment')
title('Composition of Employment By Education, Occupation and Segment (3 Segment Case)')
set(a445,{'FaceColor'},{'r';'g';'b'});
zz5p = zz5'
xbarCnt = vertcat(a445.XEndPoints); 
ybarTop = vertcat(a445.YEndPoints);
ybarCnt = ybarTop - zz5p/2;
% Create text strings
txt = compose('%.3f',zz5p);
% Add text 
th = text(xbarCnt(:), ybarCnt(:), txt(:), ...
    'HorizontalAlignment', 'center', ....
    'VerticalAlignment', 'middle', ...
    'Color', 'w',....
    'FontSize', 12);


%%%%%%%%%%%%%%%%%%%%
% type=zeros(nobs,1);
% type_i=zeros(nobs,1);
% type_s_i=zeros(nobs,1);
% 
% 
% for i=1:nobs
%    if Undergrad_plus(i,1)==1
%        if occ_high(i,1)==1
%                   type(i,1)=1;
%        else
%                     type(i,1)=2;
%        end
%    end
% end
% 
% for i=1:nobs
%    if Undergrad_plus(i,1)==0
%        if occ_high(i,1)==1
%                   type(i,1)=3;
%        else
%                     type(i,1)=4;
%        end
%    end
% end
% a1=sum(type(:,1) == 1)
% a2=sum(type(:,1) == 2)
% a3=sum(type(:,1) == 3)
% a4=sum(type(:,1) == 4)
% %%%
% for i=1:nobs
%    if type(i,1)==1
%        if informal(i,1)==1
%                   type_i(i,1)=1;
%        else
%                     type_i(i,1)=2;
%        end
%    end
% end
% 
% a1_i=sum(type_i(:,1) == 1)
% a2_i=sum(type_i(:,1) == 2)
% chk_1=a1-a1_i-a2_i
% 
% %%%%
% for i=1:nobs
%    if type(i,1)==2
%        if informal(i,1)==1
%                   type_i(i,1)=3;
%        else
%                     type_i(i,1)=4;
%        end
%    end
% end
% 
% a3_i=sum(type_i(:,1) == 3)
% a4_i=sum(type_i(:,1) == 4)
% chk_2=a2-a3_i-a4_i
% %%%
% for i=1:nobs
%    if type(i,1)==3
%        if informal(i,1)==1
%                   type_i(i,1)=5;
%        else
%                     type_i(i,1)=6;
%        end
%    end
% end
% 
% a5_i=sum(type_i(:,1) == 5)
% a6_i=sum(type_i(:,1) == 6)
% chk_3=a3-a5_i-a6_i
% %%%
% for i=1:nobs
%    if type(i,1)==4
%        if informal(i,1)==1
%                   type_i(i,1)=7;
%        else
%                     type_i(i,1)=8;
%        end
%    end
% end
% 
% a7_i=sum(type_i(:,1) == 7)
% a8_i=sum(type_i(:,1) == 8)
% chk_4=a4-a7_i-a8_i
% %%%%%%%%%%%%%%%%%%
% 
% type_s_i=zeros(nobs,1);
% 
% for i=1:nobs
%    if type_i(i,1)==1
%        if IDX_3(i,1)==1
%                   type_s_i(i,1)=1;
%        elseif IDX_3(i,1)==2 
%                     type_s_i(i,1)=2;
%        elseif IDX_3(i,1)==3
%                     type_s_i(i,1)=3;
%        else         %type_s_i_(i,1)=4;
%        end
%    end
% end
% 
% a1_i
% a1_s_i=sum(type_s_i(:,1) == 1)
% a2_s_i=sum(type_s_i(:,1) == 2)
% a3_s_i=sum(type_s_i(:,1) == 3)
% chk_s_1=a1_i-a1_s_i-a2_s_i-a3_s_i
% 
% 
% 
% %%%
% 
% for i=1:nobs
%    if type_i(i,1)==2
%        if IDX_3(i,1)==1
%                   type_s_i(i,1)=4;
%        elseif IDX_3(i,1)==2 
%                     type_s_i(i,1)=5;
%        elseif IDX_3(i,1)==3
%                     type_s_i(i,1)=6;
%        else         %type_s_i_(i,1)=4;
%        end
%    end
% end
% 
% a4_s_i=sum(type_s_i(:,1) == 4)
% a5_s_i=sum(type_s_i(:,1) == 5)
% a6_s_i=sum(type_s_i(:,1) == 6)
% chk_s_2=a2_i-a4_s_i-a5_s_i-a6_s_i
% 
% %
% 
% for i=1:nobs
%    if type_i(i,1)==3
%        if IDX_3(i,1)==1
%                   type_s_i(i,1)=7;
%        elseif IDX_3(i,1)==2 
%                     type_s_i(i,1)=8;
%        elseif IDX_3(i,1)==3
%                     type_s_i(i,1)=9;
%        else         %type_s_i_(i,1)=4;
%        end
%    end
% end
% 
% a7_s_i=sum(type_s_i(:,1) == 7)
% a8_s_i=sum(type_s_i(:,1) == 8)
% a9_s_i=sum(type_s_i(:,1) == 9)
% chk_s_3=a3_i-a7_s_i-a8_s_i-a9_s_i
% 
% %
% for i=1:nobs
%    if type_i(i,1)==4
%        if IDX_3(i,1)==1
%                   type_s_i(i,1)=10;
%        elseif IDX_3(i,1)==2 
%                     type_s_i(i,1)=11;
%        elseif IDX_3(i,1)==3
%                     type_s_i(i,1)=12;
%        else         %type_s_i_(i,1)=4;
%        end
%    end
% end
% 
% a10_s_i=sum(type_s_i(:,1) == 10)
% a11_s_i=sum(type_s_i(:,1) == 11)
% a12_s_i=sum(type_s_i(:,1) == 12)
% chk_s_4=a4_i-a10_s_i-a11_s_i-a12_s_i
% 
% % %
% for i=1:nobs
%    if type_i(i,1)==5
%        if IDX_3(i,1)==1
%                   type_s_i(i,1)=13;
%        elseif IDX_3(i,1)==2 
%                     type_s_i(i,1)=14;
%        elseif IDX_3(i,1)==3
%                     type_s_i(i,1)=15;
%        else         %type_s_i_(i,1)=4;
%        end
%    end
% end
% 
% a13_s_i=sum(type_s_i(:,1) == 13)
% a14_s_i=sum(type_s_i(:,1) == 14)
% a15_s_i=sum(type_s_i(:,1) == 15)
% chk_s_5=a5_i-a13_s_i-a14_s_i-a15_s_i
% 
% % %
% for i=1:nobs
%    if type_i(i,1)==6
%        if IDX_3(i,1)==1
%                   type_s_i(i,1)=16;
%        elseif IDX_3(i,1)==2 
%                     type_s_i(i,1)=17;
%        elseif IDX_3(i,1)==3
%                     type_s_i(i,1)=18;
%        else         %type_s_i_(i,1)=4;
%        end
%    end
% end
% 
% a16_s_i=sum(type_s_i(:,1) == 16)
% a17_s_i=sum(type_s_i(:,1) == 17)
% a18_s_i=sum(type_s_i(:,1) == 18)
% chk_s_6=a6_i-a16_s_i-a17_s_i-a18_s_i
% 
% %
% % %
% for i=1:nobs
%    if type_i(i,1)==7
%        if IDX_3(i,1)==1
%                   type_s_i(i,1)=19;
%        elseif IDX_3(i,1)==2 
%                     type_s_i(i,1)=20;
%        elseif IDX_3(i,1)==3
%                     type_s_i(i,1)=21;
%        else         %type_s_i_(i,1)=4;
%        end
%    end
% end
% 
% a19_s_i=sum(type_s_i(:,1) == 19)
% a20_s_i=sum(type_s_i(:,1) == 20)
% a21_s_i=sum(type_s_i(:,1) == 21)
% chk_s_7=a7_i-a19_s_i-a20_s_i-a21_s_i
% 
% %
% % %
% for i=1:nobs
%    if type_i(i,1)==8
%        if IDX_3(i,1)==1
%                   type_s_i(i,1)=22;
%        elseif IDX_3(i,1)==2 
%                     type_s_i(i,1)=23;
%        elseif IDX_3(i,1)==3
%                     type_s_i(i,1)=24;
%        else         %type_s_i_(i,1)=4;
%        end
%    end
% end
% 
% a22_s_i=sum(type_s_i(:,1) == 22)
% a23_s_i=sum(type_s_i(:,1) == 23)
% a24_s_i=sum(type_s_i(:,1) == 24)
% chk_s_8=a8_i-a22_s_i-a23_s_i-a24_s_i
% 
% 
% 
% %%%%%%%%%%%%%%%%
% z1(1,1)=sum(type(:,1) == 1)/nobs
% z1(2,1)=sum(type(:,1) == 2)/nobs
% z1(3,1)=sum(type(:,1) == 3)/nobs
% z1(4,1)=sum(type(:,1) == 4)/nobs
% 
% z2(1,1)=sum(type_i(:,1) == 1)/nobs
% z2(1,2)=sum(type_i(:,1) == 2)/nobs
% z2(2,1)=sum(type_i(:,1) == 3)/nobs
% z2(2,2)=sum(type_i(:,1) == 4)/nobs
% z2(3,1)=sum(type_i(:,1) == 5)/nobs
% z2(3,2)=sum(type_i(:,1) == 6)/nobs
% z2(4,1)=sum(type_i(:,1) == 7)/nobs
% z2(4,2)=sum(type_i(:,1) == 8)/nobs
% 
% z3=zeros(4,6);
% z3(1,1)=sum(type_s_i(:,1) == 1)/nobs
% z3(1,2)=sum(type_s_i(:,1) == 2)/nobs
% z3(1,3)=sum(type_s_i(:,1) == 3)/nobs
% z3(1,4)=sum(type_s_i(:,1) == 4)/nobs
% z3(1,5)=sum(type_s_i(:,1) == 5)/nobs
% z3(1,6)=sum(type_s_i(:,1) == 6)/nobs
% z3(2,1)=sum(type_s_i(:,1) == 7)/nobs
% z3(2,2)=sum(type_s_i(:,1) == 8)/nobs
% z3(2,3)=sum(type_s_i(:,1) == 9)/nobs
% z3(2,4)=sum(type_s_i(:,1) == 10)/nobs
% z3(2,5)=sum(type_s_i(:,1) == 11)/nobs
% z3(2,6)=sum(type_s_i(:,1) == 12)/nobs
% z3(3,1)=sum(type_s_i(:,1) == 13)/nobs
% z3(3,2)=sum(type_s_i(:,1) == 14)/nobs
% z3(3,3)=sum(type_s_i(:,1) == 15)/nobs
% z3(3,4)=sum(type_s_i(:,1) == 16)/nobs
% z3(3,5)=sum(type_s_i(:,1) == 17)/nobs
% z3(3,6)=sum(type_s_i(:,1) == 18)/nobs
% z3(4,1)=sum(type_s_i(:,1) == 19)/nobs
% z3(4,2)=sum(type_s_i(:,1) == 20)/nobs
% z3(4,3)=sum(type_s_i(:,1) == 21)/nobs
% z3(4,4)=sum(type_s_i(:,1) == 22)/nobs
% z3(4,5)=sum(type_s_i(:,1) == 23)/nobs
% z3(4,6)=sum(type_s_i(:,1) == 24)/nobs
% 
% 
% 
% 
% figure(222)
% a2=bar(z1,'stacked')
% %legend({'Highly educated and in a high skill occupation','Neither highly educated nor in a high skill occupation','Highly educated but not in a high skill occupation','Not highly educated but in a high skill occupation'})
% xlabel('Degree and High Skill              Degree and Low Skill                  No Degree and High Skill                      No Degree and Low Skill ')
% ylabel('Proportion of Employment')
% title('Composition of Employment By Education and Occupation')
% 
% 
% figure(224)
% a2=bar(z2,'stacked')
% legend({'Informal','Formal'})
% xlabel('Degree and High Skill              Degree and Low Skill                  No Degree and High Skill                      No Degree and Low Skill ')
% ylabel('Proportion of Employment')
% title('Composition of Employment By Education and Occupation')
% 
% figure(225)
% a3=bar(z3,'stacked')
% title('Composition of Employment By Education, Occupation and Segment')
% ylabel('Proportion of Employment')
% xlabel('Degree and High Skill              Degree and Low Skill                  No Degree and High Skill                      No Degree and Low Skill ')
% legend({'Informal and Segment 1','Informal and Segment 2','Informal and Segment 3','Formal and Segment 1','Formal and Segment 2','Formal and Segment 3'})
