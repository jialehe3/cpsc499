geno_tab <- read.table("Msinensis_chr01genes_filtered.vcf", header = TRUE, sep = "\t", 
                       stringsAsFactors = FALSE, comment.char = "", skip = 12)

testvect <- geno_tab[1:30,12]

# can also use "[[", 1 & 3
convert_column <- function(x){
  part1 <- strsplit(x,split="")
  part2 <- as.numeric(lapply(part1, "[[", 1))
  part3 <- as.numeric(lapply(part1, "[[", 3))
  part4 <- part2 + part3
  return(part4)
}
convert_column(testvect)

numbers<- apply(geno_tab[10:ncol(geno_tab)], 2, convert_column)
geno_tab3 <- cbind(geno_tab[1:5],numbers)
geno_tab3[1:10,1:8]


geno_mat <- as.matrix(geno_tab[,-(1:9)])
geno_mat[,1][1:10]

convert_matrix <- function(x){
  part1 <- 
}