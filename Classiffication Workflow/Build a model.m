load featuredata.mat
features
knnmodel = fitcknn(features,"Character")
predicted = predict(knnmodel,[4, 1.2])
knnmodel = fitcknn(features,"Character","NumNeighbors",5)
predicted = predict(knnmodel,[4,1.2])
