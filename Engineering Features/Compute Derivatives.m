load sampleletters.mat
plot(m2.Time,m2.X)
grid
dX = diff(m2.X);
dT = diff(m2.Time);
dXdT = dX./dT;
plot(m2.Time(1:end-1),dXdT)
maxdx = max(dXdT)
dYdT = diff(m2.Y)./dT;
maxdy = max(dYdT)
dYdT = standardizeMissing(dYdT,Inf);
maxdy = max(dYdT)
