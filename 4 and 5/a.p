set terminal pdf
set output 'a.pdf'

set xlabel 'Gender (1 = Male, 0 = Female)'
set ylabel 'Number of People with Heart Disease'
set title 'Gender vs Heart Disease'

# Set the box width for histogram bars
set boxwidth 0.5
set style fill solid 0.5

# Set the y-axis range to start from 0
set yrange [0:*]

# Set the x-axis to only show 0 and 1
set xtics ( 'Female' 0, 'Male' 1)

# Plot the histogram based on gender counts
plot 'a.dat' using 2:1 with boxes title 'Heart Disease by Gender'

