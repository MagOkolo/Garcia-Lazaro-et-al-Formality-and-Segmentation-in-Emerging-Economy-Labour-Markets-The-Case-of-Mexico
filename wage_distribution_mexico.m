
lw_f_hp=NaN(nobs,1);
lw_f_hp_m=NaN(nobs,1);
lw_i_hp=NaN(nobs,1);
lw_i_hp_m=NaN(nobs,1);
lw_f_lp=NaN(nobs,1);
lw_f_lp_m=NaN(nobs,1);
lw_i_lp=NaN(nobs,1);
lw_i_lp_m=NaN(nobs,1);


for i=1:nobs
   if informal(i,1)==0
       if IDX_2(i,1)==2
                  lw_f_hp(i,1)=log_w_h(i,1);
                  lw_f_hp_m(i,1)=log_w_m(i,1);
       end
   end
end
for i=1:nobs
   if informal(i,1)==1
       if IDX_2(i,1)==2
                  lw_i_hp(i,1)=log_w_h(i,1);
                  lw_i_hp_m(i,1)=log_w_m(i,1);
       end
   end
end
for i=1:nobs
   if informal(i,1)==0
       if IDX_2(i,1)==1
                  lw_f_lp(i,1)=log_w_h(i,1);
                  lw_f_lp_m(i,1)=log_w_m(i,1);
       end
   end
end
for i=1:nobs
   if informal(i,1)==1
       if IDX_2(i,1)==1
                  lw_i_lp(i,1)=log_w_h(i,1);
                  lw_i_lp_m(i,1)=log_w_m(i,1);
       end
   end
end


figure(1)
h(1,1)=cdfplot(lw_f_hp)
set( h(:,1), 'LineStyle', '-', 'Color', 'b','LineWidth',2.5);
xlim([1.5 5.5])
hold on
h(1,2)=cdfplot(lw_f_lp)
set( h(:,2), 'LineStyle', '-', 'Color', 'c','LineWidth',2.5);
h(1,3)=cdfplot(lw_i_hp)
set( h(:,3), 'LineStyle', '-', 'Color', 'm','LineWidth',2.5);
h(1,4)=cdfplot(lw_i_lp)
set( h(:,4), 'LineStyle', '-', 'Color', 'g','LineWidth',2.5);
legend('High Productivity Formal','Low Productivity Formal','High Productivity Informal','Low Productivity Informal','location','northwest')
title('Wage Distributions for Formal and Informal Workers in High and Low Productivity Segments')
hold off

[ks,ks_p] = kstest2(lw_f_lp,lw_i_hp);


% ,'LineWidth',1.5



