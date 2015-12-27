Getting and Cleaning Data - Course Project
==========================================

The project is composed of the next files:

- `README.md`: This file.

- `run_analysis.R`: R code to perform the steps required by the "Getting and Cleaning Data" course project assignment. To run this script either change to the directory where 
it is located (using `setwd()`) or import is using `source()`. The scripts expects to find the dataset inside a directory called data in the current folder. The dataset being
used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)If it does not find it, then it downloads
it first and later does the required steps, storing the generated tidy data set in a text file called tidy.txt.

- `CodeBook.md`: Describes the variables contained in the tidy data set generated as output by `run_analysis.R`.
