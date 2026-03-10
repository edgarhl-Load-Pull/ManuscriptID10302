## Paper Information

## Title:
Comparison of Two Harmonic Load-Pull Systems Using Frequency-Domain and Time-Domain Measurements for Evaluating GaN Transistor Output Power and Efficiency

## Manuscript ID:
10302

## Authors and Affiliations
Edgar Hernández-Limón
Department of Electronics and Telecommunications
Center for Scientific Research and Higher Education at Ensenada (CICESE)
Ensenada, Mexico

Daniel Alonso-Tejera
Department of Electronics and Telecommunications
Center for Scientific Research and Higher Education at Ensenada (CICESE)
Ensenada, Mexico

J. Apolinar Reynoso-Hernández
Department of Electronics and Telecommunications
Center for Scientific Research and Higher Education at Ensenada (CICESE)
Ensenada, Mexico

María del Carmen Maya-Sánchez
Department of Electronics and Telecommunications
Center for Scientific Research and Higher Education at Ensenada (CICESE)
Ensenada, Mexico

José Raúl Loo-Yau
Center for Research and Advanced Studies of the National Polytechnic Institute (Cinvestav)
Guadalajara Campus, Guadalajara, Mexico

Manuel Alejandro Pulido-Gaytan
Department of Electronics and Telecommunications
Center for Scientific Research and Higher Education at Ensenada (CICESE)
Ensenada, Mexico

Jaime Sánchez-García
Department of Electronics and Telecommunications
Center for Scientific Research and Higher Education at Ensenada (CICESE)
Ensenada, Mexico

## Repository Description
This repository contains the MATLAB scripts and datasets required to reproduce the figures and results presented in the paper.
All datasets correspond to measurements obtained from harmonic load-pull experiments performed on a GaN transistor using both frequency-domain and time-domain active harmonic load-pull systems.

Each script generates specific figures or results reported in the manuscript.

## Data Files

Contour_Pow_data.mat
Dataset used to generate the output power load-pull contours.

Contour_Eff_data.mat
Dataset used to generate the drain efficiency load-pull contours.

OptimalPower_Performance_data.mat
Measured performance data used to evaluate AM-AM characteristics, gain, and drain efficiency for the optimal power condition.

OptimalEfficiency_Performance_data.mat
Measured performance data used to evaluate AM-AM characteristics, gain, and drain efficiency for the optimal efficiency condition.

SecondHarmonicSweep_H3Open_Popt_data.mat
Dataset corresponding to the second-harmonic reactance sweep performed with the load optimized for maximum output power and the third harmonic open-circuited.

SecondHarmonicSweep_H3Open_Eopt_data.mat
Dataset corresponding to the second-harmonic reactance sweep performed with the load optimized for maximum drain efficiency and the third harmonic open-circuited.

## MATLAB Scripts

Each MATLAB script generates the corresponding figures and results using the provided datasets.

reproduce_power_contours.m
Generates the load-pull output power contours shown in the manuscript.

reproduce_efficiency_contours.m
Generates the load-pull drain efficiency contours.

reproduce_optimal_power_AMAM_gain_efficiency.m
Generates the AM-AM characteristics, gain, and drain efficiency for the optimal power condition.

reproduce_Eopt_AMAM_gain_eff.m
Generates the AM-AM characteristics, gain, and drain efficiency for the optimal efficiency condition.

reproduce_H2_sweep_Popt.m
Generates the comparison of output power and drain efficiency versus second-harmonic reactance when the load is optimized for maximum output power.

reproduce_H2_sweep_Eopt.m
Generates the comparison of output power and drain efficiency versus second-harmonic reactance when the load is optimized for maximum drain efficiency.

## Instructions to Reproduce the Results
Download or clone the repository.

Open MATLAB.
Run the desired script depending on the figure or result to be reproduced.

Example:
run('reproduce_power_contours.m')

Each script will load the required dataset and generate the corresponding figures presented in the paper.

## Software Requirements
The scripts were developed and tested using the following software environment:

MATLAB R2018
RF Toolbox (RFTools)

The RF Toolbox is required for handling RF network parameters and impedance-related calculations used in the load-pull data processing.

##Notes
All scripts rely only on the datasets included in this repository and the standard MATLAB environment with RF Toolbox support.
To reproduce the figures, ensure that MATLAB R2018 (or a compatible newer version) with RF Toolbox installed is available.
