
#' @title Start the shiny application
#' 
#' @description This function starts the mouseKPCscElyada2019shiny shiny 
#' application.
#' 
#' @param ... todo
#' 
#' @return An object that represents the shiny application. Printing the 
#' object or passing it to \code{runApp()} will run the application.
#' 
#' @examples 
#' 
#' ## Required library 
#' library(shiny)
#' 
#' ## Only run this example in interactive R sessions
#' if (interactive()) {
#'     app <- startApp()
#'     runApp(app)
#' }
#' 
#' ## Another way to start the application
#' ## Only run this example in interactive R sessions
#' if (interactive()) {
#'     startApp()
#' }
#' 
#' @importFrom shiny shinyApp
#' @author Astrid Deschênes
#' @encoding UTF-8
#' @export
startApp <- function(...) {
    
  shinyApp(ui=createUI(), server=server, ...)
}


