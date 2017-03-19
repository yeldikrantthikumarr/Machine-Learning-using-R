#User: Kranthi Kumar Yeldi
#Association Analysis[Market Basket Analysis] using R with GROCERIES DATA
install.packages("packman")
pacman::p_load(arules,arulesViz)
data("Groceries")
?Groceries
str(Groceries)
dim(Groceries)
summary(Groceries) #Includes 5 most frequent items
#In Association mining, u need to mention Support  and Confidence levels
# Support --> for eg:0.001(1/1000) defined as Item used to appear atleast 1/10 of 1 percent of transaction
#Confidence --> 0.75

rules <- apriori(Groceries,parameter = list(supp=0.001,conf=0.75))
options(digits = 2)                
inspect(rules[1:10])
#plotting
plot(rules) #Display all rules
#top20 Rules
plot(rules[1:20],method ="graph",control = list(type="items"))
#parallel coordinates of top20 rules
plot(rules[1:20],method="paracoord",control=list(reorder=TRUE))

#Grouped matrix plot of antecedents and consequents

plot(rules[1:20],method="grouped")

#MATRIX PLOT
plot(rules[1:20],method = "matrix",control=list(reorder=TRUE))
#predicts "WHOLE MILK"
