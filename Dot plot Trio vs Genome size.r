library(ggplot2)
library(tidyverse)
library(readxl)
library(scales)

df <- read_excel("Desktop/test.xlsx")
                                                                                     
tidydf <- df

ggplot(tidydf, aes(Genome_size, `Trio_number`, color = Group)) +
  geom_point() + geom_line(aes(group = Trio_number), color = 'black') + scale_y_continuous(breaks = seq(0, 20, by = 1)) + scale_x_continuous(limits = c(1000,7000), breaks = seq(1000,7000, by = 1000)) +
  ylab("Trio number") + xlab("Genome size (kb)") + theme_dotplot +  theme(legend.position = "bottom") + scale_color_brewer(palette = "Accent") + theme(legend.title=element_blank()) + guides(colour = guide_legend(override.aes = list(size=4))) +theme(legend.key=element_rect(fill='snow2')) +
  theme(plot.background = element_rect(fill = 'snow2')) + theme(legend.title = element_text(size=10)) +  theme(text=element_text(size=12,  family="Gujarati Sangam MN")) + theme(axis.title.x = element_text(vjust = 0, size = 12), axis.title.y = element_text(vjust = 2, size = 12)) + theme(axis.text = element_text(color = "black", size = 9))

     
