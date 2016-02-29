#' Import Pictures of Copper
#'
#' This function allows you to get a lovely dose of Copper when R is not working
#' @keywords Copper
#' @export
#' @examples
#' get_coppeR()

get_coppeR <- function(x) {

  # listing files from GitHub repository
  req <- httr::GET("https://api.github.com/repos/padpadpadpad/CoppeR/contents/data")
  httr::stop_for_status(req)

  # list of files
  filelist <- unlist(lapply(httr::content(req), "[[", "download_url"), use.names = T)

  # pick a random number
  pic.num <- sample(1:length(filelist), 1)

  # read in file - create a temporary file then delete it
  temp <- tempfile()
  utils::download.file(filelist[pic.num], temp, mode="wb", quiet = TRUE)
  file <- jpeg::readJPEG(temp, native = T)
  file.remove(temp)

  # read file in
  file <- jpeg::readJPEG(no.of.pics[pic.num], native = T)

  # get the resolution
  res <-  dim(file)[1:2]
  res <- res*2

  # plot
  par(mar=c(0.1,0.1,0.1,0.1))
  plot(0, 0 ,xlim=c(1,res[1]),ylim=c(1,res[2]),asp=1,type='n',xaxs='i',yaxs='i',xaxt='n',yaxt='n',xlab='',ylab='',bty='n')
  rasterImage(file,0,0,res[1],res[2])
}
