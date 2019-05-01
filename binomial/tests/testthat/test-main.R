

setwd("~/Desktop/binomial")
source("R/density_functions.R")
source("R/binvar.R")

context("Tests for main functions")

test_that("bin_choose calculates correct combinations", {
  expect_equal(bin_choose(5, 2), 10)
  expect_error(bin_choose(2, 9))
  expect_error(bin_choose(-4, 3))
})

test_that("bin_probability returns correct probability", {
  expect_true((bin_probability(5, 10, 0.5) - 0.2460938) < 0.01)
  expect_length(bin_probability(5:10, 10, 0.5), 6)
  expect_error(bin_probability(5, 10, 3))
  expect_error(bin_probability(11, 10, .5))
  expect_error(bin_probability(5, -3, .5))
})

test_that("bin_distribution returns dataframe with correct probability", {
  expect_that(bin_distribution(10, .5), is_a(c("bindis", "data.frame")))
  expect_true((bin_distribution(10, .5)[1, 1] - 0.0009765625) < 0.01)
  expect_error(bin_distribution(-3, 5))
})

test_that("bin_cumulative returns list with correct probabilities", {
  expect_that(bin_cumulative(10, .5), is_a(c("bincum", "data.frame")))
  expect_equal(round(bin_cumulative(10, .5)[10, 3]), 1)
  expect_error(bin_cumulative(-3, 5))
})



