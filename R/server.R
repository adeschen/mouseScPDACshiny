
#' @title Server function
#' 
#' @description
#'  TOTO
#'  
#' @param input todo
#' @param output todo
#' @param session todo
#'  
#'  @return todo
#' 
#' @importFrom shiny observeEvent insertUI actionButton reactive renderPrint 
#' @importFrom shiny removeUI renderPlot
#' @importFrom grDevices colorRampPalette 
#' @importFrom stringr str_to_sentence str_trim str_split
#' @importFrom ggplot2 scale_size_area theme theme_bw aes ylab xlab guides
#' @importFrom ggplot2 margin guide_colourbar guide_legend element_blank ggsave
#' @importFrom ggplot2 scale_fill_gradientn ggplot geom_point element_text
#' @importFrom SummarizedExperiment rowRanges colData assays
#' @importFrom reshape2 melt
#' @importFrom rlang .data
#' @importFrom shinyjs show
#' @encoding UTF-8
#' @keywords internal
server <- function(input, output, session) {
    
    ## Create a reactive expression that retrieve the list of genes retained 
    ## to plot the graph
    dataInfoNEW <- reactive({
        toto <-  input$genes
        d <- str_to_sentence(unlist(
                        str_trim(unlist(str_split(input$genes, "\\s+")))))
        
        retained <- d[d %in% rowRanges(seAll)$gene_name]
        print("ALLO")
        ## At least one gene must be retained 
        if (length(retained) > 0) {
            output$foundGenes <-  renderPrint({paste(retained, sep=" ")})
            
            seAllSelected <- seAll[rowRanges(seAll)$gene_name %in% retained, ]
            print("ICI 1")
            ## At least one gene must be present in the dataset 
            if (nrow(seAllSelected) > 0) {
                
                meanT <- melt(assays(seAllSelected)$mean, value.name="Mean")
                colnames(meanT)[seq_len(2)] <- c("Ensembl", "Cluster")
                percentageT <- melt(assays(seAllSelected)$percentage, 
                                            value.name="Percentage")
                dataInfo <- cbind(meanT, Percentage=percentageT[, "Percentage"])
                dataInfo <- merge(dataInfo, 
                    as.data.frame(colData(seAllSelected))[, c("Cluster", 
                        "ClusterName")], by="Cluster")
                dataInfo <- merge(dataInfo, 
                    as.data.frame(rowRanges(seAllSelected))[, c("gene_id", 
                        "gene_name")], by.x="Ensembl", by.y="gene_id")
                dataInfo$ClusterName <- factor(dataInfo$ClusterName, 
                    levels=unique(dataInfo$ClusterName)[rev(order(
                            unique(dataInfo$ClusterName), decreasing=F))])
                
            print("ICI 2")
            print(dataInfo)
            
            print("ICI 3")
            return(dataInfo)
            } else {
                output$foundGenes <-  renderPrint({""})
                print("ICI 4")
                return(NULL)
            }
        } else {
            return(NULL)   
        }
    })
    
    observeEvent(input$run, {
        show("hidden-row")
        show("foundGenes")
        show("downloadGraph")
    })

    output$downloadGraph <- downloadHandler(
        filename = function() {
            paste("ElyadaDotPlot-", Sys.Date(), ".pdf", sep="")
        },
        content = function(file) {
            file.copy("plot.pdf", file, overwrite=TRUE)
        }, 
        contentType = "application/pdf"
    )
    
    
    output$plot <- renderPlot({
        # Take a dependency on input$run
        input$run
        
        if (input$run == 0)
            return()
        
        ## Generate dot plot graph
        isolate({
           graph <- createDotPlot(dataInfoNEW())
        })
        
        return(graph)
    })
}


