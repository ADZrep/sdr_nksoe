# Sovereign Risk and Exchange Rates Across Regimes

Replication code for the thesis *Sovereign Risk and Exchange Rates Across Regimes*
(Alberto Dario Zanettin, Bocconi University, 2026).

## Overview

This repository contains the Dynare and MATLAB code to solve the model and replicate
all figures in the paper. The model is a New Keynesian Small Open Economy (NKSOE)
built on Galí and Monacelli (2005), augmented with incomplete financial markets,
market segmentation between domestic and international investors, and government debt
subject to expected default risk.

## Requirements

- MATLAB (tested on R2023b or later)
- [Dynare](https://www.dynare.org/) 6.2 or later

## File Structure

| File | Description |
|---|---|
| `sdr_irbc.mod` | Dynare model file: flexible prices equilibrium |
| `sdr_irbc_ex.m` | MATLAB script: solves the flexible prices model and produces Figures 1–2 |
| `sdr_nksoe.mod` | Dynare model file: rigid prices, flexible exchange rate regime |
| `sdr_nksoe_peg.mod` | Dynare model file: rigid prices, currency peg regime |
| `sdr_nksoe_ex.m` | MATLAB script: solves both rigid prices models and produces Figures 3–6 |

## Figures

| Figure | Script | Description |
|---|---|---|
| Figure 1 | `sdr_irbc_ex.m` | IRFs to a 1% default risk shock — flexible prices, δ = 0 vs δ = 0.01 |
| Figure 2 | `sdr_irbc_ex.m` | IRFs to a 1% tax cut — flexible prices, δ = 0 vs δ = 0.01 |
| Figures 3–4 | `sdr_nksoe_ex.m` | IRFs to default risk and tax shocks — rigid prices, flexible exchange rate vs peg |
| Figures 5–6 | `sdr_nksoe_ex.m` | Full IRF sets — rigid prices, appendix |

## Usage

1. Add Dynare to your MATLAB path, or adjust the `cd` path at the top of each 
   script to point to your local Dynare installation.
2. Set the `folder` variable in each script to your desired output directory.
3. To replicate the flexible prices results (Figures 1–2), run:
```matlab
   sdr_irbc_ex
```
4. To replicate the rigid prices results (Figures 3–6), run:
```matlab
   sdr_nksoe_ex
```
Figures are saved as vector PDFs in the output folder specified in each script.
