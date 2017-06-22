library(ggplot2)


all.emp = read.csv("d:/git/OTC-Production/reports/empirical-production-curves.csv")
oil.emp = melt(all.emp[ all.emp$Product == "Oil", 3+1:36  ])$value
oil.est = read.csv("d:/git/OTC-Production/reports/estimated-oil-curve.csv")$x

df = data.frame(Month=1:length(oil.est), Oil.Est=oil.est, Oil.Emp=c(oil.emp, rep(NA, length(oil.est)-length(oil.emp))))

g = ggplot(data=df, aes(Month, Oil.Est)) + geom_line()

plot(g)