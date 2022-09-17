xBarAndS <- function(data, runVar, response, sigma=3){

  # Convert each column to a list, then fix the names
  x_list <- list(eval(substitute(data$response), data, parent.frame()))
  names(x_list) <- as.character(substitute(response))

  by_list <- list(eval(substitute(runVar), data, parent.frame()))
  names(by_list) <- as.character(substitute(runVar))

  # do.call is needed to expand the dataframe
  dataSumm <- do.call(
    data.frame,
    aggregate(

      x=x_list,

      by=by_list,

      FUN= function(x) (
        c(mean=mean(x, na.rm=T),
          sd = sd(x, na.rm=T),
          count = length(x))
      )

    )
  )

  # now find overall mean of response variable
  dataSumm$processMean <-
    mean(dataSumm[,paste0(substitute(response), ".mean")], na.rm=T)

  # and the mean of the standard deviations
  dataSumm$processSD <-
    mean(dataSumm[,paste0(substitute(response), ".sd")], na.rm=T)

  return(dataSumm)

}
