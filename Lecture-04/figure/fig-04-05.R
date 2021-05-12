library(ggplot2)
par <- data.frame(lambda = 1:9)
ggplot(data = NULL) + 
  aes(xmin = 0, xmax = 20) +
  mapply(
    function(lambda, co){
      stat_function(fun=dpois, n = 21,
                    args=list(lambda = lambda),
                    aes_q(color=co))
    },
    par$lambda, 
    sprintf("lambda=%.0f", par$lambda)) +
  xlab("") +
  ylab("")