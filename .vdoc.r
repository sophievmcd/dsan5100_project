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
#
#

data_info <- function(filename){
    df <- read.csv(filename)
    cat("FILE:", filename, "\n" )
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

    return(df)

}#END data

df_1718 <- data_info("data/sports_expend_data/1718_sports_expenditures.csv")
df_1819 <- data_info("data/sports_expend_data/1819_sports_expenditures.csv")
df_1920 <- data_info("data/sports_expend_data/1920_sports_expenditures.csv")
df_2021 <- data_info("data/sports_expend_data/2021_sports_expenditures.csv")
df_2122 <- data_info("data/sports_expend_data/2122_sports_expenditures.csv")


#
#
#
#
#
#
library(dplyr)
correct_names <- read.csv("Name_Standardizations.csv")
dim(correct_names)

update_names <- function(df, new_names=correct_names){
    merged <- merge(correct_names, df, by = "school_name", all.x=TRUE)
    merged$school_name <- NULL
    merged$my_id.y <- NULL
    names(merged)[names(merged) == "financial.name"] <- "school_name"
    return(merged)
}

new_1718 <- update_names(df_1718)
new_1819 <- update_names(df_1819)
new_1920 <- update_names(df_1920)
new_2021 <- update_names(df_2021)
new_2122 <- update_names(df_2122)


#
#
#
unmatched <- setdiff(df_1819$school_name, correct_names$school_name)
print(unmatched)

#
#
#
