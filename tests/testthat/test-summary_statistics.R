library(SummaryStatsPkg)
library(testthat)
library(palmerpenguins)
# Testing the summary_statistics function for different cases using the `penguins` dataset
test_that("summary_statistics correctly calculates the summary statistics for specified valid columns in penguins dataset", {
  result <- summary_statistics(penguins, columns = c("flipper_length_mm", "body_mass_g"))

  # Testing the mean and median calculations
  expect_equal(result["flipper_length_mm", "mean"], mean(penguins$flipper_length_mm, na.rm = TRUE))
  expect_equal(result["body_mass_g", "median"], median(penguins$body_mass_g, na.rm = TRUE))
})

test_that("summary_statistics is able to handle NA values correctly", {
  # Calculating the summary statistics with `na.rm = TRUE`
  result <- summary_statistics(penguins, columns = "flipper_length_mm", na.rm = TRUE)
  expect_equal(result["flipper_length_mm", "count"], sum(!is.na(penguins$flipper_length_mm)))

  # Testing the same with `na.rm = FALSE`
  result_na_false <- summary_statistics(penguins, columns = "flipper_length_mm", na.rm = FALSE)
  expect_true(is.na(result_na_false["flipper_length_mm", "mean"]))
})

test_that("summary_statistics shows an error for invalid inputs", {
  # Testing with non-existent column error
  expect_error(summary_statistics(penguins, columns = "nonexistent_column"),
               "One or more specified column/columns does not exist in the dataframe.")

  # Testing with non-numeric column error
  expect_error(summary_statistics(penguins, columns = "species"),
               "All specified columns must be numeric.")
})

