# author: Annmarie Thomson, Christina Zhang, Arya Sardesai
# date: 03/13/2025

all:
	make analysis
	make clean

analysis:
	Rscript scripts/01_download_data.R
	Rscript scripts/02_clean_data.R --file_path=data/raw/bike_data.csv --output_path=data/cleaned/bike_data.csv
	Rscript scripts/03_visualizations.R --file_path=data/cleaned/bike_data.csv --output_dir="output"
	Rscript scripts/04_model_analysis.R --file_path=data/cleaned/bike_data.csv --output_dir="output"

clean:
	rm -rf output/*
	rm -rf data/cleaned/*
	rm -rf *.pdf
