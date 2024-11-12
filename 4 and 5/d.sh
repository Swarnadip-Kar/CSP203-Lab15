#!/bin/bash

# File path to the dataset (replace with your actual file path)
DATA_FILE="heart.csv"
OUTPUT_FILE="d.dat"

# Initialize counters for each age group and total heart disease count
age_group_40_50=0
age_group_50_60=0
age_group_60_70=0
age_group_70_80=0
age_group_80_90=0
age_group_90_100=0
total_heart_disease=0

# Read the dataset and process each line
# Assuming the CSV format: Age, Sex, ChestPain, BloodPressure, Cholesterol, BloodSugar, MaxHeartRate, HeartDisease
# Skip the header (if any), and process each line
while IFS=, read -r age sex chestpain bloodpressure cholesterol bloodsugar maxheartrate heartdisease; do
  # Skip the header row if necessary (adjust this line if your CSV has headers)
  if [[ "$age" == "Age" ]]; then
    continue
  fi

  # Only count rows where heart disease (HeartDisease) == 1
  if [[ "$heartdisease" == "1" ]]; then
    # Increment the total heart disease count
    ((total_heart_disease++))

    # Group by age range and increment the appropriate counter
    if (( age >= 40 && age < 50 )); then
      ((age_group_40_50++))
    elif (( age >= 50 && age < 60 )); then
      ((age_group_50_60++))
    elif (( age >= 60 && age < 70 )); then
      ((age_group_60_70++))
    elif (( age >= 70 && age < 80 )); then
      ((age_group_70_80++))
    elif (( age >= 80 && age < 90 )); then
      ((age_group_80_90++))
    elif (( age >= 90 && age <= 100 )); then
      ((age_group_90_100++))
    fi
  fi
done < "$DATA_FILE"

# Calculate the percentage for each age group
percent_40_50=$(echo "scale=2; $age_group_40_50 / $total_heart_disease * 100" | bc)
percent_50_60=$(echo "scale=2; $age_group_50_60 / $total_heart_disease * 100" | bc)
percent_60_70=$(echo "scale=2; $age_group_60_70 / $total_heart_disease * 100" | bc)
percent_70_80=$(echo "scale=2; $age_group_70_80 / $total_heart_disease * 100" | bc)
percent_80_90=$(echo "scale=2; $age_group_80_90 / $total_heart_disease * 100" | bc)
percent_90_100=$(echo "scale=2; $age_group_90_100 / $total_heart_disease * 100" | bc)

# Output the results to the new file with percentages
echo -e "AgeGroup\tHeartDiseaseCount\tPercentage" > "$OUTPUT_FILE"
echo -e "40-50\t$age_group_40_50\t$percent_40_50" >> "$OUTPUT_FILE"
echo -e "50-60\t$age_group_50_60\t$percent_50_60" >> "$OUTPUT_FILE"
echo -e "60-70\t$age_group_60_70\t$percent_60_70" >> "$OUTPUT_FILE"
echo -e "70-80\t$age_group_70_80\t$percent_70_80" >> "$OUTPUT_FILE"
echo -e "80-90\t$age_group_80_90\t$percent_80_90" >> "$OUTPUT_FILE"
echo -e "90-100\t$age_group_90_100\t$percent_90_100" >> "$OUTPUT_FILE"

# Output a message that the file has been written
echo "Age group data with percentages written to $OUTPUT_FILE"

