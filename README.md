Getting and Cleaning Data - Course Project
==========================================

The project is composed of the next files:

- `README.md`: This file.

- `run_analysis.R`: It contains an R function ('clean.data()') to perform the steps required by the "Getting and Cleaning Data" project assignment. The function should be imported first using `source()`.
The function expects to find the dataset inside a directory called data in the current folder. The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). If it does not find it, then it downloads
it first and later does the required steps, storing the generated tidy dataset in a text file called tidy.txt.

- `CodeBook.md`: Describes the variables handled by `run_analysis.R`.
