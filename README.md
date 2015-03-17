# Coursera-tidy-data
Cousera: Getting and Cleaning data course project - my solution

The analysis explained

the script 'run_analysis.R' enables the merging and then cleaning of Samsung data sets to create a clean tidy data set
'tidy-data-txt'.

the script assumes that the Samsung data is in your working directory for R.

the library reshape2 is used to process the data and prepare it for being cleaned and output to the final text document output.

The steps involved in the analysis are:

1. Merging the training and test data sets to create one new data set and adding column variable names
  i) cbind() and rbind() used to bring test and train data sets together and to add labels

2. Extracting from this new data set only the columns of interest that contain either mean() or std()
  i) grep() used to find only variable names that have mean() or std()
  ii) use result of which to subset the data to extract the variables of interest

3. Modifying the activity variable to show the descriptive names for each activity; standing, walking etc.
  i) as.factor() used to change activity variable to a factor variable then;
  ii) levels() used to change factor levels of activity variable from numbers to descriptive activity labels 

4. Labelling the variables with descriptive variable names. Here we've made sure that variable names are syntatically valid names using make.names()
  i) gsub() used to remove parentheses
  ii) make.names() used to make variable names syntatically valid in R

5. the final step is to create a second independent tidy data set with the average of each variable for each subject and activity. Here we use the melt function in plyr to make the data long and tall with 4 columns: subject, activity, variable and mean figure.
  i) aggregate() used to group variables by activity and subject and mean calculated for each variable for these groups.
  ii) melt() used to transform the data from a wide data set with variables in different columns to a tidy data set where according to Hadley Wickham's paper on tidy data sets:
1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table 
The average (mean) variable is then put into one column and each observation (activity, subject, variable) forms a row. This final independent tidy data set meets Hadley Wickham's criteria for a tidy data set. 

Steps to run the analaysis

1. In R set your working directory to where the Samsung data set is saved locally
2. Install the package 'reshape2' if not already installed
3. Run the run_analysis.R file
