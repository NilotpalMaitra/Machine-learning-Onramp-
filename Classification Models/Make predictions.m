load letterdata.mat
traindata
knnmodel = fitcknn(traindata,"Character","NumNeighbors",5,"Standardize",true,"DistanceWeight","squaredinverse");
testdata

predLetter = predict(knnmodel,testdata)
misclassrate = sum(predLetter ~= testdata.Character)/numel(predLetter)
testloss = loss(knnmodel,testdata)
