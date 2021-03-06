# gcamrpt: Convert GCAM output to the format used by public IAM databases
[![Travis-CI Build Status](https://travis-ci.org/JGCRI/gcamrpt.svg?branch=master)](https://travis-ci.org/JGCRI/gcamrpt)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/JGCRI/gcamrpt?branch=master&svg=true)](https://ci.appveyor.com/project/JGCRI/gcamrpt)

Provide functions for converting GCAM output into the format used by
most IAM experiments to enter results into their databases.  Users
provide a table of desired outputs, along with options (such as
filtering and aggregation), and the package runs the necessary GCAM
queries (no more than once per query) and passes the results to the
functions that produce the output.

## Usage
There are two main user-visible functions in the `gcamrpt` package.  The
first is the `listVariables` function.  This function returns a
list of the variables the system knows how to produce, which can be helpful
in putting together your control files.

The main entry point into the report generator is the `generate`
function.  The generate function takes the names of two control files and a
string giving the location of your GCAM output databases.  There are also a
variety of options that determine how the output is formatted.  These options
and the the control file format are described in more detail in the
documentation to `generate`.


## Examples
```
generate('my-scenarios.ctl', 'my-vars.ctl', '~/wrk/data/gcam-dbfiles',
         fileformat='CSV')
```
Examples of these files can be found here:

[Example variables file](./inst/extdata/example-variable.ctl/)

[Example scenarios file](./inst/extdata/example-scenario.ctl/)

## Set-up
To use this package it first must be installed. You can do this using the R ```devtools``` package:

```
devtools::install_github("JGCRI/gcamrpt")
```

