# coursera_getting_and_cleaning_data

This is my repository for the final project of Coursera's Getting and Cleaning Data course.

For this project we had to download and process measurement data taken with accelerometers in Samsung phones
and generate a "tidy"" summary dataset. The README.txt file inside the ucihar_data directory goes into more extended
detail on how the data were originally obtained, preprocessed, and sampled. The objective was to use a variety of 
data wranging approaches to generate a final, cleaned up dataset. I mainly relied on Hadley Wickham's packages, dplyr and plyr to yield my final output file. The final output file is in a long format, grouped by Activity type and Subject. 

Inside this directory you will find the following:

1. run_analysis.R - The script used to process the data files and generate a tidy data set, each step is described
2. ucihar_data - The directory with all the data files necessary to complete the assignment
3. codebook.md - A description of the variables found in the tidy dataset 
4. myTidyData.txt - The output of run_analysis.R 
5. variableNamesforCodebook.txt - A text file of variable names that I used for creating the codebook

