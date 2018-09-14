# lecture 2
distconv <- function(mile, nautical = FALSE){
  if (is.numeric(mile) == FALSE){
    stop("numeric data needed")}
  if (nautical == TRUE){
    convert <- mile * 1.85
    return(convert)
  } else {
  convert <- mile * 1.61
  return(convert)
  }
}


# lab2.1
samtab <- read.table("Lab2_example_align.sam", sep = "\t", comment.char = "@",
                     stringsAsFactors = FALSE, fill = TRUE)
unique(samtab$V2)

interpret_flag <- function(flag){
  if(any(flag != 0 & flag!= 4 & flag!= 16) == TRUE){
# !all(flag %in% c(0,4,16))

    stop("value found not equal to 0, 4 or 16")
  }
    flag <- as.character(flag)
    flag1 <- replace(flag, flag == "0", "top")
    flag2 <- replace(flag1, flag1 == "4", "unaligned")
    flag3 <- replace(flag2, flag2 == "16", "bottom")
    result <- flag3
    return(result)
  }


intp_flag <- interpret_flag(samtab$V2)
samtab1 <- cbind(samtab, intp_flag)

# lab 2.2
filter_by_loc <- function(file, chr, start, end, minQual = 20){
  if (start > end){
    stop("Starting position comes after ending position.")
  }
  filter <- which(file[,3] == chr & end >= file[,4]& start <= file[,4] & file[,5] >= minQual)
  result <- file[filter,]
  sort <- dplyr::arrange(result,V4)
  return(sort)
  }


# lab 2.3
filter_by_len <- function(tab, minlen = 80){
  newtab <- tab[nchar(tab$V10) >= minlen,]
  return(newtab)
}

