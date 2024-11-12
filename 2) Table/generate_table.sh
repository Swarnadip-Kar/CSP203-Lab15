#!/bin/bash

# Input CSV file containing the dataset
input_file="heart.csv"
# Output LaTeX file
output_file="table_output.tex"

# Define the number of columns expected in the table (adjusted for new dataset)
num_columns=8

# LaTeX header content for the document
cat <<EOT > $output_file
\documentclass{article}
\usepackage{longtable}
\usepackage[a4paper, total={6in, 10in}]{geometry}
\usepackage{graphicx} % For resizing
\begin{document}

\begin{longtable}{*{${num_columns}}{c}}
\caption{Heart Disease Dataset} \\\\

\hline
\endfirsthead

\multicolumn{${num_columns}}{c}{\textit{(Continued from previous page)}} \\\\
\hline
\endhead

\hline
\multicolumn{${num_columns}}{c}{\textit{(Continued on next page)}} \\\\
\hline
\endfoot

\hline
\endlastfoot
EOT

# Read the first line (headers) from the CSV file and add it as column headers in the LaTeX table
IFS=',' read -r age sex chestpain bloodpressure cholesterol bloodsugar maxheartrate heartdisease < "$input_file"
echo "$age & $sex & $chestpain & $bloodpressure & $cholesterol & $bloodsugar & $maxheartrate & $heartdisease \\\\ \hline" >> $output_file

# Skip the first line (header) and process the rest of the CSV
{
    read # Skip the first line (header) already processed
    while IFS=',' read -r age sex chestpain bloodpressure cholesterol bloodsugar maxheartrate heartdisease
    do
      echo "$age & $sex & $chestpain & $bloodpressure & $cholesterol & $bloodsugar & $maxheartrate & $heartdisease \\\\" >> $output_file
    done
} < "$input_file"

# LaTeX footer content to close the table and document
cat <<EOT >> $output_file
\end{longtable}

\end{document}
EOT

echo "LaTeX longtable generated in $output_file"

pdflatex table_output.tex

