library(ggplot2)
#' Create a scatter plot
#'
#' Creates a scatter plot with a given data, x, y and color/title/labels of your choice
#'
#' @param data A data frame
#' @param x A variable from the data param that you want to have on the x-axis
#' @param y A variable from the data param that you want to have on the y-axis
#' @param title A title for you plot
#' @param xlab A label for your x-axis
#' @param ylab A label for you y-axis
#' @param color The color you want your points to be
#'
#' @return A scatter ggplot
#' 
#' @export
#' @examples
#' data_frame <- tibble(x = c(1,2,3,4,5), y = c(5,6,7,8,9))
#' make_scater(data_frame, x, y, "My Scatter Plot", "X-axis", "Y-axis", "Blue")

make_scatter <- function(data, x, y, title, xlab, ylab, color) {
  g <- ggplot(data, aes(x = .data[[x]], y = .data[[y]])) +
  geom_point(color = color, alpha = 0.5) +
  #theme_minimal() +
  labs(x = xlab, y = ylab, title = title)
  
  return(g)
}

#' Create a bar plot
#'
#' Creates a bar plot with a given data, x, y and fill and title/labels you want
#'
#' @param data A data frame
#' @param x A variable from the data param that you want to have on the x-axis
#' @param y A variable from the data param that you want to have on the y-axis
#' @param title A title for you plot
#' @param xlab A label for your x-axis
#' @param ylab A label for you y-axis
#' @param fill The variable you the bars to fill to
#'
#' @return A bar ggplot
#' 
#' @export
#' @examples
#' data_frame <- tibble(x = c(1,2,3,4,5), y = c(5,6,7,8,9))
#' make_bar(data_frame, x, y, "My Bar Plot", "X-axis", "Y-axis", "Blue")

make_bar <- function(data, x, y, fill, title, xlab, ylab, xlabels) {
  g <- ggplot(data, aes(x = factor(.data[[x]]), y = .data[[y]], fill = factor(.data[[fill]]))) +
    geom_bar(stat = "identity", show.legend = FALSE) + 
    scale_x_discrete(labels = xlabels) + 
    labs(title = title, x = xlab, y = ylab) +
    theme(axis.text.x = element_text(angle = 70, vjust = 0.5))

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
#' save_plot("test_plot.png", directory, 10 )

save_plot <- function(name, output_file, width) {
  ggsave(name, path=output_file, width = as.numeric(width))
}


