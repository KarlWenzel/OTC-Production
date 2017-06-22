

f = function(p, q) {
  qi = q[2]
  Di = p[1]
  b = p[2]
  t = 1:34
  curve = hyperbolic.curve(qi, p[1], p[2], t)
  return(sum((curve - q[t+2])^2))
}

q = melt(data[data$Product=="Oil", 2+(1:36)])$value
x = nlm(f, p=c(0.12, 1.357801), q=q)