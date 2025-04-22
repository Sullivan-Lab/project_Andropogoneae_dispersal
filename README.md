# README for the Wind Dispersal of Andropogoneae diaspores project


## Table of Contents
- [Introduction](#Introduction)
- [Usage](#Usage)
- [Files](#Files)
- [Funding Sources](#Funding-sources)
- [Acknowledgements](#Acknowledgements)
- [Contributors](#Contributors)
- [Contact Information](#Contact-information)

## Introduction

*Repository for code and data associated with the manuscript "Wind Dispersal of Grasses in the Andropogoneae." Seed mass data is stored here, as well as code to execute the terminal velocity sensitivity analysis, and code that summarize data from GBIF and BioClim*

## Usage

*Code here uses R v4.3.3.  Data files are found in 'data' folder. R script files are found in 'code' folder*

### Data Files

- **`terminal_velocity.csv`**: *preliminary data for sensitivity analysis.*
- **`Seed Drop Data - Weights.csv`**: *final seed mass measurements for all dropped diaspores.*


## Scripts


### *`terminal velocity sensitivity analysis.Rmd`*

- **Purpose**: *Runs sensitivity analysis on preliminary terminal velocity data to determine the number of drops necessary.*
- **Inputs**: *Raw data files in the `/data` folder (`terminal_velocity.csv`).*
- **Outputs**: *(`terminal-velocity-sensitivity-analysis.pdf`)*

### *`enviro_individual_extract.R`*

- **Purpose**: *Extracts environmental data from BioClim raster files and collates wind values during the fruiting and dispersing season.  This is simply example code, and cannot be run for space reasons.*
- **Inputs**: *None stored here for space reasons.*

### *`seeddrop_wind.R`*

- **Purpose**: *Takes wind data extracted from `enviro_individual_extract.R` and summarizes it for our species.  This is simply example code, and cannot be run for space reasons.*
- **Inputs**: *None stored here for space reasons.*


## Funding Sources

- *Assistance Agreement no. EM-84065101 awarded by the US Environmental Protection Agency to the Missouri Water Center at the University of Missouri*
- *National Science Foundation (grant number DEB-1929514)*
- *Long-Term Agroecosystem Research (LTAR) network (58-5070-9-016 and 58-5070-2-018). LTAR is supported by the United States Department of Agriculture.*

## Acknowledgements

*We thank P. Traiperm, D. J. Layton, J. Zhong, T. M. AuBuchon-Elder, R. Pasquet and L. G. Clark for plant collection and sharing material with us.*

## Contributors

*Project design and supervision: BW, LLS, EAK.  Experimental data collection: KBP and HW, with assistance from BW, LLS, and EAK. Database mining, data assembly, formatting: KBP.  Data analysis: BW, KBP.  Modeling: BW, LLS. Writing – draft manuscript: BW, LLS, EAK.  Writing – editing and preparing for publication:  All authors.*

## Contact Information

*Contact Lauren Sullivan (llsull@msu.edu) for inquiries related to the data and scripts stored here. Contact Binbin Wang (wangbinb@missouri.edu) for questions related to the Dispersal Models and terminal velocity calculations*
