# author: Annmarie Thomson
# date: 03/13/2025

data/cleaned/bike_data.csv: scripts/02_clean_data.R data/raw/bike_data.csv
	Rscript scripts/02_clean_data.R --file_path=data/raw/bike_data.csv --output_path=data/cleaned/bike_data.csv
