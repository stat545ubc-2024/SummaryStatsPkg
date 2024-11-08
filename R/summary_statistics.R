#' Summary Statistics for Specified Columns
#'
#' This function aids in quick data analysis by calculating the mean, median, standard deviation and count of all non-NA values present in specified columns of a dataframe.
#'
#' @param dataframe A dataframe which contains the data for the analysis. The parameter is called "dataframe" so that it is clear for the user that this is the dataset for which the summary statistics will be calculated.
#' @param columns A character vector of column names. These are the column/columns for which the summary statistics will be calculated.
#' @param na.rm A logical argument. If this is "TRUE", the function removes all "NA" values before calculating the summary statistics.
#' @return A dataframe which is populated by the calculated summary statistics including the columns: mean, median, standard deviation and count of non-NA values of the specified columns. In this dataframe, each row represents a column from the original dataframe and each column represents a particular summary statistic.
#' @importFrom stats median sd
#' @examples
#' # Example of using the summary_statistics of penguins from the palmerpenguins dataset.
#' library(palmerpenguins)
#' summary_statistics(penguins, columns = c("flipper_length_mm", "body_mass_g"))
#' @export
summary_statistics <- function(dataframe, columns, na.rm = TRUE) {
  #First, checking if the columns specified are present in the dataframe.
  if(!all(columns %in% names(dataframe))) {
    stop("One or more specified column/columns does not exist in the dataframe.")
  }
  # Checking to see if all specified columns are numeric
  if (!all(sapply(dataframe[columns], is.numeric))) {
    stop("All specified columns must be numeric.")
  }


  #Creating a list to store the summary statistics results.
  statistics_list <- lapply(columns, function(col) {
    #Calculating each summary statistic for the columns.
    col_data <- dataframe[[col]]
    mean_values <- mean(col_data, na.rm = na.rm)
    median_values <- median(col_data, na.rm = na.rm)
    standard_deviation_values <- sd(col_data, na.rm = na.rm)
    count_non_na <- sum(!is.na(col_data))

    # Returning the summary statistics as a vector.
    return(c(mean = mean_values, median = median_values, standard_deviation = standard_deviation_values, count = count_non_na))
  })

  # Converting this list of summary statistic results into a dataframe.
  statistics_df <- do.call(rbind, statistics_list)
  rownames(statistics_df) <- columns
  return(as.data.frame(statistics_df))
}
