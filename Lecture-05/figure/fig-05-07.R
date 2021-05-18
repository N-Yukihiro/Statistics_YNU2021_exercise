library(ggplot2)
par <- data.frame(df = 1:9)
ggplot(data = NULL) + 
  aes(x = c(-5, 5)) +
  mapply(
    function(df, co){
      stat_function(fun=dt,
                    args=list(df = df),
                    aes_q(color=co))
    },
    par$df, 
    sprintf("df=%.0f", par$df %>% 
              as.factor)) +
  stat_function(
    fun = dnorm, 
    linetype = "dashed") +
  xlab("") +
  ylab("")