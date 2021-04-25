library(ggplot2)
library(tidyverse)
library(readxl)
library(scales)
library(extrafont)

df <- read_excel("Desktop/distribution plots.xlsx")

#residuals
p <- ggplot(df, aes(x=`Sfg-spg_residuals`)) + geom_density(alpha=.3, fill="#1B9E77") + ylab("Density") + xlab("Residuals") + 
scale_y_continuous(limits = c(0, 0.20)) + scale_x_continuous(limits = c(-5, 7)) + theme( 
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
p

#gene number
p <- ggplot(df, aes(x=`Sfg-spg_gene`)) + geom_density(alpha=.3, fill="#1B9E77") + ylab("Density") + xlab("Gene number") + 
scale_x_continuous(limits = c(-2000, 10000, by = 1000)) + scale_y_continuous(limits = c(0, 0.00025)) + theme( 
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
 p

#genome size
