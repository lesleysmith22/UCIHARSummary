# UCIHARSummary
Solution to Getting and Cleaning Data Coursera Assignment

This code manipulates data created by experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. A full description of the original dataset is available from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original dataset can be obtained at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This code combines the files provided above into a single labelled file and extracts all mean and standard deviation vectors.
This code uses the dplyr package to summarised data provides the mean value of each activity and subject group in the original dataset.

Requirements:
=========================================
This code requires the installation of the dplyr package in order to function

The dataset includes the following files:
=========================================

- 'README.txt' explains how the scripts work and how they are connected
- 'Assignment.R' provides the code that was used to perform the analysis

Acknowledgements:
========
This data utilises the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

