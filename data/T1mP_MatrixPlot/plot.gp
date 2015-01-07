####################################################
# colors ##
jlab_red         = "#C0272D"
jlab_orange      = "#F96600"
jlab_blue        = "#2F7A79"
jlab_green       = "#417D0A"
jlab_light_gray  = "#E5E5E5"
jlab_purple      = "#800080"
####################################################

#set term pdf color solid enhanced font "Times-Roman" dashed
#set out "MatrixPlot.pdf"

set terminal png 
set out "MatrixPlot.png"

unset key
set palette gray negative 
set size ratio 1
set autoscale xfix
set autoscale yfix


plot 'matrix_plot_5.cooked.dat' u 1:(26-$2):3 matrix with image 

