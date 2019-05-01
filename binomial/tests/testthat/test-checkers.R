
setwd("~/Desktop/binomial")
source("R/checkers.R")

context("Tests for checkers")

test_that("check_probability raises appropriate errors", {
  expect_true(check_prob(.34))
  expect_length(check_prob(.24), 1)
  expect_error(check_prob(-4))
  expect_error(check_prob(4))
})

test_that("check_trials raises appropriate errors", {
  expect_true(check_trials(5))
  expect_length(check_trials(5), 1)
  expect_error(check_trials(-1))
  expect_error(check_trials(7.9))
})

test_that("check_success raises appropriate errors", {
  expect_true(check_success(2, 5))
  expect_error(check_success(-3, 5))
  expect_error(check_success(2.5, 5))
  expect_error(check_success(7, 5))
})



