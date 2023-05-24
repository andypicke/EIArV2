#' eia_get_routes
#'
#' @param api_key EIA API Key
#' @description
#' Return all available API 'routes'
#'
#' @return List of all available routes from EIA API
#'
#'


eia_get_routes <- function(api_key){
  api_base <- "https://api.eia.gov/v2/"
  complete_api_path <- paste0(api_base,'?api_key=',api_key)
  dat <- httr::GET(url=complete_api_path)
  dat2 <- jsonlite::fromJSON(httr::content(dat,"text"))
  # list all possible routes (ie datasets)
  return((dat2$response$routes$name))
}

