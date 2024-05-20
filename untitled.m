% Main script
clc;
clearvars;

% Step 1: Read input and output signals
[input_file, output_file] = deal('INPUT-SIGNAL-X(t).txt', 'OUTPUT-SIGNAL-Y(t).txt');
[x, y] = readSignals(input_file, output_file);

% Step 2: Filter specifications
[fs, fc_lp, fc_hp, fc_bp1, fc_bp2] = deal(44100, 0.1, 0.1, 0.05, 0.15);

% Filter lengths
[N_lp, N_hp, N_bp] = deal(101, 101, 101);

% Step 3: Design FIR filters
[hlp, hhp, hbp] = designFilters(fs, fc_lp, fc_hp, fc_bp1, fc_bp2, N_lp, N_hp, N_bp);

% Step 4: Convolve filters with input signal
[y_lp, y_hp, y_bp] = convolveFilters(x, hlp, hhp, hbp);

% Step 5: Compare filtered outputs with output signal using correlation
[corr_lp, corr_hp, corr_bp] = calculateCorrelation(y_lp, y_hp, y_bp, y);

% Step 6: Identify the best match
[best_match, filtered_output] = identifyBestMatch(corr_lp, corr_hp, corr_bp, y_lp, y_hp, y_bp);

% Step 7: Display input, output, and filtered output signals
figure;
subplot(6,1,1);
plot(x);
title('Input Signal (x(t))');
xlabel('Sample');
ylabel('Amplitude');

subplot(6,1,2);
plot(y);
title('Output Signal (y(t))');
xlabel('Sample');
ylabel('Amplitude');

subplot(6,1,3);
plot(y_lp);
title('Low Pass Filtered Output (y_{LP}(t))');
xlabel('Sample');
ylabel('Amplitude');

subplot(6,1,4);
plot(y_hp);
title('High Pass Filtered Output (y_{HP}(t))');
xlabel('Sample');
ylabel('Amplitude');

subplot(6,1,5);
plot(y_bp);
title('Band Pass Filtered Output (y_{BP}(t))');
xlabel('Sample');
ylabel('Amplitude');

subplot(6,1,6);
plot(filtered_output);
title(['Best Match: ', best_match]);
xlabel('Sample');
ylabel('Amplitude');

% Step 8: Display correlation coefficients
displayCorrelationCoefficients(corr_lp(1, 2), corr_hp(1, 2), corr_bp(1, 2));

% Step 9: Visualize correlation graphs
figure;
subplot(3,1,1);
plot(y_lp);
hold on;
plot(y);
hold off;
title('Low Pass Filtered Output vs Output Signal');
xlabel('Sample');
ylabel('Amplitude');
legend('Filtered Output', 'Output Signal');

subplot(3,1,2);
plot(y_hp);
hold on;
plot(y);
hold off;
title('High Pass Filtered Output vs Output Signal');
xlabel('Sample');
ylabel('Amplitude');
legend('Filtered Output', 'Output Signal');

subplot(3,1,3);
plot(y_bp);
hold on;
plot(y);
hold off;
title('Band Pass Filtered Output vs Output Signal');
xlabel('Sample');
ylabel('Amplitude');
legend('Filtered Output', 'Output Signal');

% Function to read input and output signals from files
function [x, y] = readSignals(input_file, output_file)
    x = load(input_file); % Load input signal from text file
    y = load(output_file); % Load output signal from text file
end

% Function to design FIR filters
function [hlp, hhp, hbp] = designFilters(fs, fc_lp, fc_hp, fc_bp1, fc_bp2, N_lp, N_hp, N_bp)
    hlp = fir1(N_lp-1, fc_lp/(fs/2), 'low'); % Low-pass filter
    hhp = fir1(N_hp-1, fc_hp/(fs/2), 'high'); % High-pass filter
    hbp = fir1(N_bp-1, [fc_bp1/(fs/2), fc_bp2/(fs/2)], 'bandpass'); % Band-pass filter
end

% Function to convolve filters with input signal
function [y_lp, y_hp, y_bp] = convolveFilters(x, hlp, hhp, hbp)
    y_lp = conv(x, hlp); % Convolve with Low Pass filter
    y_hp = conv(x, hhp); % Convolve with High Pass filter
    y_bp = conv(x, hbp); % Convolve with Band Pass filter

    % Trim the outputs to match the length of the input signal
    y_lp = y_lp(1:length(x));
    y_hp = y_hp(1:length(x));
    y_bp = y_bp(1:length(x));
end

% Function to calculate and display correlation coefficients
function displayCorrelationCoefficients(corr_lp, corr_hp, corr_bp)
    disp('Correlation coefficients:');
    disp(['Low Pass Filter: ', num2str(corr_lp * 100), '%']);
    disp(['High Pass Filter: ', num2str(corr_hp * 100), '%']);
    disp(['Band Pass Filter: ', num2str(corr_bp * 100), '%']);
end

% Function to compare filtered outputs with output signal using correlation
function [corr_lp, corr_hp, corr_bp] = calculateCorrelation(y_lp, y_hp, y_bp, y)
    corr_lp = corrcoef(y_lp, y); % Correlation between LPF output and output signal
    corr_hp = corrcoef(y_hp, y); % Correlation between HPF output and output signal
    corr_bp = corrcoef(y_bp, y); % Correlation between BPF output and output signal
end

% Function to identify the best match filter
function [best_match, filtered_output] = identifyBestMatch(corr_lp, corr_hp, corr_bp, y_lp, y_hp, y_bp)
    [max_corr, filter_type] = max([corr_lp(1, 2), corr_hp(1, 2), corr_bp(1, 2)]);
    if filter_type == 1
        best_match = 'Low Pass Filter';
        filtered_output = y_lp;
    elseif filter_type == 2
        best_match = 'High Pass Filter';
        filtered_output = y_hp;
    else
        best_match = 'Band Pass Filter';
        filtered_output = y_bp;
    end
end
