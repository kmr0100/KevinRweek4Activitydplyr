#Week 4: dplyr package

#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))
titanic <- as.data.frame(Titanic)     #setting the datset as a frame and labeling as titanic
View(titanic)                         #want to see the datset as another tab...can jsut use "titanic" to get in console

#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(titanic)                         #head() calls the first few rows


#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
install.packages("dplyr")             #installs and implement dplyr
library(dplyr)

#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
titanic %>% select(Survived, Sex)


#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
titanicSS <- titanic %>% select(Survived, Sex)
View(titanicSS)

#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
titanicSS <- titanicSS %>% select (Survived)      #want titanicSS to only contained the Survived column


#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'
titanic <- titanic %>% rename (Gender = Sex)    #reassigning the dataset with Column title of Gender
View(titanic)

#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
titanicGen <- titanic %>% select(Gender)        #creating new dataframe with just the gender column
titanicGen

#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
titanicGenM <- titanic %>% filter(Gender == "Male")   #reassigning the titanicGen frame with one males under gender column
titanicGenM

#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())
titanic <- titanic %>% arrange(Gender)


#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
sum(titanic$Freq)

#TASK: After you run it, write the total here: 2201

#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
titanicGenF <- titanic %>% filter(Gender == "Female")       #from original set create new set of just females
titanicGenF


#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
titanicMandF <- union(titanicGenM, titanicGenF)           #created new set with M and F sets combined (new set equal to original titanic)
titanicMandF

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
summary(titanic)  #breaks down each category within the columns...ex) counts number of male columns and female columns
dim(titanic)      #gives dimensions of the datset
titanic %>% summarize(freq = mean(Freq, na.rm = TRUE))    #find the mean of a specific column...can replace mean with any other statistical call
select(titanic, 3)    #see a specific column of datset
