library(DistributionUtils)
context("Check the main binomial functions")

test_that("check that functions give correct reults with valid inputs", {
  expect_equal(bin_choose(4, 3), 4)
  expect_equal(bin_probability(3, 4, 0.25), 0.046875)
})

test_that("check the class of output of functions ", {
  expect_type(bin_probability(3,4,0.5), 'double')
  expect_type(bin_choose(4,3), 'double')
  expect_s3_class(bin_distribution(4,0.5), c("bindis", "data.frame"))
  expect_s3_class(bin_cumulative(4,0.5), c("bincum", "data.frame"))
})

#third test for bin_choose
test_that("check if function bin_choose fails when k>n", {
  expect_error(bin_choose(3,4))
})

#additional tests for bin_probability
test_that("check if function bin_probability fails when number of trials is negative", {
  expect_error(bin_probability(2, -1, 5))
})

test_that("check if function bin_probability fails when number of successes is not an integer", {
  expect_error(bin_probability(0.5, 1, 5))
})

#additional tests for bin_cumulative
test_that("check if function bin_cumulative fails when number of trials is not an integer", {
  expect_error(bin_cumulative(1.5, 0.5))
})

test_that("check if function bin_cumulative fails when number probability is greater than 1", {
  expect_error(bin_cumulative(1, 5))
})

##additional tests for bin_distribution
test_that("check if function bin_distribution fails when trials is not integer", {
  expect_error(bin_distribution(1.5, 0.5))
})

test_that("check if function bin_distribution fails when probability is greater than 1", {
  expect_error(bin_distribution(1, 5))
})
