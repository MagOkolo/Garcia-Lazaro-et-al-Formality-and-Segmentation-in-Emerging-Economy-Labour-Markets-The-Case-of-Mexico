
clear
use mexico_results_wage_data

tab IDX_2
tab informal ed_has_degree_voc , cell

/* calculates share s in eacxh segment */
tab IDX_2

gen hp=0
replace hp=1 if IDX_2==2


/* generates Table 1  */
tabstat informal ed_has_secondary ed_has_highschool ed_has_degree_voc 
tabstat occ_high occ_medb occ_lowb govjob ten_long ten_short female kids workers_25_39 workers_40_54 workers_55_65plus  North CentreNorth CentreX South
//
// Informality
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & informal==0
replace sig_P_B=1 if hp==0 & informal==0
replace Nsig_P_A=1 if hp==1 & informal==1
replace Nsig_P_B=1 if hp==0 & informal==1

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B
//
// Graduates
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & ed_has_degree_voc==1
replace sig_P_B=1 if hp==0 & ed_has_degree_voc==1
replace Nsig_P_A=1 if hp==1 & ed_has_degree_voc==0
replace Nsig_P_B=1 if hp==0 & ed_has_degree_voc==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B
//
// Educated to Age 18
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & ed_has_highschool==1
replace sig_P_B=1 if hp==0 & ed_has_highschool==1
replace Nsig_P_A=1 if hp==1 & ed_has_highschool==0
replace Nsig_P_B=1 if hp==0 & ed_has_highschool==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B
//
// Educated to Age 16
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & ed_has_secondary==1
replace sig_P_B=1 if hp==0 & ed_has_secondary==1
replace Nsig_P_A=1 if hp==1 & ed_has_secondary==0
replace Nsig_P_B=1 if hp==0 & ed_has_secondary==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B
//
// Educated to Primary
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & ed_has_primary==1
replace sig_P_B=1 if hp==0 & ed_has_primary==1
replace Nsig_P_A=1 if hp==1 & ed_has_primary==0
replace Nsig_P_B=1 if hp==0 & ed_has_primary==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B
//
// High Skill 
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & occ_high==1
replace sig_P_B=1 if hp==0 & occ_high==1
replace Nsig_P_A=1 if hp==1 & occ_high==0
replace Nsig_P_B=1 if hp==0 & occ_high==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B
//
// Female
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & female==1
replace sig_P_B=1 if hp==0 & female==1
replace Nsig_P_A=1 if hp==1 & female==0
replace Nsig_P_B=1 if hp==0 & female==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B
//
// Children
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & kids==1
replace sig_P_B=1 if hp==0 & kids==1
replace Nsig_P_A=1 if hp==1 & kids==0
replace Nsig_P_B=1 if hp==0 & kids==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B

//
// Long Tenure
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & ten_long==1
replace sig_P_B=1 if hp==0 & ten_long==1
replace Nsig_P_A=1 if hp==1 & ten_long==0
replace Nsig_P_B=1 if hp==0 & ten_long==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B

//
// Public Sector
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & govjob==1
replace sig_P_B=1 if hp==0 & govjob==1
replace Nsig_P_A=1 if hp==1 & govjob==0
replace Nsig_P_B=1 if hp==0 & govjob==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B

//
// AGe 25-39
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & workers_25_39==1
replace sig_P_B=1 if hp==0 & workers_25_39==1
replace Nsig_P_A=1 if hp==1 & workers_25_39==0
replace Nsig_P_B=1 if hp==0 & workers_25_39==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B

//
// Age 40-54
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & workers_40_54==1
replace sig_P_B=1 if hp==0 & workers_40_54==1
replace Nsig_P_A=1 if hp==1 & workers_40_54==0
replace Nsig_P_B=1 if hp==0 & workers_40_54==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B
//
// Age 55 plus25-39
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & workers_55_65plus==1
replace sig_P_B=1 if hp==0 & workers_55_65plus==1
replace Nsig_P_A=1 if hp==1 & workers_55_65plus==0
replace Nsig_P_B=1 if hp==0 & workers_55_65plus==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B

//
// North
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & North==1
replace sig_P_B=1 if hp==0 & North==1
replace Nsig_P_A=1 if hp==1 & North==0
replace Nsig_P_B=1 if hp==0 & North==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B
//
// Centre North
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & CentreNorth==1
replace sig_P_B=1 if hp==0 & CentreNorth==1
replace Nsig_P_A=1 if hp==1 & CentreNorth==0
replace Nsig_P_B=1 if hp==0 & CentreNorth==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B
//
// Centre X
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & CentreX==1
replace sig_P_B=1 if hp==0 & CentreX==1
replace Nsig_P_A=1 if hp==1 & CentreX==0
replace Nsig_P_B=1 if hp==0 & CentreX==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B
//
// South
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & South==1
replace sig_P_B=1 if hp==0 & South==1
replace Nsig_P_A=1 if hp==1 & South==0
replace Nsig_P_B=1 if hp==0 & South==0

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B

// Grad or High skill 
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & (ed_has_degree_voc==1|occ_high==1)
replace sig_P_B=1 if hp==0 & (ed_has_degree_voc==1|occ_high==1)
replace Nsig_P_A=1 if hp==1 & (ed_has_degree_voc==0&occ_high==0)
replace Nsig_P_B=1 if hp==0 & (ed_has_degree_voc==0&occ_high==0)

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B


// ED 18or High skill 
generate sig_P_A=0
generate sig_P_B=0
generate Nsig_P_A=0
generate Nsig_P_B=0

replace sig_P_A=1 if hp==1 & (ed_has_highschool==1|occ_high==1)
replace sig_P_B=1 if hp==0 & (ed_has_highschool==1|occ_high==1)
replace Nsig_P_A=1 if hp==1 & (ed_has_highschool==0&occ_high==0)
replace Nsig_P_B=1 if hp==0 & (ed_has_highschool==0&occ_high==0)

gen chck=sig_P_A+sig_P_B+Nsig_P_A+Nsig_P_B
gen seg=2*(sig_P_A+Nsig_P_B-0.5)
gen misclass=sig_P_B+Nsig_P_A
tabstat sig_P_A sig_P_B Nsig_P_A Nsig_P_B chck seg misclass

drop chck seg misclass sig_P_A sig_P_B Nsig_P_A Nsig_P_B





