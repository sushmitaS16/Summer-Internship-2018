exactIntersects = function(file1, file2) {

	#storing the coordinates and related information in variables
	site1 = file1$end
	site2 = file2$end

	#create an empty result table where we'll be storing out results
	res = data.frame(chromosome = character(), editCoord = numeric(), geneName = character(), editPercent_1 = numeric(), editPercent_2 = numeric() )

	file1_length = length(site1)
	file2_length = length(site2)

	for (i in 1:file1_length) {
		for (j in 1:file2_length) {
			#to check if site1[[i]] lies in site2
			if (site1[[i]] == site2[[j]]) {
				res = rbind(res, data.frame(chromosome = file2$chromosome[[j]], editCoord = site2[[j]], geneName = file2$gene[[j]], editPercent_1 = file1$editPercent[[i]], editPercent_2 = file2$editPercent[[j]]))	
			} else {
						next
			}
		}
	}

	return(res)

}

rangedIntersects = function(file1, file2) {

	#storing the coordinates and related information in variables
	site1 = file1$end
	site2 = file2$end

	#create an empty result table where we'll be storing out results
	res = data.frame(chromosome1 = character(), chromosome2 = character(), editCoord1 = numeric(), editCoord2 = numeric(), geneName1 = character(), geneName2 = character(), editPercent1 = numeric(), editPercent2 = numeric() )

	file1_length = length(site1)
	file2_length = length(site2)

	for (i in 1:file1_length) {
		for (j in 1:file2_length) {

			down = (site2[[j]] - 50)
			up = (site2[[j]] + 50)

			#to check if site1[[i]] lies in site2
			if (site1[[i]] == site2[[j]] | ((site1[[i]] > down) & (site1[[i]] < up))) {
				res = rbind(res, data.frame(chromosome1 = file1$chromosome[[i]], chromosome2 = file2$chromosome[[j]], editCoord1 = site1[[i]], editCoord2 = site2[[j]], geneName1 = file1$gene[[i]], geneName2 = file2$gene[[j]], editPercent1 = file1$editPercent[[i]], editPercent2 = file2$editPercent[[j]]))	
			} else {
						next
			}
		}
	}

	return(res)

}

#cd /path/to/directory
f1 = read.csv(readline(prompt = "Enter the 1st file : "), header=TRUE)
f2 = read.csv(readline(prompt = "Enter the 2nd file : "), header=TRUE)

#ask user what output he needs
output = readline(prompt = "Want to get exact intersects? (Y/N) : ")

if (output == "Y" | output == "yes" | output == "Yes" | output == "y") {
	result = exactIntersects(f1, f2)

} else if (output == "N" | output == "no" | output == "No" | output == "n") {
	result = rangedIntersects(f1, f2)

} else {
	print("Error input!")
}


#outputs a csv file containing the common editing sites of two RBPs (pairwise comparison)
name = readline(prompt = "Name your csv file : ")
write.csv(result, file = name)