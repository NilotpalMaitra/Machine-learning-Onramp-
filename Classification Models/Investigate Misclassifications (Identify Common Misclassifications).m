load letterdata.mat
load predmodel.mat
testdata
predLetter
confusionchart(testdata.Character,predLetter);

confusionchart(testdata.Character,predLetter,"RowSummary","row-normalized");
falseneg = (testdata.Character == "U") & (predLetter ~= "U");
fnfiles = testfiles(falseneg)
fnpred = predLetter(falseneg)
badU = readtable(fnfiles(4));
plot(badU.X,badU.Y)
title("Prediction: "+string(fnpred(4)))
