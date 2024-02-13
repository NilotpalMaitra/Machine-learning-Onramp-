letterds = datastore("*_M_*.txt");
data = read(letterds);
data = scale(data);
plot(data.X,data.Y)
axis equal
plot(data.Time,data.Y)
ylabel("Vertical position")
xlabel("Time")
preprocds = transform(letterds,@scale)
data = readall(preprocds)
plot(data.Time,data.Y)

function data = scale(data)
data.Time = (data.Time - data.Time(1))/1000;
data.X = 1.5*data.X;
data.X = data.X - mean(data.X,"omitnan");
data.Y = data.Y - mean(data.Y,"omitnan");
end
