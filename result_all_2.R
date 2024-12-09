library(conflicted)
library(tidyverse)
library(plotly)
library(htmlwidgets)
conflict_prefer('filter', 'dplyr')

results_long <- read_csv("result_long.csv")

# 箱ひげ図の作成
plot <- plot_ly(results_long, y = ~time, color = ~operation, type = "box") %>%
        plotly::layout(title = "Distribution of Execution Time for Each Operation",
                      xaxis = list(title = "Operation"),
                      yaxis = list(title = "Execution Time (seconds)"),
                      showlegend = FALSE)
# プロットの表示
plot

# HTMLファイルを作成
saveWidget(widget = plot,
           file = "result_all.html",
           selfcontained = FALSE,
           libdir = "dir_result")