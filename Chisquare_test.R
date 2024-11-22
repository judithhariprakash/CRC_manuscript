data <-read.csv('S:/SCI-BIO-BRSDriveCircularVision/Judith/Projects/CRC/eccDNA/Bed_file_alleccDNA/AlleccDNAperChromosome_Chisquare_MBcorrected.tsv',sep='\t',row.names = 1)
head(data)

chi_square_results <- list()

# Loop through each row (sample) and perform the chi-square test
for (i in 1:nrow(data)) {
  observed <- as.numeric(data[i, ])  # Observed eccDNA counts for the sample
  expected <- rep(sum(observed) / length(observed), length(observed))  # Expected (uniform)
  
  # Perform the chi-square test
  test <- chisq.test(observed, p = expected / sum(expected))
  
  # Store the chi-square statistic and p-value
  chi_square_results[[rownames(data)[i]]] <- list(statistic = test$statistic, p_value = test$p.value)
  print (rownames(data)[i])
  print (test)
}

# Convert the results into a dataframe
chi_square_results_df <- do.call(rbind, lapply(chi_square_results, as.data.frame))
print(chi_square_results_df)



get_residuals <- function(data) {
  expected <- rep(mean(data), length(data))  # Uniform expectation
  chisq_result <- chisq.test(data, p = expected / sum(expected))
  return(chisq_result$residuals)  # Extract the residuals
}

# Step 3: Apply the function to each row (i.e., each sample) and create a dataframe of residuals
residuals_df <- as.data.frame(t(apply(data, 1, get_residuals)))

# Step 4: Name the columns of the residuals dataframe to match the chromosome names
colnames(residuals_df) <- colnames(data)

# Step 5: View the resulting dataframe
print(residuals_df)

write.csv(residuals_df, 'S:/SCI-BIO-BRSDriveCircularVision/Judith/Projects/CRC/eccDNA/Chisquare_residuals_MBcorrected.csv')
