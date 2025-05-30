% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_processing_functions.R
\name{proSurvivalData}
\alias{proSurvivalData}
\title{Preprocess Synthetic Employment Data for Survival Analysis}
\usage{
proSurvivalData(data)
}
\arguments{
\item{data}{A data frame with columns: Age, JobType, Gender, Time, Event.}
}
\value{
A cleaned and validated data frame.
}
\description{
This function preprocesses the synthetic employment data, checking for missing values
and ensuring the data is ready for survival analysis.
}
\examples{
data <- generate_employment_data()
preprocessed_data <- preprocess_data(data)
}
