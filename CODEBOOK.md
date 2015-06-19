Codebook for Getting and Cleaning Data
======================================

This project's data comes from the provided link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This link provides the file 'features_info.txt' which describes the variables included in the datasets.  In addition to these variables, the analysis creates the following variables:

* subject: the subject id common to each dataset
* activity_name: a label indicating which level of activity the data was recorded during
* set: an indicator stating which set of data the information came from (test or training)

The created dataset includes means for each variable, split on activity level and subject.