library(ggplot2)
par <- expand.grid(
  mean = c(-2, 0, 2),
  sd = c(.5, 1, 3))
ggplot(data = NULL) +
  aes(xmin = -6, xmax = 6) +
  mapply(
    function(mean, sd, co){
      stat_function(
        fun = pnorm,
        args=list(mean = mean,
                  sd = sd),
        aes_q(color=co))
    },
    par$mean, 
    par$sd, 
    sprintf("mean=%.0f sd=%.1f", 
            par$mean, par$sd)
  ) +
  xlab("") +
  ylab("")