xBarAndS <- function(data, runVar, response, sigma=3){

  # This function needs to keep variable names.

  # do.call is needed to expand the dataframe
  dataSumm <- do.call(
    data.frame,
    aggregate(
      x=eval(substitute(response), data),
      by=list(eval(substitute(runVar), data)),
      FUN= function(x) (
        c(mean=mean(x, na.rm=T),
          sd = sd(x, na.rm=T),
          count = length(x))
      )

    )
  )

    dataSumm <- transform(
      dataSumm,
      processMean = mean(x.mean, na.rm=T),
      processSD = mean(x.sd, na.rm=T)
      )

    return(dataSumm)

}




xBarAndS <- function(data, runVar, response, sigma=3){

  # This function doesn't know how to handle the names...

  dataSumm <- dplyr::group_by(data, {{runVar}})

  dataSumm <- dplyr::summarise(
    dataSumm,
    "{{response}}_mean" := mean({{response}}, na.rm=T),
    "{{response}}_sd" := sd({{response}}, na.rm=T),
    "{{response}}_n" := length({{response}})
  )

  dataSumm <- dplyr::ungroup(dataSumm)

  return(dataSumm)

}

lithograph |>
  xBarAndS(CASSETTE, LINEWIDT)
