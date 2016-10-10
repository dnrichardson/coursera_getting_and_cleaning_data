# Getting and Cleaning Data - Week 4 Final Project

This is my repository for the final project of Coursera's Getting and Cleaning Data course.

For this project we had to download and process measurement data taken with accelerometers in Samsung phones
and generate a "tidy"" summary dataset of various means and standard deviations of several variables. The README.txt file inside the *ucihar_data* directory goes into more extended detail on how the data were originally obtained, preprocessed, and sampled by the researchers at [Smartlab - Non Linear Complex Systems Laboratory](www.smartlab.ws). 

The objective this project was to use a variety of data wranging approaches involving reading in several text files and combining files logically to generate a final, tidy dataset. I mainly relied on Hadley Wickham's packages, dplyr and plyr to yield my final output file. The final output file is in a long format, grouped by Activity type and Subject. 

To obtain the tidy data set, all one has to do is clone the repository and run the script, run_analysis.R at the command line or in RStudio. Be sure that you have the dplyr and plyr packages installed. 

__Inside this directory you will find the following:__

1. run_analysis.R - The script used to process the data files and generate a tidy data set, each step is described in the comments
2. ucihar_data - The directory with all the data files necessary to complete the assignment
3. codebook.md - A description of the variables found in the tidy dataset 
4. myTidyData.txt - The output of run_analysis.R 
5. variableNamesforCodebook.txt - A text file of variable names that I used for creating the codebook

