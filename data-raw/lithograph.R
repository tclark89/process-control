## code to prepare `lithograph` dataset goes here

# LITHOGRA.DAT ####
# The width of a line on a silicon wafer
fileLitho <- readr::read_file("https://www.itl.nist.gov/div898/handbook/datasets/LITHOGRA.DAT")

lithograph <-
  subset(
    readr::read_fwf(
      fileLitho,
      col_positions = readr::fwf_widths(
        c(7, 7, 7, 12, 7, 12),
        col_names=c("CASSETTE", "WAFER", "SITE", "LINEWIDT", "RUNSEQ","LINEWIDT_2")
      ),
      skip=25
    ) ,
    select = -LINEWIDT_2)

usethis::use_data(lithograph, overwrite = TRUE)
