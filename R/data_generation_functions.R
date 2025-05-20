#' Generate Synthetic Employment Data for Survival Analysis
#'
#' This function generates synthetic employment data for survival analysis,
#' including survival times, censoring, and event indicators.
#'
#' @param n Number of observations to generate. Default is 100.
#' @param seed Random seed for reproducibility. Default is 123.
#' @return A data frame with columns: Age, JobType, Gender, Time, Event.
#' @examples
#' data <- genEmploymentData(n = 100)
#' head(data)
#' @export

genEmploymentData <- function(n = 100, seed = 123) {
  # Set seed for reproducibility
  set.seed(seed)
  
  # Generate synthetic data
  age <- sample(20:60, n, replace = TRUE)  # Age of individuals
  job_type <- sample(c("Scientist","Engineer", "Teacher", "Doctor", "Manager"),n, replace = TRUE)
  gender <- sample(c("Male", "Female"), n, replace = TRUE)
  
  # Generate survival times (e.g., time to job change or termination)
  baseline <- 0.02
  survival <- rexp(n, rate = baseline * (1 + 0.01 * age))
  
  # Introduce censoring
  censor <- runif(n, min = 1, max = 15)  # Censoring times
  event <- as.numeric(survival <= censor)  # Event indicator (1 = event, 0 = censored)
  observed <- pmin(survival, censor)
  
  # Create a data frame
  data <- data.frame(
    Age = age,
    JobType = job_type,
    Gender = gender,
    Time = observed,
    Event = event
  )
  
  return(data)
}

data <- genEmploymentData(n = 100)
