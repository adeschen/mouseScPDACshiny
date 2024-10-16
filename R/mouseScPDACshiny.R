#' mouseScPDACshiny: Interactive Generator of Dot Plot using Elyada 
#' et al 2019 mouse KPC Single-Cell Dataset
#'
#' This package provides a graphical user interface (GUI) to generate 
#' a dot plot showing the mean expression and ratio of cell expressing  
#' genes selected by user. The data is from Elyada et al. 2019 mouse KPC 
#' single-cell dataset. 
#' 
#' @docType package
#'
#' @name mouseScPDACshiny-package
#'
#' @aliases mouseScPDACshiny-package mouseScPDACshiny
#' @source 
#' 
#' Elyada E. et al. Cross-Species Single-Cell Analysis of Pancreatic Ductal 
#' Adenocarcinoma Reveals Antigen-Presenting Cancer-Associated Fibroblasts. 
#' Cancer Discov. 2019 Aug;9(8):1102-1123. doi: 10.1158/2159-8290.CD-19-0094. 
#' Epub 2019 Jun 13. PMID: 31197017; PMCID: PMC6727976.
#' 
#' @author  Astrid Deschênes
#' 
#' Maintainer:
#' Astrid Deschênes <adeschen@hotmail.com>
#' 
#' @encoding UTF-8
#' 
#' @seealso
#' \describe{
#' \item{\code{\link{startApp}}}{ for launching an interactive session}
#' }
#' 
"_PACKAGE"



#' This dataset contains the information from the Elyada et all 2019 mouse 
#' single-cell KPC dataset. The information is stored in a 
#' \code{SummarizedExperiment} with one \code{assays} containing the mean 
#' expression per cluster for each gene and a second  \code{assays} containing 
#' the percentage of cells with expression per cluster for each gene. 
#'
#' @name seAll
#'
#' @docType data
#'
#' @aliases seAll
#'
#' @format The \code{SummarizedExperiment} with one \code{assays} containing 
#' the mean expression per cluster for each gene and a second  \code{assays} 
#' containing the percentage of cells with expression per cluster for each 
#' gene.
#'
#' @return  The \code{SummarizedExperiment} with one \code{assays} containing 
#' the mean expression per cluster for each gene and a second  \code{assays} 
#' containing the percentage of cells with expression per cluster for each 
#' gene.
#'
#' @seealso
#' \describe{
#' \item{\code{\link{startApp}}}{ for launching an interactive session}
#' }
#'
#' @usage data(seAll)
#'
#' @keywords datasets
#'
#' @examples
#' 
#' ## Load dataset
#' data(seAll)
#' 
#' if (required(SummarizedExperiment)) {
#'     ## Load required library
#'     library(SummarizedExperiment)
#'     
#'     ## Mean expression of the 3 first genes (rows) in each cluster (columns)
#'     assays(seAll)$mean[1:3, ]
#' }
#' 
#'
NULL