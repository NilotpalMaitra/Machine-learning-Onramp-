letterds = datastore("*.txt");
preprocds = transform(letterds,@scale)
featds = transform(preprocds,@extract)
data = readall(featds)
scatter(data.AspectRatio,data.CorrXY)
knownchar = extractBetween(letterds.Files,"_","_")
knownchar = categorical(knownchar)
data.Character = knownchar
gscatter(data.AspectRatio,data.CorrXY,data.Character)


function data = scale(data)
% Normalize time [0 1]
data.Time = (data.Time - data.Time(1))/(data.Time(end) - data.Time(1));
% Fix aspect ratio
data.X = 1.5*data.X;
% Center X & Y at (0,0)
data.X = data.X - mean(data.X,"omitnan");
data.Y = data.Y - mean(data.Y,"omitnan");
% Scale to have bounding box area = 1
scl = 1/sqrt(range(data.X)*range(data.Y));
data.X = scl*data.X;
data.Y = scl*data.Y;
end

function feat = extract(letter)
% Aspect ratio
aratio = range(letter.Y)/range(letter.X);
% Local max/mins
idxmin = islocalmin(letter.X,"MinProminence",0.1);
numXmin = nnz(idxmin);
idxmax = islocalmax(letter.Y,"MinProminence",0.1);
numYmax = nnz(idxmax);
% Velocity
dT = diff(letter.Time);
dXdT = diff(letter.X)./dT;
dYdT = diff(letter.Y)./dT;
avgdX = mean(dXdT,"omitnan");
avgdY = mean(dYdT,"omitnan");
% Correlation
corrXY = corr(letter.X,letter.Y,"rows","complete");
% Put it all together into a table
featurenames = ["AspectRatio","NumMinX","NumMinY","AvgU","AvgV","CorrXY"];
feat = table(aratio,numXmin,numYmax,avgdX,avgdY,corrXY,'VariableNames',featurenames);
end
