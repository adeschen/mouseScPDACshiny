#' @title Create Dot Plot
#' 
#' @description
#' todo
#' 
#' @return a todo
#' 
#' @examples 
#' 
#' ## Create data frame containing required information to generate graph
#' dataInfo <- data.frame(gene_name=c(rep("Myc", 4), rep("Kras", 4)), 
#'     Mean=c(0.349, 0.232, 0.052, 0.0634, 0.1607, 0.5099, 0.1860, 0.1325), 
#'     Percentage=c(45.85, 45.02, 7.07, 7.64, 31.87, 70.76, 17.17, 19.74),
#'     ClusterName=rep(c("Fibroblasts", "EMT-like Cells", 
#'                       "T and NK Cells", "Myeloid Cells"), 2),
#'     stringAsFactor=FALSE)
#'     
#' ## Create Dot Plot
#' dplot <- createDotPlot(currentData=dataInfo)   
#' print(dplot)
#'                   
#' @author Astrid Deschênes
#' @encoding UTF-8
#' @importFrom grDevices colorRampPalette 
#' @importFrom ggplot2 scale_size_area theme theme_bw aes ylab xlab guides
#' @importFrom ggplot2 margin guide_colourbar guide_legend element_blank ggsave
#' @importFrom ggplot2 scale_fill_gradientn ggplot geom_point element_text
#' @importFrom SummarizedExperiment rowRanges colData assays
#' @keywords internal
createDotPlot <- function(currentData) {
    if (!is.null(currentData)) {
        dotplot <- ggplot(currentData, aes(x=.data$gene_name, 
                                                y=.data$ClusterName)) +
            geom_point(aes(size=.data$Percentage, fill=.data$Mean), shape=21, 
                            colour="gray25", stroke=1.5, alpha=0.9) +
            scale_fill_gradientn(
                colours=colorRampPalette(c("antiquewhite", "darkorange", 
                                                            "darkred"))(100),
                                 limits=c(0, max(currentData$Mean))) + 
            ylab(NULL) + xlab(NULL) +
            scale_size_area(max_size=10, minor_breaks=c(0, 10, 20)) +
            theme_bw() +
            theme(axis.text.x = element_text(size=14, angle=45, 
                                    hjust=1, face="bold", color="black"),
                  axis.text.y = element_text(size=12, face="bold", 
                                    color="black"),
                  legend.title = element_text(size=12, face="bold", 
                                    color="black"),
                  legend.box="vertical",
                  legend.box.margin = margin(t=0, r=5, l=5, b=0, unit="pt"),
                  legend.text = element_text(size=10), 
                                    panel.grid.major=element_blank(),
                  legend.position = "right",
                  legend.box.just = "center",
                  legend.direction = "horizontal")  +
            guides(fill=guide_colourbar(title.position="top", 
                        title="Mean expression\nin group",
                        title.hjust=0.5, title.vjust=0.5,
                        frame.colour="gray25", ticks.colour="gray25"),
                   size = guide_legend(title.position="top",  
                        title="Expressing cells\nin group (%)",
                        title.hjust=0.5, title.vjust=0.5, nrow=5, byrow=TRUE))
        
        ggsave("plot.pdf", dotplot)
        return(dotplot)
    } 
    return()
}