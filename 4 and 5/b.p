set terminal pdf
set output 'b.pdf'

set xlabel 'Age'
set ylabel 'Blood Pressure'
set title 'Correlation between Age and Blood Pressure'

# Use points to plot the correlation between Age (x) and Blood Pressure (y)
plot 'b.dat' using 1:2 with points title 'Age vs Blood Pressure'

