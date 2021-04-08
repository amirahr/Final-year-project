library(ggplot2)
library(tidyverse)
library(readxl)
library(scales)
library(extrafont)
library(ggpmisc)

df <- read_excel("Desktop/gcvsgc3_workable.xlsx")
df$y <- 2 + 3 * df$x + rnorm(100, sd = 40)
my.formula <- y ~ x

p <- ggplot(df, aes(CDS_GC3, tRNA_GC)) + geom_point() + geom_smooth(method=lm, se = FALSE, colour = '#7570B3', formula = my.formula) + stat_poly_eq(formula = my.formula, aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), parse = TRUE) + ylab("tRNA GC (%)") + xlab("GC3 (%)") + theme( 
  panel.background = element_rect(fill = "white", colour = "white",
                                  size = 2, linetype = "solid"),
  panel.grid.major = element_line(size = 0.25, linetype = 'solid',
                                  colour = "white"), 
  panel.grid.minor = element_line(size = 0.25, linetype = 'solid',
                                  colour = "white"),
  plot.background = element_rect(fill = "grey96"),
  panel.border = element_rect(colour = "black", fill=NA, size=0.5),
  text = element_text(family="Helvetica", size=12)
p
  
m1 <- lm(tRNA_GC ~ CDS_GC3, data = df)
resid(m1)
fresid <- data.frame(resid = resid(m1))

df2 <- read_excel("Desktop/residuals_workable.xlsx")
df2$y <- 2 + 3 * df2$x + rnorm(100, sd = 40)
my.formula <- y ~ x

p2 <- ggplot(df2, aes(OGT, Residuals) + geom_point() + scale_x_continuous(breaks = seq(0, 100, by = 10)) + geom_smooth(method=lm, se = FALSE, colour = '#7570B3', formula = my.formula) + stat_poly_eq(formula = my.formula, aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), parse = TRUE) + ylab("Residuals") + xlab("Optimum Growth Temperature (ºC)") + theme( 
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
p2
  
