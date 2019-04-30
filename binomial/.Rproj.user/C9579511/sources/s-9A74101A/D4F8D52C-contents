library(DistributionUtils)
context("Check the main summary measure functions")

test_that("functions returns correct output", {
  expect_equal(aux_mean(3, 0.5), 1.5)
  expect_equal(aux_variance(3, 0.5), 0.75)
  expect_equal(aux_mode(3, 0.5), 2)
  expect_equal(aux_skewness(3, 0.5), 0)
  expect_equal(aux_kurtosis(1, 0.5), -2)
})

test_that("functions return correct output type", {
  expect_type(aux_mean(2, 0.5), 'double')
  expect_type(aux_variance(2, 0.5), 'double')
  expect_type(aux_mode(2, 0.5), 'integer')
  expect_type(aux_skewness(2, 0.5), 'double')
  expect_type(aux_kurtosis(2, 0.5), 'double')
})

test_that("aux_mean returns output of correct length", {
  expect_length(aux_mean(2,0.5), 1)
  expect_length(aux_variance(2,0.5), 1)
  expect_length(aux_mode(2,0.5), 1)
  expect_length(aux_skewness(2,0.5), 1)
  expect_length(aux_kurtosis(2,0.5), 1)
})

