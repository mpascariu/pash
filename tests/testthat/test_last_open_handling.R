#####################################################################
# Test the handling of open last age groups in different situations #
#####################################################################

library(pash)

# Test Inputlx() ----------------------------------------------------------

test_that("handling of last_open works for Inputlx()", {
  expect_equal(Inputlx(x = prestons_lx$x, lx = prestons_lx$lx,
                       nax = "udd", last_open = TRUE)[["lt"]][["ex"]][1],
               72.95989, tolerance = 0.0001, scale = 1)
  expect_message(Inputlx(x = prestons_lx$x, lx = prestons_lx$lx,
                         nax = "udd", last_open = TRUE),
                 "nmx of open age group log-linearly extrapolated based on preceding two nmx")
  expect_equal(Inputlx(x = prestons_lx$x, lx = prestons_lx$lx,
                       nax = "cfm", last_open = TRUE)[["lt"]][["ex"]][1],
               72.82386, tolerance = 0.0001, scale = 1)
  expect_message(Inputlx(x = prestons_lx$x, lx = prestons_lx$lx,
                         nax = "cfm", last_open = TRUE),
                 "nmx of open age group log-linearly extrapolated based on preceding two nmx")
  expect_equal(Inputlx(x = prestons_lx$x, lx = prestons_lx$lx,
                       nax = 2.5, last_open = TRUE)[["lt"]][["ex"]][1],
               72.28387, tolerance = 0.0001, scale = 1)
  expect_equal(Inputlx(x = prestons_lx$x, lx = prestons_lx$lx,
                       nax = c(rep(2.5, 18), 5), last_open = TRUE)[["lt"]][["ex"]][1],
               72.81222, tolerance = 0.0001, scale = 1)
})

# Test Inputnmx() ---------------------------------------------------------

swe <- subset(sweden5x5, sex == "female" & period == "1940-1944")[c("x", "nmx")]

test_that("handling of last_open works for Inputlx()", {
  expect_equal(Inputnmx(x = swe$x, nmx = swe$nmx,
                       nax = "udd", last_open = TRUE)[["lt"]][["ex"]][1],
               69.30855, tolerance = 0.0001, scale = 1)
  expect_equal(Inputnmx(x = swe$x, nmx = swe$nmx,
                        nax = "cfm", last_open = TRUE)[["lt"]][["ex"]][1],
               69.12739, tolerance = 0.0001, scale = 1)
  expect_equal(Inputnmx(x = swe$x, nmx = swe$nmx,
                        nax = 2.5, last_open = TRUE)[["lt"]][["ex"]][1],
               69.12228, tolerance = 0.0001, scale = 1)
  expect_equal(Inputnmx(x = swe$x, nmx = swe$nmx,
                        nax = c(rep(2.5, 23), 4), last_open = TRUE)[["lt"]][["ex"]][1],
               69.12228, tolerance = 0.0001, scale = 1)
})

# Test Inputnqx() ---------------------------------------------------------

swe <- subset(sweden5x5, sex == "male" & period == "1945-1949")[c("x", "nqx")]

test_that("handling of last_open works for Inputnqx()", {
  expect_equal(Inputnqx(x = swe$x, nqx = swe$nqx,
                       nax = "udd", last_open = TRUE)[["lt"]][["ex"]][1],
               68.53095, tolerance = 0.0001, scale = 1)
  expect_message(Inputnqx(x = swe$x, nqx = swe$nqx,
                         nax = "udd", last_open = TRUE),
                 "nmx of open age group log-linearly extrapolated based on preceding two nmx")
  expect_equal(Inputnqx(x = swe$x, nqx = swe$nqx,
                       nax = "cfm", last_open = TRUE)[["lt"]][["ex"]][1],
               68.34164, tolerance = 0.0001, scale = 1)
  expect_message(Inputnqx(x = swe$x, nqx = swe$nqx,
                         nax = "cfm", last_open = TRUE),
                 "nmx of open age group log-linearly extrapolated based on preceding two nmx")
  expect_equal(Inputnqx(x = swe$x, nqx = swe$nqx,
                        nax = 2.5, last_open = TRUE)[["lt"]][["ex"]][1],
               68.5916, tolerance = 0.0001, scale = 1)
  expect_equal(Inputnqx(x = swe$x, nqx = swe$nqx,
                        nax = c(rep(2.5, 23), 5), last_open = TRUE)[["lt"]][["ex"]][1],
               68.5916, tolerance = 0.0001, scale = 1)
})
