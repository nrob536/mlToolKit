test_that("Kaplan-Meier survival analysis runs correctly", {
  data <- proSurvivalData(genEmploymentData(n = 50))
  km_fit <- runKaplanMeier(data)
  
  expect_true(inherits(km_fit, "survfit"))
})

test_that("Cox proportional hazards model runs correctly", {
  data <- proSurvivalData(genEmploymentData(n = 50))
  cox_fit <- runCoxModel(data, covariates = c("Age", "Gender"))
  
  expect_true(inherits(cox_fit, "coxph"))
})