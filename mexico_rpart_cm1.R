#
install.packages("tzdb")
install.packages("tidyverse")
install.packages("readxl")
install.packages("factoextra")
install.packages("cluster")
install.packages("corrplot")
install.packages("tree")
install.packages("ISLR2")
install.packages("randomForest")
install.packages("rpart")
install.packages("tidyr")
install.packages("rpart.plot")

#
library(tzdb)
library(tidyverse)
library(readxl)
library(factoextra)
library(cluster)
library(corrplot)
library(tree)
library(ISLR2)
library(randomForest)
library(rpart)
library(rpart.plot)
library(tidyr)
library(ggplot2)
#
data<-read_excel("tree_data.xlsx")
dim(data)
summary(data)
# this defines being in Segment A as our dependent variable
data$Segment_A <- factor(ifelse(data$IDX_2 <= 1, "No", "Yes"))
# for replication
set.seed(1)
#  The next line estimates a single tree
# using a different package from before
# Now we use the rpart package
mexico.seg.tree <- rpart(Segment_A ~ Graduate+Educated_to_18+ed_15+ed_primary+ed_none+
                Occupation_High+Occupation_Medium+occ_lowb+
                Informal_job+ten_long+ten_short+
                g_job+female+kids+
                a_25_39+a_40_54+a_55_p+
                Region_South+Region_Centre_North+CX+N
              ,data=data,method="class")
# Plot the estimated tree
# I think this looks better than our current version
rpart.plot(mexico.seg.tree, cex=0.65)
# There is a measure of the importance of each variable
# for the estimated tree
# The next line puts this into a dataframe 
var.imp.mst <- as.data.frame(mexico.seg.tree$variable.importance)
# Next we define a list of names for the characteristics
# There is something weird here: 
# the single tree does not include the age 40-54 characteristic
# I don't know why
names<-c("Graduate","Educated to 18","Educated to 15","edprimary","ed_none",
         "Occupation_High","Occupation_Medium","occ_lowb",
         "Informal_job","ten_long","ten_short",
         "g_job","female","kids",
         "a_25_39","a_55_p",
         "Region_South","Region_Centre_North","CX","N"
)
# the next line puts the names and the variable importance 
# measures in a dataframe for plotting
toplot=data_frame(names,var.imp.mst)
# this line plots
ggplot(toplot, aes(y = names, x = mexico.seg.tree$variable.importance))+geom_point()+
  labs(title="Variable Importance Measure", subtitle="Unpruned Single Tree", y="Characteristic", x="Variable Importance", caption="ENOE data, 2019Q4")+
  theme(axis.text.y = element_text(size = 6))
#
# Next we find the optimal tree by finding the optimal
# complexity parameter
# The documentation for the rpart package explains this
# not sure I fully understand, but it looks legit
#
# Plot the complexity parameter
plotcp(mexico.seg.tree)
# Get the optimal cp value
optimal_cp <- mexico.seg.tree$cptable[which.min(mexico.seg.tree$cptable[,"xerror"]), "CP"]
# Prune the tree by using the optimal complexity parameter
pruned.tree <- prune(mexico.seg.tree, cp = optimal_cp)
# Plot the pruned tree
rpart.plot(pruned.tree, cex=0.55)
# now get the variable importance measure for the pruned tree
var.imp.pt <- as.data.frame(pruned.tree$variable.importance)
# And plot it
toplot=data_frame(names,var.imp.pt)
ggplot(toplot, aes(y = names, x = pruned.tree$variable.importance))+geom_point()+
  labs(title="Variable Importance Measure", subtitle="Pruned Single Tree", y="Characteristic", x="Variable Importance", caption="ENOE data, 2019Q4")+
  theme(axis.text.y = element_text(size = 6))
#
# Before we get into Random Forests, I'll build and plot a simpler tree
# 
mexico.seg.tree.2 <- rpart(Segment_A ~ Graduate+Educated_to_18+ed_15+ed_primary+ed_none+
                           Occupation_High+Occupation_Medium+occ_lowb+
                           Informal_job+ten_long+ten_short+
                           g_job+female+kids+
                           a_25_39+a_40_54+a_55_p+
                           Region_South+Region_Centre_North+CX+N
                         ,data=data,method="class",cp=0.02)

###### Plot the estimated simpler tree
rpart.plot(mexico.seg.tree.2, cex=0.65)
#
# Now we do the Random Forest
set.seed(1)  
# The next line estimates the RF
# This takes a while to run
mst.rf <- randomForest(Segment_A ~ Graduate+Educated_to_18+ed_15+ed_primary+ed_none+
Occupation_High+Occupation_Medium+occ_lowb+
  Informal_job+ten_long+ten_short+
  g_job+female+kids+
  a_25_39+a_40_54+a_55_p+
  Region_South+Region_Centre_North+CX+N
,data=data,method="class", importance = TRUE)
# the next couple of lines extract the variable improtance measure
vi.rfo <- as.data.frame(randomForest::importance(mst.rf))
vi.rf <-data.frame(vi.rfo$MeanDecreaseGini)
# With RF, all 21 variables are used, so age 4-54 is included
# Not sure why 
names.1<-c("graduate","educated to 18","educated to 15","primary education","None education",
         "Occupation_High","Occupation_Medium","occ_lowb",
         "Informal_job","ten_long","ten_short",
         "g_job","female","kids",
         "a_25_39","a_40_54","a_55_p",
         "Region_South","Region_Centre_North","CX","N"
)
# Now we plot the results
toplot=data_frame(names.1,vi.rf)
ggplot(toplot, aes(y = names.1, x = vi.rfo.MeanDecreaseGini))+geom_point()+
  labs(title="Variable Importance Measure", subtitle="Random Forest", y="Characteristic", x="Variable Importance", caption="ENOE data, 2019Q4")+
  theme(axis.text.y = element_text(size = 6))
# I think this looks pretty good
# What do you think?
# One job is to make all the names the same as in the paper

#scale_x_discrete(guide = guide_axis(n.dodge = 2))

######################### Edited plot with % and bars

# variable importance
vi.rfo <- as.data.frame(randomForest::importance(mst.rf))
vi.rf <- data.frame(Importance = vi.rfo$MeanDecreaseGini)

# Normalize importance to proportions
vi.rf$Proportion <- (vi.rf$Importance / sum(vi.rf$Importance))*100

# Define the variable labels
names.1 <- c("Graduate", "Education up to 18", "Education up to 15", "Primary education", "No formal education",
             "High-level occupation", "Medium-level occupation", "Low-level occupation",
             "Informal job", "Long tenure", "Short tenure",
             "Government job", "Female", "Kids",
             "Age 25-39", "Age 40-54", "Age 55+",
             "Region: South", "Region: Centre-North", "Region Centre", "Region: North")

# Combine data correctly
toplot <- data.frame(Characteristic = names.1, Proportion = vi.rf$Proportion)

# Plot the results
ggplot(toplot, aes(y = reorder(Characteristic, Proportion), x = Proportion)) +
  geom_col(fill = "blue") +  # Use bars instead of points for proportion
  labs(title = "Variable importance",
       subtitle = "Random Forest (Proportion-Based)",
       y = "Characteristic",
       x = "Importance (%)",
       caption = "ENOE data, 2019Q4") +
  theme_minimal() +
  theme(axis.text.y = element_text(size = 8))



