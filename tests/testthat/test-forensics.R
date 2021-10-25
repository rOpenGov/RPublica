test_that("Check geos", {
  skip_if_offline()
  skip_on_cran()
  g <- geos()
  expect_type(g, "list")

  expect_type(geos("48029"), "list")
})

test_that("Check systems", {
  skip_if_offline()
  skip_on_cran()

  allsys <- systems()
  expect_type(allsys, "list")

  g <- systems(39)
  expect_type(g, "list")
})
