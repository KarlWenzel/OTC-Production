

f = function(p) {
  q = melt(data[data$Product=="Oil", 2+(1:22)])$value
  qi = q[2]
  t = 3:24
  curve = hyperbolic.curve(qi, p[1], p[2], t)
  return(sum((curve - data[t])^2))
}

#nlm(f, p = c(0.5, 0.5))