#' Illustration of time_gather
#'
#' gather time dimension
#'
#' @param .data a tibble containing d_min and d_max date columns
#' @param by a string containing the timestep, "year", "month", "day"
#'
#' @return a long data frame with a dates column
#'
#' @importFrom dplyr "%>%"
#'
#' @export

time_gather <- function(.data, by){
  .data %>% dplyr::mutate(dates = purrr::map2(d_min, d_max, ~ seq(.x, .y, by = by))) %>%
    dplyr::select(-d_min, -d_max) %>% 
    tidyr::unnest()
}

# df_wide <- tibble(id = letters[1:3],
#                   d_min = ymd("1970-01-01", "1970-02-01", "1970-03-01"),
#                   d_max = ymd("1970-03-01", "1970-02-01", "1970-06-01"))

# df_long <- time_gather(.data = df_test, by = "day")
# df_long