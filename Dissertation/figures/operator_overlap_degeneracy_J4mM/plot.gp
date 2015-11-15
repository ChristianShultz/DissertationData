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
set out "Z_nolabels.pdf"

unset key
set style fill transparent solid 0.5 noborder
set size ratio 3
set border 2
unset xtics 
set ytics nomirror 
set xr[1.3:3.1]
set yr[0:3.5]


plot "< grep 'A1 ' Z.dat" u (1+$2/2):3:4 w yerr pt 70 ps 1.0 lw 2.7 lc rgb jlab_red notitle ,\
     "< grep 'T1 ' Z.dat" u (1+$2/2):3:4 w yerr pt 71 ps 1.0 lw 2.7 lc rgb jlab_blue notitle ,\
     "< grep 'T2 ' Z.dat" u (1+$2/2):3:4 w yerr pt 72 ps 1.0 lw 2.7 lc rgb jlab_green notitle ,\
     "< grep 'E  ' Z.dat" u (1+$2/2):3:4 w yerr pt 73 ps 1.0 lw 2.7 lc rgb jlab_purple notitle ,\



set out "E_nolabels.pdf"
set yr[0.148:0.68] 
plot   "< grep 'mA1m ' Z.dat" u (1+$2/2):3:4 w yerr pt 70 ps 1.0 lw 2.7 lc rgb jlab_red notitle ,\
     "< grep 'mT1m ' Z.dat" u (1+$2/2):3:4 w yerr pt 71 ps 1.0 lw 2.7 lc rgb jlab_blue notitle ,\
     "< grep 'mT2m ' Z.dat" u (1+$2/2):3:4 w yerr pt 72 ps 1.0 lw 2.7 lc rgb jlab_green notitle ,\
     "< grep 'mEm ' Z.dat" u (1+$2/2):3:4 w yerr pt 73 ps 1.0 lw 2.7 lc rgb jlab_purple notitle ,\




