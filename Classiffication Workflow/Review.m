load featuredata13letters.mat
features
testdata
gscatter(features.AspectRatio,features.Duration,features.Character)
xlim([0 10])
knnmodel = fitcknn(features,"Character","NumNeighbors",5);
predictions = predict(knnmodel,testdata);
misclass = sum(predictions ~= testdata.Character)/numel(predictions)
confusionchart(testdata.Character,predictions)
