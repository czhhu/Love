library(ggplot2)
library(dplyr)
#install.packages("showtext")
library(showtext)
showtext_auto(enable = TRUE)
font_add("simsun", regular = "C:/Windows/Fonts/simsun.ttc")
# 生成心形的数据
heart_data <- data.frame(
  t = seq(0, 2 * pi, by = 0.01)
) %>%
  mutate(
    x = 16 * sin(t)^3,
    y = 13 * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t)
  )

# 创建心形图并添加浪漫的文字
ggplot(heart_data, aes(x = x, y = y)) +
  geom_polygon(fill = "red", color = "darkred") +
  annotate("text", x = 0, y = 0, label = "I Love You", size = 8, color = "white", fontface = "bold") +
  annotate("text", x = 0, y = -2, label = "霞宝宝，我特别特别特别爱你", size = 6, color = "white", fontface = "italic") +
  theme_void() +
  theme(
    plot.background = element_rect(fill = "pink"),
    panel.background = element_rect(fill = "pink")
  ) + ggtitle("")

ggsave("romantic_confession.png", width = 8, height = 8)
