function f_signal = filter_data(high, low, fn, Rp, Rs, d)
    [~, Wn] = buttord(high/fn, (high - 0.7)/fn, Rp, Rs);
    [b, a] = butter(4, Wn, 'high');
    filtered_high = filtfilt(b, a, d);

    [~, Wn] = buttord(low/fn, (low + 5)/fn, Rp, Rs);
    [b, a] = butter(8, Wn, 'low');
    filtered_low = filtfilt(b, a, filtered_high);

    f_signal = filtered_low';


end