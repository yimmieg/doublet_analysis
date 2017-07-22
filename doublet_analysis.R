library(data.table);

batch5.w1 <- fread("cramore/Ye10.1.sm.sorted.2.filtered.best");
batch5.w2 <- fread("cramore/Ye20.1.sm.sorted.2.filtered.best");

batch5.w1.llk.singlets <- which(batch5.w1$SNG.LLK1-batch5.w1$LLK12 > 1);
batch5.w2.llk.singlets <- which(batch5.w2$SNG.LLK1-batch5.w2$LLK12 > 1);

batch5.w1.llk.doublets <- which(batch5.w1$LLK12-batch5.w1$SNG.LLK1 > 1);
batch5.w2.llk.doublets <- which(batch5.w2$LLK12-batch5.w2$SNG.LLK1 > 1);

batch5.w1.llk.amb <- intersect(which(batch5.w1$LLK12-batch5.w1$SNG.LLK1 < 1),which(batch5.w1$SNG.LLK1-batch5.w1$LLK12 < 1));
batch5.w2.llk.amb <- intersect(which(batch5.w2$LLK12-batch5.w2$SNG.LLK1 < 1),which(batch5.w2$SNG.LLK1-batch5.w2$LLK12 < 1));

batch5.w1.post.singlets <- which(batch5.w1$PRB.DBL < 0.1)
batch5.w2.post.singlets <- which(batch5.w2$PRB.DBL < 0.1)

batch5.w1.post.doublets <- which(batch5.w1$PRB.DBL > 0.9)
batch5.w2.post.doublets <- which(batch5.w2$PRB.DBL > 0.9)

batch5.w1.post.amb <- intersect(which(batch5.w1$PRB.DBL < 0.9), which(batch5.w1$PRB.DBL > 0.1))
batch5.w2.post.amb <- intersect(which(batch5.w2$PRB.DBL < 0.9), which(batch5.w2$PRB.DBL > 0.1))


pdf("batch5.w1.llk.vs.post.pdf");
plot(batch5.w1$LLK12-batch5.w1$SNG.LLK1, batch5.w1$PRB.DBL, xlim=c(-10,10))
dev.off();

pdf("batch5.w2.llk.vs.post.pdf");
plot(batch5.w2$LLK12-batch5.w2$SNG.LLK1, batch5.w2$PRB.DBL, xlim=c(-10,10))
dev.off();
