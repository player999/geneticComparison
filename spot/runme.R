#!/usr/bin/Rscript
library("SPOT")
library("functional")
create_config_ga <- function(runs=10, nargs=2, tfunction="F15", delta=1e-3, sigma=1e-3, population=100, mutation_rate=0.02, mutation_percentage=0.3, max_evals=50000, algo="algorithm2")
{
	template <- readChar("config.tmp",nchars=1e4);
	template <- gsub("%NARGS%", nargs, template);
	template <- gsub("%ALGORITHM%", algo, template);
	template <- gsub("%TEST_FUNCTION%", tfunction, template);
	template <- gsub("%RUNS%", runs, template);
	template <- gsub("%SIGMA%", sigma, template);
	template <- gsub("%DELTA%", delta, template);
	template <- gsub("%POPULATION%", population, template);
	template <- gsub("%MUTATION_RATE%", mutation_rate, template);
	template <- gsub("%MUTATION_PERCENTAGE%", mutation_percentage, template);
	template <- gsub("%MAX_EVALS%", max_evals, template);
	fileConn<-file("config.m")
	writeLines(template, fileConn)
	close(fileConn)
}

read_results_ga <- function()
{
	result <- read.table("res.txt")
	return(result[1, "V1"])
}

function_ga <- function(args)
{	
	results = c()
	for(i in 1:nrow(args))
	{
		print("Execute")
		create_config_ga(runs=10, nargs=2, tfunction="F15", delta=args[i, 1], sigma=args[i, 2], population=100, mutation_rate=0.02, mutation_percentage=0.3, max_evals=50000, algo="algorithm2")
		system("/usr/local/MATLAB/R2015b/bin/matlab -nosplash -nodesktop -wait -r 'runme; exit;'", intern = TRUE)
		results <- c(results, -read_results_ga())
	}
	return(results)
}

res <- spot(, function_ga, c(1e-5, 1e-5), c(1e-2, 1e-2))
#res <- spot(, f_test, c(1e-5, 1e-5), c(1e-2, 1e-2))
print(res)

