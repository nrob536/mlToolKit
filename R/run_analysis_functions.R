#' Perform Kaplan-Meier Survival Analysis
#'
#' This function fits a Kaplan-Meier survival model to the data and returns the results.
#'
#' @param data A preprocessed data frame with columns: Time, Event.
#' @return A Kaplan-Meier survival object.
#' @examples
#' data <- preprocess_data(generate_employment_data())
#' km_result <- run_kaplan_meier(data)
#' @export
runKaplanMeier <- function(data) {
  library(survival)
  
  # Fit Kaplan-Meier survival model
  km_fit <- survfit(Surv(Time, Event) ~ 1, data = data)
  
  return(km_fit)
}

#' Perform Cox Proportional Hazards Regression
#'
#' This function fits a Cox proportional hazards model to the data.
#'
#' @param data A preprocessed data frame with columns: Time, Event, and covariates.
#' @return A Cox proportional hazards model object.
#' @examples
#' data <- preprocess_data(generate_employment_data())
#' cox_result <- run_cox_model(data, covariates = c("Age", "Gender"))
#' @export
runCoxModel <- function(data, covariates) {
  library(survival)
  
  # Construct formula for Cox model
  formula <- as.formula(paste("Surv(Time, Event) ~", paste(covariates, collapse = " + ")))
  
  # Fit Cox model
  cox_fit <- coxph(formula, data = data)
  
  return(cox_fit)
}
