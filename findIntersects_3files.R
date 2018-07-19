#this file considers all the possible splice variants also
file1 = read.csv(readline(prompt = "Enter the 1st file : "), header=TRUE)
file2 = read.csv(readline(prompt = "Enter the 2nd file : "), header=TRUE)

#storing the coordinates and related information in variables
site1 = file1$editCoord
site2 = file2$editCoord

#create an empty result table where we'll be storing out results
res = data.frame(chromosome = character(), editCoord = numeric(), geneName = character(), editPercent1 = numeric(), editPercent2 = numeric(), editPercent3 = numeric() )

file1_length = length(site1)
file2_length = length(site2)

for (i in 1:file1_length) {
	for (j in 1:file2_length) {
		#to check if site1[[i]] lies in site2
		if ((site1[[i]] == site2[[j]])) {
			res = rbind(res, data.frame(chromosome = file2$chromosome[[j]], editCoord = site2[[j]], geneName = file2$geneName[[j]], editPercent1 = file1$editPercent_1[[i]], editPercent2 = file1$editPercent_2[[i]], editPercent3 = file2$editPercent_2[[j]]))	
		} else {
					next
		}
	}
}

name = readline(prompt = "Name your csv file : ")
write.csv(res, file = name)
