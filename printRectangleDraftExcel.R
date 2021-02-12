# set working directory (this needs to be set to wherever you have your .xlsx file
# note the R uses '/' for paths instead of '\'
# setwd("C:/Users/Jason/.architect/workspace/cube/rectangleGitHub")


# this script can be used for creating a rectangle draft in an Excel file
# which you can later upload to some Google Doc or whateer
source("packPrep.R")
outputFile <- "rectangleDraft.xlsx"

cards <- unlist(packList)





################################
# which packs to which players #
################################
# fill in your player names
players <- sample(c("Alex", "Barkley", "Charles", "Donathan", 
				"Emma", "Frida", "George", "Henry"))

for(i in 1:8) {
	
	offset <- (i - 1) * 45
	rectangle <- matrix(cards[1:45 + offset], nrow = 5, ncol = 9)
	
	
	write.xlsx(rectangle, file = outputFile, sheetName = players[i], col.names = FALSE, row.names = FALSE, 
			append = ifelse(i == 1, FALSE, TRUE))
	
}


















