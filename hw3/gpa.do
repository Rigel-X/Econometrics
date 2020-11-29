// Code: HW3, gpa
cd "F:\Salmagundi\1_study makes me happy\2_second degree_economics\5_Econometrics\Homework\hw3" //put your folder path here
use gpa.dta, clear

* Estimate original model, get residuals
reg colGPA hsGPA ACT skipped PC
predict uhat, residual

* Residual plot
rvfplot, yline(0)

* BP test
estat hettest

* Estimate weights
g u2 = uhat ^ 2
g colGPA2 = colGPA ^ 2
reg u2 colGPA colGPA2
predict hhat

* Verify weights are positive
count if hhat <= 0 //you should get zero

* Reestimate the model using WLS
reg colGPA hsGPA ACT skipped PC [weight = 1/hhat]

* Report WLS with heteroskedasticity-robust standard errors
reg colGPA hsGPA ACT skipped PC [weight = 1/hhat], vce(robust)

