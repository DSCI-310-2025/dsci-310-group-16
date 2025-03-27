library(ggplot2)
#' Create a scatter plot
#'
#' Creates a scatter plot with a given data, x, and y
#'
#' @param data A data frame
#' @param x A variable from the data param that you want to have on the x-axis
#' @param y A variable from the data param that you want to have on the y-axis
#'
#' @return A data frame with two columns.
#'   The first column (named class) lists the classes from the input data frame.
#'   The second column (named count) lists the number of observations
#'   for each class from the input data frame.
#'   It will have one row for each class present in input data frame.
#'
#' @export
#' @examples
#' data_frame <- tibble(x = c(1,2,3,4,5), y = c(5,6,7,8,9))
#' make_scater(data_frame, x, y)

make_scatter <- function(data, x, y, title, xlab, ylab, color) {
  g <- ggplot(data, aes(x = .data[[x]], y = .data[[y]])) +
  geom_point(color = color, alpha = 0.5) +
  labs(x = xlab, y = ylab, title = title)
  
  return(g)
}

#' Save a plot made
#'
#' Saves plot to a path, with a width and a name
#'
#' @param name the name you want your plot to be
#' @param output_file where the file should go
#' @param width the width of your plot
#'
#' @export
#' @examples
#' save_plot("test_plot.png", directory, 10)
save_plot <- function(name, output_file, width) {
  ggsave(name, path=output_file, width = as.numeric(width))
}


