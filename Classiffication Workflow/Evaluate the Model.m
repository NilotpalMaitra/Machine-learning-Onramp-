load featuredata.mat
knnmodel = fitcknn(features,"Character","NumNeighbors",5);

testdata
predictions = predict(knnmodel,testdata)
iscorrect = predictions == testdata.Character
accuracy = sum(iscorrect)/numel(predictions)
iswrong = predictions ~= testdata.Character
misclassrate = sum(iswrong)/numel(predictions)
confusionchart(testdata.Character,predictions)
