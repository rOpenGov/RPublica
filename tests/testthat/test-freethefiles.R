test_that("Check market", {
  skip_if_offline()
  skip_on_cran()
  g <- market()
  expect_type(g, "list")

  expect_type(market("new-york"), "list")
})


test_that("Check stations", {
  skip_if_offline()
  skip_on_cran()
  g <- station("WEWS-TV")
  expect_type(g, "list")
})


test_that("Check committee", {
  skip_if_offline()
  skip_on_cran()
  g <- committee()
  expect_type(g, "list")

  expect_type(committee("warren-for-senate-2012"), "list")
})

test_that("Check filing", {
  skip_if_offline()
  skip_on_cran()
  g <- filing(51212)
  expect_type(g, "list")
})
