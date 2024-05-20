#Signal Filtering and Analysis MATLAB Script
Introduction

This repository contains a MATLAB script designed for signal filtering and analysis. The script reads input and output signals from text files, designs low-pass, high-pass, and band-pass FIR filters, convolves them with the input signal, compares the filtered outputs with the output signal using correlation, and visualizes the results.
Usage
Prerequisites

    MATLAB installed on your system. Download from the MathWorks website.
    Signal Processing Toolbox installed in MATLAB.

Steps

    Clone the Repository
        Clone or download the repository containing the MATLAB script and input/output signal files.

    bash

git clone https://github.com/your-repo/signal-filtering-analysis.git

Open MATLAB

    Launch MATLAB on your computer.

Navigate to the Directory

    Use the cd command to navigate to the directory where you downloaded the MATLAB script and signal files.

matlab

cd path/to/signal-filtering-analysis

Run the Script

    Type the name of the MATLAB script in the command window and press Enter.

matlab

    SnS_Coding_Assignment

    View the Results
        The script will display the input signal, output signal, and the filtered output signals in separate plots. It will also print the correlation coefficients and visualize the correlation graphs.

Input Signal Files

Ensure that you have the input signal file named INPUT-SIGNAL-X(t).txt and the output signal file named OUTPUT-SIGNAL-Y(t).txt in the same directory as the MATLAB script.
Customization

    Customize filter specifications such as sampling frequency (fs), cutoff frequencies (fc_lp, fc_hp, fc_bp1, fc_bp2), and filter lengths (N_lp, N_hp, N_bp) as needed.
    Modify the input and output signal filenames in the MATLAB script if necessary.

Dependencies

This MATLAB script relies on the Signal Processing Toolbox for designing FIR filters and performing signal processing operations. Ensure the toolbox is installed for the script to function properly.
