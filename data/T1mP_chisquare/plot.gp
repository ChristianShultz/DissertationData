####################################################
# colors ##
jlab_red         = "#C0272D"
jlab_orange      = "#F96600"
jlab_blue        = "#2F7A79"
jlab_green       = "#417D0A"
jlab_light_gray  = "#E5E5E5"
jlab_purple      = "#800080"
####################################################

set term pdf color solid enhanced font "Times-Roman" dashed
set out "chisquare.pdf"

unset key
set style fill transparent solid 0.5 noborder

xmin = 2.5
xmax = 12.5
ymax = 400
ymin = 0

set yrange[ymin:ymax]
set xrange[xmin:xmax]
set xtics nomirror 
set ytics nomirror

plot "chisq.dat" u 1:3  pt 70 ps 0.8 lw 1.7 lc rgb jlab_red notitle 


