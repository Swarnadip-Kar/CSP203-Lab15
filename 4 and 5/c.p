set terminal pdf
set output 'c.pdf'

set xlabel 'Age'
set ylabel 'Cholesterol'
set title 'Correlation between Age and Cholesterol (No Heart Disease)'

# Use lines with points for those without heart disease (HeartDisease == 0)
plot 'c.dat' using 1:2 with linespoints title 'Age vs Cholesterol (No Heart Disease)'

