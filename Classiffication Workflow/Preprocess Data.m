letter = readtable("M.txt")
letter.X = 1.5*letter.X;
plot(letter.X,letter.Y)
axis equal
letter.Time = letter.Time - letter.Time(1)
letter.Time = letter.Time/1000
plot(letter.Time,letter.X)
plot(letter.Time,letter.Y)
