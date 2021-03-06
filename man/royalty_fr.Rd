% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/royalty_fr.R
\name{royalty_fr}
\alias{royalty_fr}
\title{Functional redundancy via Contribution Evenness}
\usage{
royalty_fr(abundance.matrix, trait.matrix, q = 0.5)
}
\arguments{
\item{abundance.matrix}{A traditional taxa abundance matrix. Rows correspond to different samples and columns correspond to different taxa.}

\item{trait.matrix}{#A matrix corresponding to traits within taxa. Columns correspond to traits while rows correspond to taxa}

\item{q.range}{The diversity order to evaluate. The default setting evaluates diversity orders 0 through 2.}
}
\value{
Returns a list, where individual elements correspond to samples in the abundance matrix. The list includes an estimate of functional redundancy and functional diversity for each diversity order, q, as well as the species richness.
}
\description{
Calculates functional redundancy via the Royalty method, as described in INSERT REFERENCE HERE.
}
\details{
ANYTHING THAT NEEDS TO GO INTO THE DETAILS SECTION
}
\examples{
# 
abundance.matrix <- read.csv('data/MAG_abundance_table.csv', row.names = 1 ) 
abundance.matrix <- round(abundance.matrix/min(abundance.matrix[abundance.matrix>0])) 
sample.effort <- min(rowSums(abundance.matrix))
abundance.matrix <- vegan::rrarefy(abundance.matrix,sample.effort)
abundance.matrix <- sweep(abundance.matrix,1,rowSums(abundance.matrix),'/')
trait.matrix <- read.csv('data/MAG_enzyme_gene_copies.csv', row.names = 1 )
fr <- royalty_fr(abundance.matrix, trait.matrix, q = 0.5)
fr <- tidyr::separate(fr,sample,into = c("site","size_fraction","depth"), sep = '_')
ggplot2::ggplot(fr,aes(x=trait,y=fr,color=depth))+geom_boxplot()+ylim(0,0.7)  
}
\references{
ADD MANUSCRIPT REFERENCE HERE
}
