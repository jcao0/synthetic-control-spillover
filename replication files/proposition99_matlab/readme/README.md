
This repository contains the MATLAB code used to replicate the empirical analysis in the paper by Cao and Dowd (2024), *Estimation and Inference for Synthetic Control Methods with Spillover Effects*. The analysis estimates the treatment effects of Proposition 99 while accounting for spillovers. The provided code can be adapted to other datasets by making appropriate adjustments.

## Prerequisite
Optimization toolbox for MATLAB

## Folder Structure

### `main.m`

Execute this MATLAB file to reproduce all results, including estimation, inference, and Figures 4 and 5 from the paper.

### `code/`

- **`data_cleaning.m`**: Cleans the raw dataset and generates the per-capita cigarette consumption table for 51 states from 1970 to 2000.

- **`data_input.m`**: Loads the cigarette consumption data and the spillover structure matrix based on the number of states and the specified list of spillover states.

- **`scm_estimation.m`**: Estimates the treatment effect for synthetic California using data from 38 states.

- **`sp_estimation.m`**: Estimates the treatment effect for a spillover-adjusted synthetic California using data from all 51 states. This script also calculates spillover effects on Arizona, Nevada, and Oregon, and generates a spillover effect table.

- **`sp_inference.m`**: Tests the treatment effect on California and the spillover effects on Arizona, Nevada, and Oregon for each post-treatment period.

- **`output_results.m`**: Generates tables and Figures 4 as presented in the paper.

- **`pure_donor_comparison.m`**: Compares the proposed and the pure-donor method in a sensitivity analysis and generate Figure 5.

### `functions/`

- **`scm_batch.m`**: Estimates weights, treating each row in turn as the treated unit, with the others as controls.

- **`sp_andrews_te.m`**: Performs an end-of-sample instability test for treatment effects.

- **`sp_andrews.m`**: Conducts an end-of-sample instability test for hypotheses such as the existence of spillover effects.

### `data/`

- **`The_Tax_Burden_on_Tobacco__1970-2019.csv`**: Raw per-capita cigarette consumption data from the *Centers for Disease Control and Prevention*.

- **`state_list.csv`**: Indicators for the 12 missing states in Abadie et al. (2010) and the neighboring states of California.

- **`cigs_consumption.csv`**: Per-capita cigarette consumption data for 51 states from 1970 to 2000, prepared using `data_cleaning.m`.

### `output/`

This directory stores all output figures and tables.

## Data Input

Before running `data_input.m`, set the number of states (either 38 or 51) and specify the list of spillover states. To adapt this code for other datasets, you may need to modify `data_input.m` and the data input section in `main.m`.

The key input variables are:
- **Y**: N-by-(T+S) matrix of outcomes, where the first row is the treated unit.
- **N**: Number of units.
- **T**: Number of pre-treatment periods.
- **S**: Number of post-treatment periods.
- **A**: Matrix representing spillover exposure.

Modifications may also be required in the plot section of `output_results.m` to customize the visualization of results.
