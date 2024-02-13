load letterdata.mat
load predmodel.mat
traindata
testdata
predLetter
idx = (traindata.Character == "N") | (traindata.Character == "U");
UorN = traindata(idx,:)

idx = (testdata.Character == "U") & (predLetter ~= "U");
fnU = testdata(idx,:)
UorN.Character = removecats(UorN.Character);
UorNfeat = UorN{:,1:end-1};
fnUfeat = fnU{:,1:end-1};
parallelcoords(UorNfeat,"Group",UorN.Character)
hold on
plot(fnUfeat(4,:),"k")
hold off
