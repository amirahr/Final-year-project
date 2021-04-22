library(ggplot2)
library(tidyverse)
library(readxl)
library(scales)
library(extrafont)

df <- read_excel("Desktop/distribution plots.xlsx")

p <- ggplot(df, aes(x=`Sfg-spg_residuals`)) + geom_density(alpha=.3, fill="#1B9E77") + ylab("Density") + xlab("Residuals") + theme( 
  panel.background = element_rect(fill = "white", colour = "white",
                                  size = 2, linetype = "solid"),
  panel.grid.major = element_line(size = 0.25, linetype = 'solid',
                                  colour = "grey84"), 
  panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                  colour = "grey84"),
  plot.background = element_rect(fill = "grey96"),
  panel.border = element_rect(colour = "black", fill=NA, size=0.5),
  text = element_text(family="Helvetica", size=12)
)
