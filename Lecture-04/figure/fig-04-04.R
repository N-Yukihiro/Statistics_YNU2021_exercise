library(dplyr)
library(ggplot2)

tate <- function(x){
  chartr("ー", "丨", x) %>%  # 長音符の処理
    strsplit(split="", .) %>% 
    sapply(paste, collapse="\n")
}

t.p <- c(.49, .55, .6)
seq(from = 1, to = 301, by = 2) %>% 
  rep(3) %>% 
  data.frame(n = .) %>% 
  mutate(t.p = rep(t.p,
                   each = length(n) / length(t.p)),
         probs = 1 - pbinom(q = floor(n/2),
                            size = n, 
                            prob = t.p)
  ) %>%
  mutate_at(vars(t.p), as.character) %>%
  ggplot() +
  aes(x = n,
      y = probs,
      colour = t.p) +
  geom_line() +
  geom_hline(yintercept = .8,
             colour = "black") +
  geom_hline(yintercept = .5,
             linetype = "dashed",
             colour = "black") +
  guides(colour = guide_legend(reverse = TRUE)) +
  ylab(tate("多数決の結果が正しい確率")) +
  xlab("多数決に参加する人数") +
  labs(color="個人の選択が\n正しい確率") +
  theme_bw(base_size = 20,
           base_family = "IPAexGothic") +
  theme(axis.title.y = element_text(angle = 0,
                                    vjust= 0.5))