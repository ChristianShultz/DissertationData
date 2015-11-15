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
set out "stuffy.pdf"

unset key
set style fill transparent solid 0.5 noborder

    "< grep '74 ' PiPiF1.refit.dat_sort4" u 4:7:5:8 w xyerr pt 74 ps 1.0 lw 1.7 lc rgb jlab_purple notitle ,\



