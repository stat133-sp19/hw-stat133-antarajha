library(DistributionUtils)
context("Check arguments of the private checker functions")

test_that("check_prob works with valid values", {

  expect_true(check_prob(0.5))
  expect_true(check_prob(0))
  expect_true(check_prob(1))
  expect_true(check_prob(0.1))
  expect_true(check_prob(1/3))
  expect_true(check_prob(5/6))
})


test_that("check_prob fails with invalid lengths", {
  expect_error(check_prob(1:5))
})


test_that("check_prob fails with invalid numbers (negative, NA)", {
  expect_error(check_prob(-0.5))
  expect_error(check_prob(NA))
})

test_that("check_trials works with valid input (whole number, ranges)", {
  expect_true(check_trials(0))
  expect_true(check_trials(1))
  expect_true(check_trials(1:5))
})

test_that("check_trials fails with negative numbers", {
  expect_error(check_trials(-5))

})

test_that("check_trials fails with non whole numbers", {
  expect_error(check_trials(0.5))
})

test_that("check_success works with valid input", {
  expect_true(check_success(3, 4))
  expect_true(check_success(50, 400))
})

test_that("check_success fails when number of successes > number of trials",{
  expect_error(check_success(4, 3))
})

test_that("check_success fails when number of successes is negative",{
  expect_error(check_success(-4, 3))
})

test_that("check_success fails when number of successes is not an integer",{
  expect_error(check_success(4.5, 3))
})

test_that("checking functions give result of length one", {
  expect_length(check_prob(0.5), 1)
  expect_length(check_success(3,4), 1)
  expect_length(check_trials(2), 1)
})




