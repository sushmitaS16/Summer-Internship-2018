#for comparing the targets of the RBPs with the reference (fly transcriptome)
siteModification = function(targetFile) {
	
	transcriptome = read.csv(readline(prompt = "Enter the transcriptome file : "))
	
	#transcriptome file will have start and end coordinates for each of the genes
	#targetFile, obtained from TRIBE analysis will only have a particular edit coordinate for the RBP
	#for making the two files similar, we assign a start cordinate to the targetFile

	start = (targetFile$co.ordinate - 1)
	res = cbind(targetFile, start)
	return(res)

}

#cd /path/to/directory
file = read.csv(readline(prompt = "Enter the file to be compared : "))
result = siteModification(file)

#save in the csv format
name = readline(prompt = "Enter the filename to be saved : ")
write.csv(result, file = name)

##shell scripts available for converting bedfiles to csv and vice versa
##bedtools.sh used for the comparison