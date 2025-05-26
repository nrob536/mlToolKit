#' Preprocess Synthetic Employment Data for Survival Analysis
#'
#' This function preprocesses the synthetic employment data, checking for missing values
#' and ensuring the data is ready for survival analysis.
#'
#' @param data A data frame with columns: Age, JobType, Gender, Time, Event.
#' @return A cleaned and validated data frame.
#' @examples
#' data <- generate_employment_data()
#' preprocessed_data <- preprocess_data(data)
#' @export
proSurvivalData <- function(data) {
  # Check for missing values
  if (any(is.na(data))) {
    stop("Data contains missing values. Please clean the data.")
  }
  
  # Ensure required columns are present
  required_cols <- c("Age", "JobType", "Gender", "Time", "Event")
  if (!all(required_cols %in% colnames(data))) {
    stop("Data is missing required columns.")
  }
  
  # Ensure Event is binary
  if (!all(data$Event %in% c(0, 1))) {
    stop("Event column must contain only 0 (censored) or 1 (event).")
  }
  
  return(data)
}
