test_that("Test np_search", {
  skip_on_cran()
  skip_if_offline()

  np_res <- np_search("propublica")

  expect_type(np_res, "list")

  expect_error(np_search("ffggcc"))

  expect_silent(np_search("propublica"))
  expect_message(np_search("propublica", verbose = TRUE))
})


test_that("Test np_search", {
  skip_on_cran()
  skip_if_offline()

  np_res <- np_org(142007220)

  expect_type(np_res, "list")

  expect_error(np_org("ffggcc"))

  expect_silent(np_org(142007220))
  expect_message(np_org(142007220, verbose = TRUE))
})
