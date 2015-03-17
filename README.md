# Coursera-tidy-data
Cousera: Getting and Cleaning data course project - my solution

The analysis explained

the script 'run_analysis.R' enables the merging and then cleaning of Samsung data sets to create a clean tidy data set
'tidy-data-txt'.

the script assumes that the Samsung data is in your working directory for R.

the library reshape2 and plyr are used to process the data and prepare it for being cleaned and output to the final text document output.

The steps involved in the analysis are:

1. Merging the training and test data sets to create one new data set and adding column variable names
2. Extracting from this new data set only the columns of interest that contain either mean() or std()
3. Modifying the activity variable to show the descriptive names for each activity; standing, walking etc.
4. Labelling the variables with descriptive variable names. Here we've made sure that variable names are syntatically valid names using make.names()
5. the final step is to create a second independent tidy data set with the average of each variable for each subject and activity. Here we use the melt function in plyr to make the data long and tall with 4 columns: subject, activity, variable and mean figure. 

Steps to run the analaysis

1. In R set your working directory to where the Samsung data set is saved locally
2. Install the packages 'reshape2' and 'plyr' if not already installed
3. Run the run_analysis.R file
