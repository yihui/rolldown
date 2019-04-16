library(plotly)
library(rolldown)

p1 <- ggplot(diamonds, aes(x = log(price), color = clarity)) +
  geom_freqpoly(stat = "density") +
  facet_wrap(~cut)

gg1 <- ggplotly(p1, width = 1200, height = 600) %>%
  config(displayModeBar = FALSE)

m <- lm(log(price) ~ log(carat), data = diamonds)
diamonds <- modelr::add_residuals(diamonds, m)
p <- ggplot(diamonds, aes(x = clarity, y = resid, color = clarity)) +
  ggforce::geom_sina(alpha = 0.1) +
  stat_summary(fun.data = "mean_cl_boot", color = "black") +
  facet_wrap(~cut)

gg2 <- ggplotly(p, width = 1200, height = 600) %>%
  toWebGL() %>%
  config(displayModeBar = FALSE)

map <- leaflet(height = 600) %>%
  addTiles() %>%
  addMarkers(-93.7418395, 41.6745487, popup = "Thanks John Deere!") %>%
  setView(-93.74, 41.675, 15)

rolldown() %>%
  add_step("01-side.Rmd", gg1) %>%
  add_step("02-side.Rmd", gg2) %>%
  add_step("03-side.Rmd", map)
