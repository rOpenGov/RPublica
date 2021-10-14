test_that("Check geos", {
  skip_if_offline()
  skip_on_cran()
  g <- geos()
  expect_type(g, "list")

  expect_type(geos("48029"), "list")
})
