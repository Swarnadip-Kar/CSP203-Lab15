#!/bin/bash

# Input file (assuming heart.csv is in the current directory)
input_file="heart.csv"

# Preprocessing for Task a: Gender vs Number of People with Heart Disease
# Extract Gender (Sex column) and HeartDisease column (1 for heart disease)
awk -F, '{if($8 == 1) print $2}' $input_file | sort | uniq -c > gender_heart_disease_count.dat
echo "Preprocessed data for Task a: a.dat"

# Preprocessing for Task b: Correlation between Age and Blood Pressure
# Extract Age (column 1) and Blood Pressure (column 4)
awk -F, '{print $1, $4}' $input_file > age_blood_pressure.dat
echo "Preprocessed data for Task b: b.dat"

# Preprocessing for Task c: Correlation between Age and Cholesterol for those without Heart Disease
# Extract Age (column 1) and Cholesterol (column 5) for those with HeartDisease == 0
awk -F, '{if($8 == 0) print $1, $5}' $input_file | sort -n > age_cholesterol_no_heart_disease.dat
echo "Preprocessed data for Task c: c.dat"


# Provide completion message
echo "Preprocessing complete for tasks a,b,c. All data files are ready for plotting."

