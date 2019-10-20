set term png
set output "plot1.png"
set key off
set boxwidth 0.2
set style fill solid
plot "plot1.dat" using 1:3:xtic(2) with boxes lc rgb "blue"
