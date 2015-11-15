#!/bin/tcsh -x

set tex = "/usr/texbin/pdflatex -interaction=nonstopmode --shell-escape --enable-write18"

set source = `pwd | awk '{print "basename " $1}' | $SHELL`


$tex $source.tex
# bibtex $source.aux
# $tex $source.tex
# $tex $source.tex


#if( $status != 0 ) then 
#  echo "tex failed to build"
#  exit(1)
#endif

set src = $source.pdf 
set uncropped = ${source}_uncropped.pdf
mv $src $uncropped 
pdfcrop --margins 0 $uncropped $src 

open $src
