set term png
set output "plot2.png"
set key off
set boxwidth 0.2
set style fill solid
plot "plot2.dat" using 1:3:xtic(2) with boxes lc rgb "blue"
