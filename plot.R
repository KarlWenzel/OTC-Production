library(ggplot2)
library(reshape2)

oil.prod.rate = read.csv("e:/git/OTC-Production/reports/estimated-Oil-curve.csv")$x
oil.cumulative = read.csv("e:/git/OTC-Production/reports/estimated-Oil-cumulative.csv")$x

df = rbind(
  
  data.frame(
    Years = 1:length(oil.prod.rate) / 12, 
    Category = rep("Cumulative Total", length(oil.prod.rate)), 
    Oil = oil.cumulative * 100
  ),
  
  data.frame(
    Years = 1:length(oil.prod.rate) / 12, 
    Category = rep("Production Rate", length(oil.prod.rate)), 
    Oil = oil.est * 100
  )
  
)

g = ggplot(data=df, aes(x=Years, y=Oil, group=Category, color=Category)) 
g = g + geom_line(size=1)
g = g + ggtitle("Average Normalized Horizontal Oil Well Production")

plot(g)
ggsave(paste0(reports_folder, "/Average-Normalized-Horizontal-Oil-Well-Production.png"), width=10, height=5)


gas.prod.rate = read.csv("e:/git/OTC-Production/reports/estimated-Gas-curve.csv")$x
gas.cumulative = read.csv("e:/git/OTC-Production/reports/estimated-Gas-cumulative.csv")$x

df = rbind(
  
  data.frame(
    Years = 1:length(gas.cumulative) / 12, 
    Category = rep("Cumulative Total", length(gas.cumulative)), 
    Gas = gas.cumulative * 100
  ),
  
  data.frame(
    Years = 1:length(gas.prod.rate) / 12, 
    Category = rep("Production Rate", length(gas.prod.rate)), 
    Gas = gas.prod.rate * 100
  )
  
)

g = ggplot(data=df, aes(x=Years, y=Gas, group=Category, color=Category)) 
g = g + geom_line(size=1)
g = g + ggtitle("Average Normalized Horizontal Gas Well Production")

plot(g)
ggsave(paste0(reports_folder, "/Average-Normalized-Horizontal-Gas-Well-Production.png"), width=10, height=5)
