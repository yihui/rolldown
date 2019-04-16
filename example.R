library(plotly)
library(rolldown)

p1 <- ggplot(diamonds, aes(x = log(price), color = clarity)) +
  geom_freqpoly(stat = "density") +
  facet_wrap(~cut)
gg1 <- ggplotly(p1)

m <- lm(log(price) ~ log(carat), data = diamonds)
diamonds <- modelr::add_residuals(diamonds, m)
p <- ggplot(diamonds, aes(x = clarity, y = resid, color = clarity)) +
  ggforce::geom_sina(alpha = 0.1) +
  stat_summary(fun.data = "mean_cl_boot", color = "black") +
  facet_wrap(~cut)
gg2 <- toWebGL(ggplotly(p))

rolldown() %>%
  add_step("01-side.Rmd", gg1) %>%
  add_step("02-side.Rmd", gg2)
