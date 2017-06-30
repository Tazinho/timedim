#' Illustration of time_spread
#'
#' gather time dimension
#'
#' @param .data a tibble containing an id and dates
#'
#' @return a data frame with min and max date for each id
#'
#' @importFrom dplyr "%>%"
#'
#' @export

time_spread <- function(.data){
  .data %>% group_by(id) %>% 
    summarise(d_min = min(dates), d_max = max(dates))
}