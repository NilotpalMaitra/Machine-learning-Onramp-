load sampleletters.mat
plot(m1.Time,m1.X)
idxmin = islocalmin(m1.X)
idxmax = islocalmax(m1.X)
plot(m1.Time,m1.X)
hold on
plot(m1.Time(idxmin),m1.X(idxmin),"o")
plot(m1.Time(idxmax),m1.X(idxmax),"s")
hold off
[idx,prom] = islocalmin(m1.X);
plot(m1.Time,prom)
idxmin = islocalmin(m1.X,"MinProminence",0.1)
idxmax = islocalmax(m1.X,"MinProminence",0.1)
