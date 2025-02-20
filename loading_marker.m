function marker = loading_marker(marker_filepath, eeg_time)
    marker = table2array(readtable(marker_filepath, "ThousandsSeparator","."))*1e-3;
    for i = 3 : 3 : length(marker)
        marker(i - 2, 1) = 1;
        marker(i - 1, 1) = 2;
        marker(i, 1) = 3;
    end
    marker(marker(:, 1) == 1) = 117;
    marker(marker(:, 1) == 2) = 103;
    marker(marker(:, 1) == 3) = 115;
    marker(:, 2) = marker(:, 2) - eeg_time(1);

end