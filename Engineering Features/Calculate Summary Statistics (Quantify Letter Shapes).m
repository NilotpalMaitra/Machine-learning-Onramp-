load sampleletters.mat
plot(b1.Time,b1.X)
hold on
plot(b2.Time,b2.X)
hold off
plot(b1.Time,b1.Y)
hold on
plot(b2.Time,b2.Y)
hold off
aratiob = range(b1.Y)/range(b1.X)
medxb = median(b1.X,"omitnan")
medyb = median(b1.Y,"omitnan")
devxb = mad(b1.X)
devyb = mad(b1.Y)
aratiov = range(v1.Y)/range(v1.X)
medxd = median(d1.X,"omitnan")
medyd = median(d1.Y,"omitnan")
devxm = mad(m1.X)
devym = mad(m1.Y)
