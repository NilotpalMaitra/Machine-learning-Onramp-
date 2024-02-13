load sampleletters.mat
plot(v2.X,v2.Y,"o-")
C = corr(v2.X,v2.Y)
C = corr(v2.X,v2.Y,"Rows","complete")
M = [v2.X(1:11) v2.Y(1:11) v2.X(12:22) v2.Y(12:22)]
Cmat = corr(M,"Rows","complete")
