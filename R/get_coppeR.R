#' Import Pictures of Copper
#'
#' This function allows you to get a lovely dose of Copper when R is not working
#' @keywords Copper
#' @export
#' @examples
#' get_coppeR()

get_coppeR <- function(x) {
  # list files in /data folder
  no.of.pics <- list.files('data', full.names = T)

  # pick a random number
  pic.num <- sample(1:length(no.of.pics), 1)

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
