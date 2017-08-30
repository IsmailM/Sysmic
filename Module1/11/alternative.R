
gset        <- getGEO('GDS3420', destdir = '.')
eset        <- GDS2eSet(gset, do.log2 = FALSE)
gene.names  <- as.character(gset@dataTable@table$IDENTIFIER)
geData2     <- exprs(eset) # Get Expression Data
rownames(geData2) <- gene.names
geData2 <- geData2[which(gene.names != "NA"),]
dim(geData2)


# KNN imputation
X <- X[rowSums(is.na(X)) != ncol(X), ] # remove rows with missing data
X <- X[rowSums(X != 0) != 0,] # remove all zeros

imputation <- impute.knn(X)
X          <- imputation$data

# auto-detect if data is log transformed
scalable <- function(X) {
  #  produce sample quantiles corresponding to the given probabilities
  qx <- as.numeric(quantile(X, c(0.0, 0.25, 0.5, 0.75, 0.99, 1.0), na.rm = T))
  logc <- (qx[5] > 100) ||
      (qx[6] - qx[1] > 50 && qx[2] > 0) ||
      (qx[2] > 0 && qx[2] < 1 && qx[4] > 1 && qx[4] < 2)
  return (logc)
}

# If not log transformed, do the log2 transformed
if (scalable(X)) {
  X[which(X <= 0)] <- NaN # not possible to log transform negative numbers
  X <- log2(X)
}

pData  <- pData(eset)
# Create a data frame with the factors
expression.info  <- data.frame(pData['time'], Sample = rownames(pclass),
                               row.names = rownames(pclass))

# Introduce a population columns with the two groups, if not NA
expression.info <- within(expression.info, {
  population <- ifelse(time %in% c('4 h'), "Group1",
                       ifelse(time %in% c('24 h'), "Group2", NA))
})

