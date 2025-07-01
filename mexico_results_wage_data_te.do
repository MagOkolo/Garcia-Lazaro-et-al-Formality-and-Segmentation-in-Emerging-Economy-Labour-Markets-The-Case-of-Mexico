
clear

use temp
/*use results_tables */

gen hp=0
replace hp=1 if IDX_2==2

bysort hp: tabstat informal ed_has_degree_voc


gen grad_hs=0
replace grad_hs=1 if ed_has_degree_voc==1 & occ_high==1
gen grad_hs_A=0
replace grad_hs_A=1 if grad_hs==1 & IDX_2==2
gen grad_hs_A_I=0
replace grad_hs_A_I=1 if grad_hs_A==1 & informal==1
gen grad_hs_A_F=0
replace grad_hs_A_F=1 if grad_hs_A==1 & informal==0
gen grad_hs_B=0
replace grad_hs_B=1 if grad_hs==1 & IDX_2==1
gen grad_hs_B_I=0
replace grad_hs_B_I=1 if grad_hs_B==1 & informal==1
gen grad_hs_B_F=0
replace grad_hs_B_F=1 if grad_hs_B==1 & informal==0
summarize grad_hs_A grad_hs_A_F grad_hs_A_I grad_hs_B grad_hs_B_F grad_hs_B_I

gen grad_ms=0
replace grad_ms=1 if ed_has_degree_voc==1 & occ_med==1
gen grad_ms_A=0
replace grad_ms_A=1 if grad_ms==1 & IDX_2==2
gen grad_ms_A_I=0
replace grad_ms_A_I=1 if grad_ms_A==1 & informal==1
gen grad_ms_A_F=0
replace grad_ms_A_F=1 if grad_ms_A==1 & informal==0
gen grad_ms_B=0
replace grad_ms_B=1 if grad_ms==1 & IDX_2==1
gen grad_ms_B_I=0
replace grad_ms_B_I=1 if grad_ms_B==1 & informal==1
gen grad_ms_B_F=0
replace grad_ms_B_F=1 if grad_ms_B==1 & informal==0
summarize grad_ms_A grad_ms_A_F grad_ms_A_I grad_ms_B grad_ms_B_F grad_ms_B_I

gen grad_ls=0
replace grad_ls=1 if ed_has_degree_voc==1 & occ_low==1
gen grad_ls_A=0
replace grad_ls_A=1 if grad_ls==1 & IDX_2==2
gen grad_ls_A_I=0
replace grad_ls_A_I=1 if grad_ls_A==1 & informal==1
gen grad_ls_A_F=0
replace grad_ls_A_F=1 if grad_ls_A==1 & informal==0
gen grad_ls_B=0
replace grad_ls_B=1 if grad_ls==1 & IDX_2==1
gen grad_ls_B_I=0
replace grad_ls_B_I=1 if grad_ls_B==1 & informal==1
gen grad_ls_B_F=0
replace grad_ls_B_F=1 if grad_ls_B==1 & informal==0
summarize grad_ls_A grad_ls_A_F grad_ls_A_I grad_ls_B grad_ls_B_F grad_ls_B_I


gen nongrad_hs=0
replace nongrad_hs=1 if ed_has_degree_voc==0 & occ_high==1
gen nongrad_hs_A=0
replace nongrad_hs_A=1 if nongrad_hs==1 & IDX_2==2
gen nongrad_hs_A_I=0
replace nongrad_hs_A_I=1 if nongrad_hs_A==1 & informal==1
gen nongrad_hs_A_F=0
replace nongrad_hs_A_F=1 if nongrad_hs_A==1 & informal==0
gen nongrad_hs_B=0
replace nongrad_hs_B=1 if nongrad_hs==1 & IDX_2==1
gen nongrad_hs_B_I=0
replace nongrad_hs_B_I=1 if nongrad_hs_B==1 & informal==1
gen nongrad_hs_B_F=0
replace nongrad_hs_B_F=1 if nongrad_hs_B==1 & informal==0
summarize nongrad_hs_A nongrad_hs_A_F nongrad_hs_A_I nongrad_hs_B nongrad_hs_B_F nongrad_hs_B_I

gen nongrad_ms=0
replace nongrad_ms=1 if ed_has_degree_voc==0 & occ_med==1
gen nongrad_ms_A=0
replace nongrad_ms_A=1 if nongrad_ms==1 & IDX_2==2
gen nongrad_ms_A_I=0
replace nongrad_ms_A_I=1 if nongrad_ms_A==1 & informal==1
gen nongrad_ms_A_F=0
replace nongrad_ms_A_F=1 if nongrad_ms_A==1 & informal==0
gen nongrad_ms_B=0
replace nongrad_ms_B=1 if nongrad_ms==1 & IDX_2==1
gen nongrad_ms_B_I=0
replace nongrad_ms_B_I=1 if nongrad_ms_B==1 & informal==1
gen nongrad_ms_B_F=0
replace nongrad_ms_B_F=1 if nongrad_ms_B==1 & informal==0
summarize nongrad_ms_A nongrad_ms_A_F nongrad_ms_A_I nongrad_ms_B nongrad_ms_B_F nongrad_ms_B_I

gen nongrad_ls=0
replace nongrad_ls=1 if ed_has_degree_voc==0 & occ_low==1
gen nongrad_ls_A=0
replace nongrad_ls_A=1 if nongrad_ls==1 & IDX_2==2
gen nongrad_ls_A_I=0
replace nongrad_ls_A_I=1 if nongrad_ls_A==1 & informal==1
gen nongrad_ls_A_F=0
replace nongrad_ls_A_F=1 if nongrad_ls_A==1 & informal==0
gen nongrad_ls_B=0
replace nongrad_ls_B=1 if nongrad_ls==1 & IDX_2==1
gen nongrad_ls_B_I=0
replace nongrad_ls_B_I=1 if nongrad_ls_B==1 & informal==1
gen nongrad_ls_B_F=0
replace nongrad_ls_B_F=1 if nongrad_ls_B==1 & informal==0
summarize nongrad_ls_A nongrad_ls_A_F nongrad_ls_A_I nongrad_ls_B nongrad_ls_B_F nongrad_ls_B_I


gen grad_hs_F=0
replace grad_hs_F=1 if grad_hs==1 & informal==0
gen grad_hs_I=0
replace grad_hs_I=1 if grad_hs==1 & informal==1
gen grad_ms_F=0
replace grad_ms_F=1 if grad_ms==1 & informal==0
gen grad_ms_I=0
replace grad_ms_I=1 if grad_ms==1 & informal==1
gen grad_ls_F=0
replace grad_ls_F=1 if grad_ls==1 & informal==0
gen grad_ls_I=0
replace grad_ls_I=1 if grad_ls==1 & informal==1

gen nongrad_hs_F=0
replace nongrad_hs_F=1 if nongrad_hs==1 & informal==0
gen nongrad_hs_I=0
replace nongrad_hs_I=1 if nongrad_hs==1 & informal==1
gen nongrad_ms_F=0
replace nongrad_ms_F=1 if nongrad_ms==1 & informal==0
gen nongrad_ms_I=0
replace nongrad_ms_I=1 if nongrad_ms==1 & informal==1
gen nongrad_ls_F=0
replace nongrad_ls_F=1 if nongrad_ls==1 & informal==0
gen nongrad_ls_I=0
replace nongrad_ls_I=1 if nongrad_ls==1 & informal==1

tab ed_has_degree_voc occ_high,cell
tab ed_has_degree_voc occ_med,cell
tab ed_has_degree_voc occ_low,cell

tab ed_has_highschool occ_high,cell
tab ed_has_highschool occ_med,cell
tab ed_has_highschool occ_low,cell

tab ed_has_secondary occ_high,cell
tab ed_has_secondary occ_med,cell
tab ed_has_secondary occ_low,cell

**teffects aipw (log_w_h ed_has_secondary ed_has_highschool ed_has_degree_voc occ_high occ_med informal govjob ten_long female kids  North CentreNorth CentreX  workers_25_39 workers_40_54 workers_55_65plus) (hp ed_has_secondary ed_has_highschool ed_has_degree_voc occ_high occ_med informal govjob ten_long female kids  North CentreNorth CentreX  workers_25_39 workers_40_54 workers_55_65plus   ,probit) 


teffects aipw (log_w_h informal govjob ten_long female kids  North CentreNorth workers_25_39 workers_40_54 workers_55_65plus) (hp  informal govjob ten_long female kids  North CentreNorth workers_25_39 workers_40_54 workers_55_65plus   ,probit) if ed_has_degree_voc==1

teffects aipw (log_w_h informal ed_has_secondary ed_has_highschool ed_has_degree_voc occ_high occ_med) (hp informal ed_has_secondary ed_has_highschool ed_has_degree_voc occ_high occ_med informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus    ,probit) 

teffects aipw (log_w_h informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North CentreNorth ) (hp informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North CentreNorth   ,probit) if ed_has_degree_voc==1

teffects aipw (log_w_h occ_low informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North CentreNorth ) (hp occ_low informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North CentreNorth   ,probit) if ed_has_degree_voc==0

teffects aipw (log_w_h informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North CentreNorth ) (hp informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North CentreNorth   ,probit) if occ_high==1

teffects aipw (log_w_h informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North ) (hp informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North   ,probit) if occ_med==1

teffects aipw (log_w_h ed_has_secondary informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North CentreNorth    ) (hp informal ed_has_secondary govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North CentreNorth   ,probit) if occ_low==1

teffects aipw (log_w_h ed_has_secondary ed_has_highschool ed_has_degree_voc informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North CentreNorth    ) (hp ed_has_secondary informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus  North CentreNorth   ,probit) if occ_low==1

teffects aipw (log_w_h ed_has_secondary ed_has_highschool  ed_has_degree_voc occ_high occ_med informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus North CentreNorth CentreX South) (hp ed_has_secondary ed_has_highschool ed_has_degree_voc occ_high occ_med informal govjob ten_long female kids workers_25_39 workers_40_54 workers_55_65plus North CentreNorth CentreX South  ,probit) 

teffects aipw (log_w_h ed_has_highschool  ed_has_degree_voc occ_high occ_med govjob ten_long female kids workers_25_39) (hp ed_has_highschool ed_has_degree_voc occ_high occ_med govjob ten_long female kids workers_25_39   ,probit) if informal==0


teffects aipw (log_w_h ed_has_secondary ed_has_highschool  ed_has_degree_voc occ_high occ_med govjob ten_long female kids workers_25_39) (hp ed_has_secondary ed_has_highschool ed_has_degree_voc occ_high occ_med govjob ten_long female kids workers_25_39   ,probit) if informal==0

teffects aipw (log_w_h ed_has_secondary ed_has_highschool  ed_has_degree_voc occ_high occ_med govjob ten_long female kids workers_25_39) (hp ed_has_secondary ed_has_highschool ed_has_degree_voc occ_high occ_med govjob ten_long female kids workers_25_39   ,probit) if informal==1


teffects aipw (log_w_h ed_has_secondary ed_has_highschool  ed_has_degree_voc occ_high occ_med govjob ten_long female kids workers_25_39) (hp    ,probit) if informal==0


/*teffects aipw (log_w_h ed_has_secondary ed_has_highschool  ed_has_degree_voc occ_high occ_med govjob ten_long female kids workers_25_39) (hp ed_has_secondary ed_has_highschool ed_has_degree_voc occ_high occ_med govjob ten_long female kids workers_25_39   ,probit) if informal==1 */


teffects aipw (log_w_h govjob ten_long female kids) (hp govjob ten_long female kids   ,probit) if grad_ms_F==1
teffects aipw (log_w_h govjob ten_long female kids) (hp govjob ten_long female kids   ,probit) if grad_ms_I==1
teffects aipw (log_w_h govjob ten_long female kids) (hp govjob ten_long female kids   ,probit) if grad_ls_I==1
teffects aipw (log_w_h govjob ten_long female kids) (hp govjob ten_long female kids   ,probit) if nongrad_hs_F==1
teffects aipw (log_w_h govjob ten_long female kids) (hp govjob ten_long female kids   ,probit) if nongrad_hs_I==1
teffects aipw (log_w_h govjob ten_long female kids) (hp govjob ten_long female kids   ,probit) if nongrad_ms_F==1
teffects aipw (log_w_h govjob ten_long female kids) (hp govjob ten_long female kids   ,probit) if nongrad_ls_F==1


teffects ra (log_w_h govjob ten_long female kids workers_25_39 North  ) (hp) if nongrad_ls_F==1, vce(robust)
 
teffects ipw (log_w_h) (hp govjob ten_long ten_short female kids workers_25_39 workers_40_54 workers_55_65plus North ,probit) if nongrad_ls_F==1

tebalance overid

tebalance summarize

teffects aipw (log_w_h) (hp govjob ten_long female kids   ,probit) if nongrad_ls_F==1

tebalance overid

tebalance summarize
  
teffects psmatch (log_w_h) (hp ten_long govjob female kids  , probit ) if nongrad_ls_F==1  , nneighbor(3) pstolerance(1e-5) vce(robust, nn(3))  





teffects ra (log_w_h govjob ten_long female kids  ) (hp) if nongrad_ls_I==1, vce(robust)
 
teffects ipw (log_w_h) (hp govjob ten_long female kids   ,probit) if nongrad_ls_I==1

tebalance overid

tebalance summarize

teffects aipw (log_w_h) (hp govjob ten_long female kids   ,probit) if nongrad_ls_I==1

tebalance overid

tebalance summarize
  
teffects psmatch (log_w_h) (hp ten_long govjob female kids  , probit ) if nongrad_ls_I==1  , nneighbor(3) pstolerance(1e-5) vce(robust, nn(3))  





teffects ra (log_w_h govjob ten_long female kids  ) (hp) if nongrad_hs_F==1, vce(robust)
 
teffects ipw (log_w_h) (hp govjob ten_long female kids   ,probit) if nongrad_hs_F==1

tebalance overid

tebalance summarize

teffects aipw (log_w_h) (hp govjob ten_long female kids   ,probit) if nongrad_hs_F==1

tebalance overid

tebalance summarize
  
teffects psmatch (log_w_h) (hp ten_long govjob female kids  , probit ) if nongrad_hs_F==1  , nneighbor(3) pstolerance(1e-5) vce(robust, nn(3))  






teffects ra (log_w_h govjob ten_long female kids  ) (hp) if nongrad_hs_I==1, vce(robust)
 
teffects ipw (log_w_h) (hp govjob ten_long female kids   ,probit) if nongrad_hs_I==1


tebalance summarize

teffects aipw (log_w_h) (hp govjob ten_long female kids   ,probit) if nongrad_hs_I==1

tebalance overid

  
teffects psmatch (log_w_h) (hp ten_long govjob female kids  , probit ) if nongrad_hs_I==1  , nneighbor(3) pstolerance(1e-5) vce(robust, nn(3))  






teffects ra (log_w_h govjob ten_long female kids  ) (hp) if grad_ms_I==1, vce(robust)
 
teffects ipw (log_w_h) (hp govjob ten_long female kids   ,probit) if grad_ms_F==1


tebalance summarize

teffects aipw (log_w_h) (hp govjob ten_long female kids   ,probit) if nongrad_hs_I==1

tebalance overid

  
teffects psmatch (log_w_h) (hp ten_long govjob female kids  , probit ) if nongrad_hs_I==1  , nneighbor(3) pstolerance(1e-5) vce(robust, nn(3))  

 
teffects aipw (log_w_h govjob ten_long female kids) (hp govjob ten_long female kids   ,probit) if grad_ms_F==1
