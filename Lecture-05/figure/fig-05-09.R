library(ggplot2)
par <- data.frame(df = 1:9)
ggplot(data = NULL) + 
  aes(x = c(0, 15)) +
  mapply(
    function(df, co){
      stat_function(fun=dchisq,
                    args=list(df = df),
                    aes_q(color=co))
    },
    par$df, 
    sprintf("df=%.0f", par$df %>% 
              as.factor)) +
  xlab("") +
  ylab("")