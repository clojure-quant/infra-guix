(define-module (awb99 install r)
  #:export (my-r))

; possibly add this channel too ?
; https://github.com/UMCUGenetics/guix-additions/blob/master/umcu/packages/rstudio.scm
; r repos: Bioconductor + Cran

(define my-r
  (list  ;; for RMarkdown
    "r"
    "r-rserve" ; tcp server adaptor

    ; channel guix-science
    "rstudio" ; channel


   ;"r-knitr"
   ;"r-yaml"
   ;"r-markdown"
   ;"r-rmarkdown"
   ;"texlive"
   ;; commonly used r packages
   ;"r-psych"

   ; clojisr goldly-example-datascience
   "r-ggplot2" 
   "r-dt"
   "r-svglite"
   "r-plotly"
   
   "r-lattice"
   "r-foreign"
   "r-readr"
   ;"r-haven"
   "r-dplyr"
   "r-tidyr"
   ;"r-stringr"
   ;"r-forecast"
   ;"r-lme4"
   ;"r-nlme"
   ;"r-nnet"
   ;"r-glmnet"
   ;"r-caret"
   ;"r-xmisc"
   ;"r-splitstackshape"
   ;"r-tm"
   ;"r-quanteda"
   ;"r-topicmodels"
   ;"r-stm"
   ;;"r-parallel"
   ;"r-nlp"
   ))