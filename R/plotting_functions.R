#' Plot Kaplan-Meier Survival Curves
#'
#' @param km_fit A Kaplan-Meier survival object.
#' @param data The original data frame used to fit km_fit.
#' @export
plotKmCurve <- function(km_fit, data) {
  library(ggplot2)
  library(survminer)
  
  ggsurvplot(km_fit, data = data, conf.int = TRUE, risk.table = TRUE, 
             ggtheme = theme_minimal(),
             title = "Kaplan-Meier Survival Curve")
}


#' Plot Hazard Ratios from Cox Model
#'
#' This function plots the hazard ratios from a Cox proportional hazards model.
#'
#' @param cox_fit A Cox proportional hazards model object.
#' @examples
#' data <- preprocess_data(generate_employment_data())
#' cox_fit <- run_cox_model(data, covariates = c("Age", "Gender"))
#' plot_cox_hazard_ratios(cox_fit)
#' @export
plotCoxHazardRatios <- function(cox_fit) {
  library(broom)
  library(ggplot2)
  
  # Extract hazard ratios
  hr <- tidy(cox_fit, conf.int = TRUE)
  
  # Plot hazard ratios
  ggplot(hr, aes(x = term, y = estimate, ymin = conf.low, ymax = conf.high)) +
    geom_pointrange() +
    geom_hline(yintercept = 1, linetype = "dashed", color = "red") +
    coord_flip() +
    theme_minimal() +
    xlab("Covariates") +
    ylab("Hazard Ratio") +
    ggtitle("Hazard Ratios from Cox Model")
}
