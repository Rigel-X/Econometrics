cd "F:\Salmagundi\1_study makes me happy\2_second degree_economics\5_Econometrics\Homework" 

use  EduIncome.dta, clear 

// is there any duplicates? 
duplicates report
duplicates drop

// codebook: check each variable's distribution
codebook
sum gender, detail
sum marriage, detail

// Generate new variable female
gen female = 0
replace female = 1 if gender == 1
sum female if female == 1
sum female

// Estimate empjob_twage = β0 + β1schooling_yr + β2female + u
reg empjob_twage schooling_yr female
predict yhat
predict uhat, residual
sum empjob_twage
sum yhat
sum uhat

// Estimate salary = \beta_0 + \beta_1 roe + u
reg salary roe
predict yhat
predict uhat, residual

//// Use option "detail" (or d) to see more details
sum salary pcsalary sales roe pcroe ros, d