
setwd("~/Desktop/binomial")
source("R/auxiliary.R")

context("Tests for summary measures")

test_that("aux_mean returns mean", {
  expect_equal(aux_mean(10, .5), 5)
  expect_equal(length(aux_mean(10, .6)), 1)
  expect_error(aux_mean(190, "L"))
})

test_that("aux_variance returns variance", {
  expect_equal(aux_variance(10, .4), 2.4)
  expect_equal(length(aux_variance(10, .6)), 1)
  expect_error(aux_variance(190, "L"))
})

test_that("aux_variance returns variance", {
  expect_equal(aux_variance(10, .4), 2.4)
  expect_equal(length(aux_variance(10, .6)), 1)
  expect_error(aux_variance(190, "L"))
})

test_that("aux_mode returns correct mode", {
  expect_equal(aux_mode(10, .5), 5)
  expect_equal(length(aux_mode(15, .5)), 2)
  expect_equal(length(aux_mode(14, .5)), 1)
  expect_equal(aux_mode(15, .5), c(8, 7))
  expect_error(aux_mode(190, "L"))
})

test_that("aux_skewness returns correct skewness", {
  expect_true((aux_skewness(10, .3) - .2760262) < 0.01)
  expect_equal(length(aux_skewness(10, .3)), 1)
  expect_error(aux_skewness(190, "L"))
})

test_that("aux_kurtosis returns correct kurtosis", {
  expect_true((aux_kurtosis(10, .3) + 0.1238095) < 0.01)
  expect_equal(length(aux_kurtosis(10, .6)), 1)
  expect_error(aux_kurtosis(190, "L"))
})



