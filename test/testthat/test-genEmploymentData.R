testthat::test_that("genEmploymentData works correctly", {
  data <- genEmploymentData(n = 50, seed = 42)
  
  expect_equal(nrow(data), 50)  # Check number of rows
  expect_true(all(data$Time >= 0))  # Check non-negative times
  expect_true(all(data$Event %in% c(0, 1)))  # Check valid event indicators
})
