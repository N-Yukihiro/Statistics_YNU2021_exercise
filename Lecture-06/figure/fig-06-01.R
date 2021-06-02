library(ggplot2)
ggplot(data = NULL) +
  stat_function(aes(xmin = -4,
                    xmax = 4),
                fun = dt,
                args = list(df = 20)) +
  geom_ribbon(
    data = data.frame(
      X = x<-seq(-4, qt(p = 0.025, df = 20), len=1000),
      Y = dt(x, df = 20)),
    aes(x = X, y = Y, ymin = 0, ymax = Y),
    fill = "red") +
  geom_ribbon(
    data = data.frame(
      X = x<-seq(qt(p = 0.975, df = 20, lower.tail = TRUE), 4, len=1000),
      Y = dt(x, df = 20)),
    aes(x = X, y = Y, ymin = 0, ymax = Y),
    fill = "red") +
  xlab("") +
  ylab("") +
  theme_bw()
