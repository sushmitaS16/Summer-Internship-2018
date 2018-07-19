twoLines = function(s,t) {
	#the two required density plots tend to have the same xlim, so we'll fix that first
	#this xlim might vary from file to file
	print("The desired range for the x-axis: ")
	a = as.integer(readline(prompt = "Start: "))
	b = as.integer(readline(prompt = "End: "))

	#character vector formation
	s = s$GeneLength		#column name to be used for plotting from 1st file
	t = t$diff				#column name to be used for plotting from 2nd file
	
	#image file to be stored as
	jpeg(readline(prompt = "Name your jpeg file : "))

	#make the density plots
	par(mar=c(5,5,2,5))
	plot(density(s), main = readline(prompt = "Desired name for the histogram: "), xlab = readline(prompt = "Desired name for x-axis: "), ylab = NA, las = 1, col = 'slateblue', lwd = 2, xlim = c(a,b))
	par(new=TRUE)
	plot(density(t), main = "", xlab = NA, ylab = NA, axes = FALSE, col = 'red', lwd = 2, xlim = c(a,b))
	axis(side = 4, las = 1)
	mtext(side = 4, line = 4, 'Density')
	legend("topright", legend = c("Fly Transcriptome", "Atx-bound"), lty = c(1,1), cex = 0.8, col=c("slateblue", "red"))
	
	dev.off()			#image is stored in the working directory

	print("File saved!")

}

#take the files in
file1 = read.csv(readline(prompt = "Enter the 1st file : "), header=TRUE) 		#reference file preferred
file2 = read.csv(readline(prompt = "Enter the 2nd file : "), header=TRUE)

#call the function to make the plots
twoLines(file1, file2)