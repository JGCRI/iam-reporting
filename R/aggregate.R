#### Aggregation functions

#' Aggregate a table by specified keys
#'
#' Aggregate the input table using the specified aggregation function,
#' using the specified columns as keys.
#'
#' @param tbl Table to aggregate
#' @param aggfn String giving the aggregation function.  If missing, use
#' \code{\link[base]{sum}}.
#' @param aggkeys String giving a list of aggregation keys.  If missing, return
#' the table unmodified.
aggregate <- function(tbl, aggfn, aggkeys)
{
    if(is.null(aggkeys) || is.na(aggkeys)) {
        return(tbl)
    }

    if(is.null(aggfn) || is.na(aggfn)) {
        aggfn <- base::sum
    }
    else {
        getaggfn(aggfn)
    }

    warning('Aggregation not yet implemented.  Returning table unmodified.')
    tbl
}


#' Table of allowable aggregation functions
#'
#' @keywords internal
AGGFNTBL <- list(
    sum = base::sum,
    mean = base::mean,
    max = base::max,
    min = base::min,
    median = stats::median
    )


#' Look up an aggregation function by name.
#'
#' Look up an aggregation function by name, restricting it to a whitelisted set
#' of known functions.
#'
#' @param fname Name of the requested function.
#' @keywords internal
getaggfn <- function(fname)
{
    if(fname %in% names(AGGFNTBL)) {
        AGGFNTBL[[fname]]
    }
    else {
        warning('Function ', fname,
                ' not found in allowed aggregation function table.\n',
                'No aggregation will be performed.')
        NULL
    }
}