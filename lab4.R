falines <- readLines("Osativa_323_v7.0.protein.fa")
header_lines <- grep("^>", falines)
headers <- falines[header_lines]

# number of sequences
nseq <- length(headers)
# vector to contain protein sequences
protein_seq <- character(nseq)
# loop through and concatenate each sequence
for(i in 1:nseq){
  firstlinenum <- header_lines[i] + 1
  if(i == nseq){
    lastlinenum <- length(falines)
  } else {
    lastlinenum <- header_lines[i + 1] - 1
  }
  these_seq_lines <- falines[firstlinenum:lastlinenum]
  protein_seq[i] <- paste(these_seq_lines, collapse = "")
}
# view the results
protein_seq[1:5]
all(grepl("^M.*\\*$", protein_seq))
rm(falines, firstlinenum, header_lines, i, lastlinenum, these_seq_lines)


deflines <- read.table("Osativa_323_v7.0.defline.txt", sep = "\t",
                       stringsAsFactors = FALSE, header = FALSE)

transcriptID <- vector()
headers2 <- strsplit(headers, split = " ")
for(i in 1:length(headers2)){
  temphead <- gsub(">", "", headers2[[i]][1])
  transcriptID[i] <- temphead
}


zn_fing_index <- grep("..C(.{2}|.{4})C.{12}H(.{3}|.{4}|.{5})H", protein_seq)
