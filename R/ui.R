#' @title Define the user interface (UI)
#' 
#' @description
#' todo
#' 
#' @return a user interface (UI) definition that can be passed to 
#' the \code{shinyUI} function.
#' 
#' @examples 
#' 
#' ## todo
#' 
#' @author Astrid Deschênes
#' @encoding UTF-8
#' @importFrom shiny fluidPage h2 div textAreaInput actionButton h3 
#' @importFrom shiny verbatimTextOutput plotOutput
#' @importFrom htmltools br h2 div h3 strong
#' @importFrom bslib nav_panel page_navbar nav_spacer
#' @importFrom shinyjs useShinyjs
#' @keywords internal
createUI <- function() {
    
    page_navbar(
        title = "clustered Dotplot for single-cell RNAseq",
        bg = "#36648b",
        underline = TRUE,
        selected = "dotplot",
        nav_panel(title="Dotplot", createUIDotplotPanel(), value="dotplot"),
        nav_panel(title="Reference", createUIReferencePanel(), value="ref"))
}


#' @title Define the user interface (UI) panel for the dot plot section
#' 
#' @description
#' todo
#' 
#' @return a user interface (UI) definition that can be passed to 
#' the \code{shinyUI} function.
#' 
#' @examples 
#' 
#' ## todo
#' 
#' @author Astrid Deschênes
#' @encoding UTF-8
#' @importFrom shiny fluidPage h2 div textAreaInput actionButton h3 
#' @importFrom shiny verbatimTextOutput plotOutput downloadButton
#' @importFrom htmltools br h2 div h3 strong
#' @importFrom shinyjs useShinyjs
#' @keywords internal
createUIDotplotPanel <- function() {
    
    fluidPage(
        useShinyjs(),
        h1(div(strong("Elyada et al. 2019"), 
            style="text-align:center;color:#36648b")),
       ## h2(div("Dot plot using mouse KPC single-cell", 
        ##    style="text-align:center;color:#36648b")),
        br(),
  
        textAreaInput("genes", "Input list of genes (space or tab separated)", 
                value="Cdkn2a KRAS \nMYC", rows = 3),
        actionButton("run", "Run query", class="btn-danger"),
        br(),
        br(),
        fluidRow(column(width = 12, 
            hidden(h4(div("Found genes", 
                                 style = "color:steelblue2"))))),
                                       
    ## h4(div("Found genes", style = "color:steelblue2")),
    hidden(
        verbatimTextOutput("foundGenes")),
        plotOutput(
            outputId="plot",
            width = "100%",
            height = "400px",
            click = NULL,
            dblclick = NULL,
            hover = NULL,
            brush = NULL,
            inline = FALSE
        ),
        fluidRow(column(width = 12, hidden(downloadButton("downloadGraph", 
                label="Download Graph", class="btn-block"))))
    )
}


#' @title Define the user interface (UI) panel for the dot plot section
#' 
#' @description
#' todo
#' 
#' @return a user interface (UI) definition that can be passed to 
#' the \code{shinyUI} function.
#' 
#' @examples 
#' 
#' ## todo
#' 
#' @author Astrid Deschênes
#' @encoding UTF-8
#' @importFrom shiny fluidPage h2 div textAreaInput actionButton h3 
#' @importFrom htmltools br h2 div h3 strong p
#' @keywords internal
createUIReferencePanel <- function() {
    
    fluidPage(
        h2(div(strong("Elyada et al. 2019"), 
               style="text-align:center;color:#36648b")),
        br(),
        p(paste0("Elyada E et al. Cross-Species Single-Cell Analysis ", 
            "of Pancreatic Ductal Adenocarcinoma Reveals Antigen-Presenting ", 
            "Cancer-Associated Fibroblasts. Cancer Discov. ", 
            "2019 Aug;9(8):1102-1123. doi: 10.1158/2159-8290.CD-19-0094. ", 
            "Epub 2019 Jun 13. PMID: 31197017; PMCID: PMC6727976."))
    )
}

#' @title Create the download section of the user interface (UI)
#' 
#' @description
#' todo
#' 
#' @return a section of an user interface (UI) definition that can be passed to 
#' the \code{shinyUI} function.
#' 
#' @examples 
#' 
#' ## todo
#' 
#' @author Astrid Deschênes
#' @encoding UTF-8
#' @importFrom shinyjs hidden
#' @keywords internal
ui_download <- function() {
    fluidRow(column(width = 12, hidden(downloadButton("downloadGraph", 
        label="Download Graph", class="btn-block"))))
}
