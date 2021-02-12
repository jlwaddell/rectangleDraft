# set working directory (this needs to be set to wherever you have your .xlsx file
# note the R uses '/' for paths instead of '\'
# setwd("C:/Users/Jason/.architect/workspace/cube/rectangleGitHub")


# this script can be used for creating a rectangle draft on the RiptideLab forums (so that you can use card images)
# feel free to make threads in the following subforum: https://riptidelab.com/forum/forums/forum-games.27/
source("packPrep.R")
outputFile <- "riptideForumDraft.txt"

cards <- unlist(packList)





printRectangle <- function(cards, utilityLands, players, i, outputFile) {
	
	offset <- (i - 1) * 45
	
	cat("[spoiler=\"Rectangle ", LETTERS[i], ": ", players[i],   "\"]\n",
			sep="", file=outputFile, append=TRUE)
	
	# print the packs
	for(k in 1:5) {
		cat("[ci=small]\n", sep="", file=outputFile, append=TRUE)
		for(j in 1:9) {
			cat(cards[offset + j], "\n", sep="", file=outputFile, append=TRUE)
		}
		cat("[/ci]\n\n",
				sep="", file=outputFile, append=TRUE)
		offset <- offset + 9
	} 
	
	
	cat("[/spoiler]\n \n",
			sep="", file=outputFile, append=TRUE)
}


################################
# which packs to which players #
################################
cat("8p Rectangle Draft", "\n", "\n", file=outputFile)

# fill in your player names
players <- sample(c("Alex", "Barkley", "Charles", "Donathan", 
				"Emma", "Frida", "George", "Henry"))

for(i in 1:8) {
	printRectangle(cards, utilityLands, players, i, outputFile = outputFile)
}


















