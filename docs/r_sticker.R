#HPBBM logo
#Step 1: load packages
library(ggseqlogo)
library(ggplot2)
library(hexSticker)
library(ggpubr)
library(showtext)
#Step 2: generate the data as in Lesson R8
Counts <- matrix(c(2, 38, 0, 0, 0, 0, 10, 8, 4, 7, 21, 9, 9,
                   11, 9, 23, 4, 15, 10, 0, 46, 0, 0, 0, 32, 17, 10, 15, 11,
                   18, 9, 16, 23, 11, 20, 8, 10, 8, 0, 46, 0, 46, 2, 17, 21,
                   13, 14, 15, 27, 8, 13, 8, 16, 22, 24, 0, 0, 0, 46, 0, 2,
                   4, 11, 11, 0, 4, 1, 11, 1, 4, 6, 1), nrow = 4, byrow = T,
                 dimnames = list(Nucleotide = c("A", "C", "G", "T"), Pos = 1:18))
counts <- data.frame(Counts)
names(counts) <- 1:18
counts <- cbind(stack(counts), c("A", "C", "G", "T"))
colnames(counts) <- c("values", "pos", "nucleotide")
p <- ggseqlogo(Counts)
#Step 3: custom the plot for the logo
#first we remove scales and lines
p <- p + theme_void() + theme_transparent()
#then we add the UAM logo as background
img <- png::readPNG("data/UAM.png")
p <- p + annotation_custom(grid::rasterGrob(img, width = unit(0.5, "npc"), height = unit(0.5, "npc"), hjust=0))

## Step 4: render the logo 
#For help check out https://github.com/GuangchuangYu/hexSticker 
#Loading Google fonts (http://www.google.com/fonts)
font_add_google("Gochi Hand", "gochi")
## Automatically use showtext to render text for future devices
showtext_auto()

## export the final sticker
sticker(p, package="HPBBM2023", p_size=27, s_x=0.95, s_y=.85, s_width=1.6, s_height=1.1, h_fill="#bde2ff", h_color="#17489c",p_color="#17489c",
        p_family = "gochi", filename="HPBBM2023.png", url="bit.ly/HPBBM2023",u_size = 8,u_color="#17489c",spotlight = TRUE,l_x = 0.5,l_y=0.75)