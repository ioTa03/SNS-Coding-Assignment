# Signal Filtering and Analysis using MATLAB

This README file provides instructions for using the MATLAB script designed for signal filtering and analysis. The MATLAB script reads input and output signals from text files, designs low-pass, high-pass, and band-pass FIR filters, convolves them with the input signal, compares the filtered outputs with the output signal using correlation, and visualizes the results.

## Usage

1. Download MATLAB: Ensure you have MATLAB installed on your system. If not, you can download it from the official MathWorks website.
2. Clone the Repository: Clone or download the repository containing the MATLAB script and input/output signal files.
3. Open MATLAB: Open MATLAB on your computer.
4. Navigate to the Directory: Use the `cd` command to navigate to the directory where you downloaded the MATLAB script and signal files.
5. Run the Script: Type the name of the MATLAB script in the command window and press Enter. 
6. View the Results: The script will display the input signal, output signal, and the filtered output signals in separate plots. It will also print the correlation coefficients and visualize the correlation graphs.

## Input Signal Files
Ensure that you have the input signal file named `INPUT-SIGNAL-X(t).txt` and the output signal file named `OUTPUT-SIGNAL-Y(t).txt` in the same directory as the MATLAB script.

**Note:** Make sure that the input and output signal files are in the same directory as the MATLAB script.

## Customization
- You can customize the filter specifications such as sampling frequency (`fs`), cutoff frequencies (`fc_lp`, `fc_hp`, `fc_bp1`, `fc_bp2`), and filter lengths (`N_lp`, `N_hp`, `N_bp`) according to your requirements.
- Additionally, you can modify the input and output signal filenames in the MATLAB script if necessary.

## Dependencies
- Warning: This MATLAB script relies on the Signal Processing Toolbox for designing FIR filters and performing signal processing operations.
- Note: Make sure you have the Signal Processing Toolbox installed in MATLAB for the script to function properly.
