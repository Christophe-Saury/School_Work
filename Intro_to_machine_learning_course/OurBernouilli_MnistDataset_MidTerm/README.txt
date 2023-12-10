We have implemented the Bernouilli Naive Bayes model and tested it by using it on the Mnist Dataset. 
We chose to use the Bernouilli Naive Bayes because the data from the Mnist dataset can be separated in pixel values between 0 and 1 once we binarize the data. 
In this scenario, the Bernouilli Naive Bayes is more accurate than a multinomial Naive Bayes.
We tested the results multiple times with different training and testing splits and plotted the accuracy. We get the average accuracy and compare it to other models contained in SciLearn's library.