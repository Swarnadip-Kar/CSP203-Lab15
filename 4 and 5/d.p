# Set age groups percentage
percent_40_50 = real(system("awk '$1 == \"40-50\" {print $3}' d.dat"))
percent_50_60 = real(system("awk '$1 == \"50-60\" {print $3}' d.dat"))
percent_60_70 = real(system("awk '$1 == \"60-70\" {print $3}' d.dat"))
percent_70_80 = real(system("awk '$1 == \"70-80\" {print $3}' d.dat"))
percent_80_90 = real(system("awk '$1 == \"80-90\" {print $3}' d.dat"))
percent_90_100 = real(system("awk '$1 == \"90-100\" {print $3}' d.dat"))

# Set terminal and output file
set terminal pdf
set output 'd.pdf'
set size square
set xrange [-1.5:1.5]
set yrange [-1.5:1.5]

# Disable border, tics, and key
unset border
unset tics
unset key

# Define colors for each age group
color_40_50 = "#FF6347"  # tomato red
color_50_60 = "#FFD700"  # gold
color_60_70 = "#32CD32"  # lime green
color_70_80 = "#1E90FF"  # dodger blue
color_80_90 = "#8A2BE2"  # blue violet
color_90_100 = "#FF69B4" # hot pink

# Calculate total percentage from data
total_percentage = percent_40_50 + percent_50_60 + percent_60_70 + percent_70_80 + percent_80_90 + percent_90_100

# Normalize each percentage
norm_percent_40_50 = 100 * percent_40_50 / total_percentage
norm_percent_50_60 = 100 * percent_50_60 / total_percentage
norm_percent_60_70 = 100 * percent_60_70 / total_percentage
norm_percent_70_80 = 100 * percent_70_80 / total_percentage
norm_percent_80_90 = 100 * percent_80_90 / total_percentage
norm_percent_90_100 = 100 * percent_90_100 / total_percentage

# Calculate angles for each normalized segment
angle_40_50 = 360 * norm_percent_40_50 / 100
angle_50_60 = 360 * norm_percent_50_60 / 100
angle_60_70 = 360 * norm_percent_60_70 / 100
angle_70_80 = 360 * norm_percent_70_80 / 100
angle_80_90 = 360 * norm_percent_80_90 / 100
angle_90_100 = 360 * norm_percent_90_100 / 100

# Accumulate angles to find midpoints for labeling
start_angle = 0
mid_angle_40_50 = start_angle + angle_40_50 / 2
start_angle = start_angle + angle_40_50
mid_angle_50_60 = start_angle + angle_50_60 / 2
start_angle = start_angle + angle_50_60
mid_angle_60_70 = start_angle + angle_60_70 / 2
start_angle = start_angle + angle_60_70
mid_angle_70_80 = start_angle + angle_70_80 / 2
start_angle = start_angle + angle_70_80
mid_angle_80_90 = start_angle + angle_80_90 / 2
start_angle = start_angle + angle_80_90
mid_angle_90_100 = start_angle + angle_90_100 / 2

# Draw filled pie chart slices using circular sectors
set object 1 circle at 0,0 size 1 fillcolor rgb color_40_50 fillstyle solid 1.0 arc [0:angle_40_50]
set object 2 circle at 0,0 size 1 fillcolor rgb color_50_60 fillstyle solid 1.0 arc [angle_40_50:(angle_40_50 + angle_50_60)]
set object 3 circle at 0,0 size 1 fillcolor rgb color_60_70 fillstyle solid 1.0 arc [(angle_40_50 + angle_50_60):(angle_40_50 + angle_50_60 + angle_60_70)]
set object 4 circle at 0,0 size 1 fillcolor rgb color_70_80 fillstyle solid 1.0 arc [(angle_40_50 + angle_50_60 + angle_60_70):(angle_40_50 + angle_50_60 + angle_60_70 + angle_70_80)]
set object 5 circle at 0,0 size 1 fillcolor rgb color_80_90 fillstyle solid 1.0 arc [(angle_40_50 + angle_50_60 + angle_60_70 + angle_70_80):(angle_40_50 + angle_50_60 + angle_60_70 + angle_70_80 + angle_80_90)]
set object 6 circle at 0,0 size 1 fillcolor rgb color_90_100 fillstyle solid 1.0 arc [(angle_40_50 + angle_50_60 + angle_60_70 + angle_70_80 + angle_80_90):(angle_40_50 + angle_50_60 + angle_60_70 + angle_70_80 + angle_80_90 + angle_90_100)]

# Convert mid-angles to radians and set label positions using sin and cos, including age groups
set label 1 sprintf("40-50: %.2f%%", percent_40_50) at cos(mid_angle_40_50 * pi / 180), sin(mid_angle_40_50 * pi / 180)
set label 2 sprintf("50-60: %.2f%%", percent_50_60) at cos(mid_angle_50_60 * pi / 180), sin(mid_angle_50_60 * pi / 180)
set label 3 sprintf("60-70: %.2f%%", percent_60_70) at cos(mid_angle_60_70 * pi / 180), sin(mid_angle_60_70 * pi / 180)
set label 4 sprintf("70-80: %.2f%%", percent_70_80) at cos(mid_angle_70_80 * pi / 180), sin(mid_angle_70_80 * pi / 180)
set label 5 sprintf("80-90: %.2f%%", percent_80_90) at cos(mid_angle_80_90 * pi / 180), sin(mid_angle_80_90 * pi / 180)
set label 6 sprintf("90-100: %.2f%%", percent_90_100) at cos(mid_angle_90_100 * pi / 180), sin(mid_angle_90_100 * pi / 180)


# Plot an empty function to render the chart
plot NaN notitle

