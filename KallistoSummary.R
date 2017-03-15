#This is a script to compile all of the kallisto expression data for the various tissues

#First let's read in the individual results files and give them useful names
Leaf <- read.csv("~/Downloads/TGACCA abundance.tsv", header=TRUE, sep="")
Inflor <- read.csv("~/Downloads/ACAGTG abundance.tsv", header=TRUE, sep="")
Fruit <- read.csv("~/Downloads/CAGATC abundance.tsv", header=TRUE, sep="")
DPA3 <- read.csv("~/Downloads/3DPA abundance.tsv", header=TRUE, sep="")
DPA0 <- read.csv("~/Downloads/0DPA abundance.tsv", header=TRUE, sep="")

#subset the data by the FUL genes
toMatch <- c("g28929", "g39464", "g07845", "MBP20")
expLeaf <- Leaf[grep(paste(toMatch,collapse="|"), Leaf$target_id),]
expInfor <- Inflor[grep(paste(toMatch,collapse="|"), Inflor$target_id),]
expFruit <- Fruit[grep(paste(toMatch,collapse="|"), Fruit$target_id),]
exp3DPA <- DPA3[grep(paste(toMatch,collapse="|"), DPA3$target_id),]
exp0DPA <- DPA0[grep(paste(toMatch,collapse="|"), DPA0$target_id),]

#Make a df to hold the summary
Results <- data.frame(row.names=c("NoMBP10", "NoFUL2", "NoMBP20","NoFUL1"))
Results$Leaf <- cbind(expLeaf$tpm)
Results$Inflorescence <- cbind(expInfor$tpm)
Results$Fruit <- cbind(expFruit$tpm)
Results$DPA3 <- cbind(exp3DPA$tpm)
Results$DPA0 <- cbind(exp0DPA$tpm)

#Sort the Names of the genes
Results <- Results[order(row.names(Results)),]

