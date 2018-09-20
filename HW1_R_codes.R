
# *********************************************
# DAMI Preprocessing Exercise R file
# Complete the codes to complete the assignment
# *********************************************

# 1. Import data for analysis to R environment
# Downloaded "Adult" dataset from UCI Machine Learning Repository
# URL http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data
# Import dataset in adult_db
# Missing values are represented as "?" in data file, make sure that R read them as missing values (NAs)
# ------------------------------------------------------------------------------------------------------ #
# use read.table(), type ?read.table for help
adult_db <- # ****** YOUR CODE GOES HERE *******



# Assign attribute names (column names) to the data we just imported
# Attribute names are in separate file "adult.names", scroll down to the bottom of this file
# Attribute names such as ("age", "workclass", "fnlwgt",...)
# Last column of the dataset adult.db with values ">50K" and "<=50K" does not have name, 
# this is the class attribute, so we just name it as "class"

colnames(adult_db) = c("age",
                       "workclass",
                       "fnlwgt",
                       "education",
                       "education_num",
                       "marital_status",
                       "occupation",
                       "relationship",
                       "race",
                       "sex",
                       "capital_gain",
                       "capital_loss",
                       "hours_per_week",
                       "native_country",
                       "class")


# 2. Check for missing values
# Write code to plot missingness and count missing values each attribute has
# Inorder to plot missingness, you need to first install "Amelia" package
# Hint: use "apply" function along columns of "adult.db", for each column (attribute) find how many NAs are there
# --------------------------------------------------------------------------------------------------------------- #

library(Amelia)
# plot missing values in data
# ****** YOUR CODE HERE ******* #
# HINT: use missmap()

# count number of missing values in all attributes
# ****** YOUR CODE HERE *****



# Delete records (rows) with any missing value
adult_db_nomiss <- # ****** YOUR CODE HERE *******




# 3. We will take only small chunk of the data for our purpose.
# So, randomly select 1000 records from among 30 thousand records in the dataset.
# ------------------------------------------------------------------------------- #
set.seed(145)
idx = sample(1:nrow(adult_db_nomiss),1500)
adult_db_lim = adult_db_nomiss[idx,]
row.names(adult_db_lim) <- NULL



# 3a. Examine attributes of the dataset
# Plot histogram for numeric attribute "age", with 100 (for <=50K) and 50(for >50K) breaks, 
# show main title and attribute name on the plot.
# --------------------------------------------------------------------------------------------------------

# ******* YOUR CODE FOR HISTOGRAM PLOT GOES HERE ******** #
# HINT: use hist()

# ******************************************************* #

# 3b. Plot barchart for categorical attribute "relationship", 
# show legend, attribute name and main title for the plot.
# ******* YOUR CODE FOR BAR CHART GOES HERE ******* #
# HINT: use barplot()
# ************************************************* #


# 3c. Plot a boxplot for attribute "Age" for groups with earning "<=50K", ">50K"
# ------------------------------------------------------------------------------

# ****** YOUR CODE GOES HERE ***** #
# HINT: use boxplot()



# 4 Create new data set from our latest dataset with only numeric attributes
# ------------------------------------------------------------------------
adult_db_numeric <- adult_db_lim[,c("age", "fnlwgt", "education_num", "capital_gain", "capital_loss", "hours_per_week")]
class_cat <- adult_db_lim[,c("class")]



# Standardize numeric attributes in "adult_db_numeric" dataset.
# mean = 0 and sd = 1 for all numeric attributes
adult_db_num_std <- # *** YOUR CODE HERE *** #
  

# we can check the mean and standard deviation of the standardized data
apply(adult_db_num_std, 2, mean)
apply(adult_db_num_std, 2, sd)



# 5a. Run Principal Component Analysis (PCA) on the numeric dataset from above "adult_db_num_std"
# plot the first 2 principal components
# ------------------------------------------------------------------------------------------

# ******** YOUR CODE FOR GETTING PRINCIPAL COMPONENTS GOES HERE ******** #
# HINT: use prcomp()
pr.out <- # *** YOUR CODE HERE prcomp() *** #

  
adult_db_pca <- pr.out$x

# ******** YOUR CODE TO PLOT FOR FIRST TWO PCs ****** #
# plot(), legend()


      
      
# 5b. Plot percentage of the variance explained by principal components
# ----------------------------------------------------------------------------
# write a code to show proportion of variance explained by each Principal Component
# Standard deviation are stored as "sdev"

# *** YOUR CODE GOES HERE *** #
# plot(), legend()


# 5c. write answer for this as a comment using #
# ------------------------------------------------------------------------------
# How many principal components are needed to explain 50% and 90% of variance respectively
# Answer:
