library(dplyr)
library(purrr)
library(ggplot2)
library(withr)

tate <- function(x){
  chartr("ー", "丨", x) %>%  # 長音符の処理
    strsplit(split="", .) %>% 
    sapply(paste, collapse="\n")
}

with_seed(2718,
          10 %>% 
            rerun(data.frame(x = rbinom(n = 10000, 
                                        size = 1, 
                                        prob = 0.5))) %>%
            map(mutate, cumsum = cumsum(x)) %>% 
            map(mutate, n = row_number()) %>% 
            map_dfr(mutate, prob = cumsum / n, 
                    .id = "number") %>% 
            mutate(number = number %>% 
                     as.numeric %>%
                     as.factor)) %>%
  ggplot() + 
  aes(n, prob, colour = number) +
  geom_path(show.legend = FALSE) +
  ylab(tate("表が出る確率")) +
  xlab("サンプルサイズ") +
  theme_bw(base_size = 20,
           base_family = "IPAexGothic") +
  theme(axis.title.y = element_text(angle = 0,
                                    vjust= 0.5))