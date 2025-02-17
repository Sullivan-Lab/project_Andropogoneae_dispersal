rm(list=ls())


library(ape)
library(phytools)
library(tidyverse)
library(nlme)


# tree <- read.tree("grass_tree.tree")
# tree
# #plot(tree)
# 
# 
# tree2 <- read.newick("grass_tree.nwk")
# #plot(tree2)
# tree2

##this tree has the names corrected to match the data we have.
tree3 <- read.newick("grass_tree2.newick")
#plot(tree3)

tv_dat <- read_csv("Seed Drop Data - Analysis Data.csv")
head(tv_dat)


list(unique(tv_dat$Species))
list(unique(tree3[[3]]))

## check names and prune tree
#data <- data[match(tree3$tip.label, tv_dat$Species), ]



tree_prune <- drop.tip(tree3, setdiff(tree3$tip.label, tv_dat$Species))
plot(tree_prune)

# Convert tree to correlation structure
bm <- corBrownian(1, phy=tree_prune)


#check data again
setdiff(tree_prune$tip.label, tv_dat$Species)
setdiff(tv_dat$Species, tree_prune$tip.label)

tv_dat_small <- subset(tv_dat,  Species != "Andropogon_glomeratus" & 
                                Species != "Andropogon_virginicus" & 
                                Species != "Chasmanthium_laxum" &
                                Species != "Hyparrhenia_diplandra" &
                                Species != "Thelopogon_elegans")

setdiff(tree_prune$tip.label, tv_dat_small$Species)
setdiff(tv_dat_small$Species, tree_prune$tip.label)

plot(tree_prune)



# Run PGLS

#head(tv_dat)
model <- gls(VT ~ plant_height, 
             data = tv_dat_small, 
             correlation = bm)
summary(model)



any(is.na(tv_dat_small))
tv_dat_small <- na.omit(tv_dat_small)


# Summarize results

?gls
?corBrownian

##to dos
#     1. get rid of the one species that is different from Toby's email.



