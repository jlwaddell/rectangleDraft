# install load the package for reading Excel files
install.packages("xlsx")  # you can comment this out if the package is installed
library(xlsx)

# set working directory (this needs to be set to wherever you have your .xlsx file
# note the R uses '/' for paths instead of '\'
# setwd("C:/Users/Jason/.architect/workspace/cube/rectangleGitHub")

# load data
# use the PennyPincher file as a reference for how the file should be formatted
inputFile <- "PennyPincher21InventorsFair2020UPDATE.xlsx"
cube <- read.xlsx(inputFile, sheetIndex = 1)

# cube preprocessing
cube$Card <- as.character(cube$Name)
cube$ColorIdentity <- as.character(cube$Color)
cube$ColorIdentity[which(is.na(cube$ColorIdentity))] <- "C"

# make the packs
packList <- list()
nPacks <- 40

`%ni%` <- Negate(`%in%`) 
whites <- cube[sample(which(cube$ColorIdentity == "W")), ]
blues <- cube[sample(which(cube$ColorIdentity == "U")), ]
blacks <- cube[sample(which(cube$ColorIdentity == "B")), ]
reds <- cube[sample(which(cube$ColorIdentity == "R")), ]
greens <- cube[sample(which(cube$ColorIdentity == "G")), ]
rests <- cube[sample(which(cube$ColorIdentity %ni% c("W", "U", "B", "R", "G"))), ]

# initial 5 for each pack
for(i in 1:nPacks)
	packList[[i]] <- c(whites[i, "Card"], blues[i, "Card"], blacks[i, "Card"],
			reds[i, "Card"], greens[i, "Card"])

# take out the one per pack
whites <- whites[-(1:nPacks), ]
blues <- blues[-(1:nPacks), ]
blacks <- blacks[-(1:nPacks), ]
reds <- reds[-(1:nPacks), ]
greens <- greens[-(1:nPacks), ]

# make the rests
rests <- rbind.data.frame(rests, whites)
rests <- rbind.data.frame(rests, blues)
rests <- rbind.data.frame(rests, blacks)
rests <- rbind.data.frame(rests, reds)
rests <- rbind.data.frame(rests, greens)

rests <- rests[sample(1:nrow(rests)), ]
rests$ColorIdentity


# fill in packs
for(i in 1:nPacks) {
	packList[[i]] <- c(packList[[i]], 
			rests[1:4 + (i-1)*4, "Card"])
	packList[[i]] <- sample(packList[[i]])
}
	



