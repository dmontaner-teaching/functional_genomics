#! /usr/bin/Rscript --vanilla

##z_make.r
##2017-03-01 david.montaner@gmail.com
##make revealjs presentation

rm (list = ls ())
R.version.string ## "R version 3.3.2 (2016-10-31)"
library (rmarkdown); packageDescription ("rmarkdown", fields = "Version") #"1.3"
library (revealjs);  packageDescription ("revealjs",  fields = "Version") #"0.8"

#help (package = markdown)
#help (package = revealjs)
# ?revealjs_presentation

## tema <- "simple"
## tema <- "sky"      # .
## tema <- "beige"    # +
## tema <- "serif"    # +
## tema <- "solarized"
## tema <- "blood"
## tema <- "moon"      # +
## tema <- "night"
## tema <- "black"
   tema <- "league"    # ++
## tema <- "white"

salida   <- "index"
selfcont <- FALSE
mathjax  <- "local"    ## The "local" option uses a local version of MathJax (which is copied into the output directory)
#mathjax <- "default"  ## The "default" option uses an https URL from the official MathJax CDN.

################################################################################

entrada <- "slides.Rmd"
micss   <- "z_style.css"

unlink ("*.html")

fichero <- paste0 (salida, ".html")

rmarkdown::render (input = entrada, output_file = fichero,
                   output_format =
                       revealjs::revealjs_presentation (
                                     theme          = tema,
                                     transition     = "convex",
                                     center         = TRUE,
                                     self_contained = selfcont,
                                     css            = micss,
                                     mathjax        = mathjax
                                 ))
