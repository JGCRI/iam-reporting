% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/transportation.R
\name{trans_modules}
\alias{trans_modules}
\alias{module.pass_trans_service_output}
\alias{module.frgt_trans_service_output}
\alias{module.pass_trans_final_energy}
\alias{module.frgt_trans_final_energy}
\alias{module.pass_trans_service_intensity}
\alias{module.frgt_trans_service_intensity}
\alias{module.pass_trans_load_factor}
\alias{module.frgt_trans_load_factor}
\alias{process.tr_svc_output}
\alias{process.tr_fe_output}
\alias{process.trans_load_factors}
\alias{process.tr_svc_intensity}
\alias{module.sales}
\title{Transportation data modules}
\usage{
module.pass_trans_service_output(mode, allqueries, aggkeys, aggfn, years,
  filters, ounit)

module.frgt_trans_service_output(mode, allqueries, aggkeys, aggfn, years,
  filters, ounit)

module.pass_trans_final_energy(mode, allqueries, aggkeys, aggfn, years,
  filters, ounit)

module.frgt_trans_final_energy(mode, allqueries, aggkeys, aggfn, years,
  filters, ounit)

module.pass_trans_service_intensity(mode, allqueries, aggkeys, aggfn,
  years, filters, ounit)

module.frgt_trans_service_intensity(mode, allqueries, aggkeys, aggfn,
  years, filters, ounit)

module.pass_trans_load_factor(mode, allqueries, aggkeys, aggfn, years,
  filters, ounit)

module.frgt_trans_load_factor(mode, allqueries, aggkeys, aggfn, years,
  filters, ounit)

process.tr_svc_output(allqueries, aggkeys, aggfn, years, filters, ounit)

process.tr_fe_output(allqueries, aggkeys, aggfn, years, filters, ounit)

process.trans_load_factors(allqueries, aggkeys, aggfn, years, filters,
  ounit)

process.tr_svc_intensity(allqueries, aggkeys, aggfn, years, filters, ounit,
  nativeunit)

module.sales(mode, allqueries, aggkeys, aggfn, years, filters, ounit)
}
\arguments{
\item{mode}{Either \code{GETQ} or \code{RUN}.  The former returns
the names of the GCAM queries needed for the calculation; the latter runs the
calculation.  In \code{GETQ} mode all of the remaining arguments are
ignored.}

\item{allqueries}{List of all the queries pulled by the system.}

\item{aggkeys}{Character string listing the aggregation columns desired.
All of these columns must be present in the table computed by the main body
of the function.  If empty or NULL, no aggregation will be performed.}

\item{aggfn}{Function to use for aggregating.  If none specified,
\code{\link[base]{sum}} will be used.}

\item{years}{Years to include in the output}

\item{filters}{Character string giving a list of additional filters to be
applied, in s-exp format.}

\item{ounit}{Desired output unit.  If omitted, results will be returned with
no unit conversion.}
}
\description{
Produce transportation variables by service, mode, submode, fuel, and
vintage.
}
\details{
The transportation representation in GCAM is devilishly complicated, due to
the pass-through sectors needed to sidestep the model's requirement that
sectors have (exactly) three levels of detail.   As a result, GCAM's normal
designations of "sector", "subsector", and "technology" aren't really
meaningful for transportation.  A quantity represented as a sector could be
spliced in underneath another sector, for example.

Each transporttion data module starts with a call to the
\code{trans_standardize} function, which translates all of the GCAM output
variables to the standard taxonomy.  Each module also comes in a passenger
and a freight variant.  This is necessary because although the procedure for
producing the data is the same for each variant, there are some subtle
differences, especially where units are concerned that make them
incompatible.  The parts of each module that \emph{are} compatible are
factored into a single worker function that is called by both variants
}
\section{Functions}{
\itemize{
\item \code{module.pass_trans_service_output}: Passenger transportation service output data module

\item \code{module.frgt_trans_service_output}: Freight transportation service output data module

\item \code{module.pass_trans_final_energy}: Passenger transportation final energy module

\item \code{module.frgt_trans_final_energy}: Freight transportation final energy module

\item \code{module.pass_trans_service_intensity}: Passenger transportation service intensity module

\item \code{module.frgt_trans_service_intensity}: Passenger transportation service intensity module

\item \code{module.pass_trans_load_factor}: Passenger transportation load factor data module

\item \code{module.frgt_trans_load_factor}: Freight transportation load factor data module

\item \code{process.tr_svc_output}: Worker function for transportation service output modules

\item \code{process.tr_fe_output}: Worker function for service output modules

\item \code{process.trans_load_factors}: Worker function for load factor modules

\item \code{process.tr_svc_intensity}: Worker function for transportation service
intensity

\item \code{module.sales}: Vehicle sales

This module appears to be incomplete.
}}

\keyword{internal}
