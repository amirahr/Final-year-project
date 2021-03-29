library(ggplot2)
library(tidyverse)
library(readxl)
library(scales)

df <- read_excel("Desktop/Q1 genome size output.xlsx")

tidydf <- df

ggplot(tidydf, aes(OGT, `Trio_number`, color = Group)) +
  geom_point() + scale_y_continuous(breaks = seq(0, 20, by = 1)) + scale_x_continuous(limits = c(25, 50)) +
  ylab("Trio number") + xlab("Optimal Growth Temperature") + theme_dotplot +  theme(legend.position = "bottom") + scale_color_brewer(palette = "Set2") + theme(legend.title=element_blank()) + guides(colour = guide_legend(override.aes = list(size=4))) +theme(legend.key=element_rect(fill='grey96')) +
  theme(plot.background = element_rect(fill = 'grey96')) + theme(legend.title = element_text(size=10)) +  theme(text=element_text(size=12,  family="Gujarati Sangam MN")) + theme(axis.title.x = element_text(vjust = 0, size = 12), axis.title.y = element_text(vjust = 2, size = 12)) + theme(axis.text = element_text(color = "black", size = 9))

