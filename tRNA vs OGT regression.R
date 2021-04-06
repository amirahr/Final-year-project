library(ggplot2)
library(tidyverse)
library(readxl)
library(scales)
library(extrafont)
library(ggpmisc)

df <- read_excel("Desktop/gcvsogt_workable.xlsx")
df$y <- 2 + 3 * df$x + rnorm(100, sd = 40)
my.formula <- y ~ x
p <- ggplot(df, aes(OGT, tRNA_GC)) + geom_point() + geom_smooth(method=lm, se = FALSE, colour = '#7570B3', formula = my.formula) + stat_poly_eq(formula = my.formula, aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), parse = TRUE) + ylab("tRNA GC (%)") + xlab("Optimum Growth Temperature (°C)") + scale_x_continuous(breaks = seq(0, 100, by = 10)) + theme( 
  panel.background = element_rect(fill = "white", colour = "white",
                                  size = 2, linetype = "solid"),
  panel.grid.major = element_line(size = 0.25, linetype = 'solid',
                                  colour = "white"), 
  panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                  colour = "white"),
  plot.background = element_rect(fill = "grey96"),
  panel.border = element_rect(colour = "black", fill=NA, size=0.5),
  text = element_text(family="Helvetica", size=12)
)
