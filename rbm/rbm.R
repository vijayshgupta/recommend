library('deepnet')
source("svd_utils.R")
df = read.csv('u_clean_normalized.data')
df = df[, -1]
USER_ID = df[, 1]

mod = rbm.train(as.matrix(df[, 2:ncol(df)]), hidden = 50, numepochs = 10)

h = rbm.up(mod, as.matrix(df[, 2:ncol(df)]))
v = rbm.down(mod, h)

pred = cbind(USER_ID, v)

pred = preProcess(as.data.frame(pred))

r = evaluate(df, pred)