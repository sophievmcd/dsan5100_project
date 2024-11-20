#
#
#
#
#
#
#
#
#
#
#
#
#
#
#

data_info <- function(filename){
    df <- read.csv(filename)
    cat("File:", filename, "\n" )
    cat("Dimensions", dim(df), "\n" )
    
    na_col_count <- sapply(df, function(x) sum(is.na(x)))
    na_table <- data.frame(Column = names(na_col_count), NA_Count=na_col_count)
    #print("NA Counts:")
    #print(na_table) 
    total_na <- sum(na_col_count)
    cols_with_na <- names(na_col_count[na_col_count>0])
    cat("Found", total_na, "NA values.\n")
    if(length(cols_with_na)>0){
        cat("Columns with NA values:", paste(cols_with_na, collapse = ", "), "\n")
    }

}#END data

data_info("data/1718_sports_expenditures.csv")
data_info("data/1819_sports_expenditures.csv")
data_info("data/1920_sports_expenditures.csv")
data_info("data/2021_sports_expenditures.csv")
data_info("data/2122_sports_expenditures.csv")





#
#
#
