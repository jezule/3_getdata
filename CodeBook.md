# Introduction

Original data: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

`run_analysis.R` contains the function clean.data() which performs the 5 steps required by the project. The function should be loaded first using the command 'source()', which takes as
argument the full path to the file (for example, 'source("C:\\Downloads\\run_analysis.R")').

In the first step, checks for the original, compressed dataset UCI_HAR_data.zip in a subfolder called './data'. If it doesn't find it, then it downloads and decompresses it.

Later, goes through all the steps:
* 1. Merges all data using the `rbind()` function.
* 2. Takes only the subset of columns that contain mean and standard deviation measures (using function 'grep()') and names them properly using the contents of `features.txt`.
* 3. Labels all activities according to `activity_labels.txt`.
* 4. Assigns descriptives names for the variables.
* 5. Generates a tidy dataset as required and it stores it in a text file called tidy.txt.

# Variables

* `training.x`, `training.y`, `training.subject`, `test.x`, `test.y` and `test.subject`: original data.
* `merged.x`, `merged.y`, `merged.subject` and `merged`: previous datasets merged.
* `features`: names for the `merged.x` dataset (Only a subset of them is required (those features that contain either mean or std measurements).
* `actvities: names for the `merged.y` dataset.
* `merged2`: merge of the required subset of merged.x, merged.y with descriptive names included and `merged.subject` with additional column info.
* `tidy`: contains the tidy dataset as required in the assignment, with the calculated means. This is the variable stored in the text file.