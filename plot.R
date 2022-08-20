
library(tidyverse)

## Make some data

df <- tibble(name = "Sam",
             business = 2,
             product = 1,
             collaboration = 2,
             leadership = 2,
             strategy = 4,
             tactics = 1,
             users = 2,
             industry = 3)

df <- df %>% 
  pivot_longer(cols = business:industry, 
               names_to = "dimension", 
               values_to = "score")

theme(axis.text.x = element_text(size=25,colour = "#063672" ,
                                 angle = seq(-20,-340,length.out = 9),vjust = 100),
      axis.text.y = element_blank(),
      axis.ticks.y = element_blank(),
      axis.ticks.x = element_line(size = 2,colour = "black",linetype = 1),
      legend.position = "none",
      strip.background = element_rect(colour = "black", fill = "#063672"),
      strip.text.x = element_text(colour = "white", face = "plain",size = 45),
      panel.border = element_rect(colour = "black",size = 1,fill=NA),
      panel.spacing = unit(2, "lines"),
      plot.title = element_text(family = "URWGothic",size = 80),
      plot.subtitle = element_text(family = "URWGothic",size = 30),
      plot.caption = element_text(family = "URWGothic",size = 30),
      plot.margin = unit(c(1,1,1,1), "cm"),
      panel.grid = element_blank()
)

df %>% 
  mutate(dimension = factor(dimension,
                            levels = unique(dimension),
                            labels = str_to_title(unique(dimension)))) %>%
  ggplot(aes(x = dimension,
           y = score)) +
  geom_col(fill = "red",
           alpha = 1,
           width = 1) +
  geom_hline(yintercept = seq(0, 5, by = 1),
             color = "grey50", size = 0.8) +
  geom_vline(xintercept = seq(1.5, 7.5, by = 2),
             color = "grey50", size = 0.8) +
  coord_polar(clip = "off") +
  theme(panel.grid = element_blank(),
        panel.background = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title = element_blank()) +
  annotate("segment",
           x = 0.5, xend = 0.5,
           y = -1, yend = 6.5,
           color = "black",
           size = 1.5) +
  annotate("segment",
           x = 2.5, xend = 2.5,
           y = -1, yend = 6.5,
           color = "black",
           size = 1.5) +
  annotate("segment",
           x = 4.5, xend = 4.5,
           y = -1, yend = 6.5,
           color = "black",
           size = 1.5) +
  annotate("segment",
           x = 6.5, xend = 6.5,
           y = -1, yend = 6.5,
           color = "black",
           size = 1.5) +
  annotate("text", 
           x = .5,
           y = 0:5,
           label = c(0, 1, 2, 3, 4, 5),
           hjust = -1) +
  annotate("text", 
           x = 2.5,
           y = 0:5,
           label = c(0, 1, 2, 3, 4, 5),
           vjust = -0.5) +
  annotate("text",
           x = 7.5,
           y = 5,
           label = "Know your Market",
           hjust = 1.5,
           vjust = -8,
           fontface = 2) +
  annotate("text",
           x = 1.5,
           y = 5,
           label = "Know your Product",
           hjust = -0.4,
           vjust = -8,
           fontface = 2) +
  annotate("text",
           x = 3.5,
           y = 5,
           label = "Know your Self",
           hjust = -0.7,
           vjust = 10,
           fontface = 2) +
  annotate("text",
           x = 5.5,
           y = 5,
           label = "Know your Craft",
           hjust = 1.6,
           vjust = 10,
           fontface = 2)

  