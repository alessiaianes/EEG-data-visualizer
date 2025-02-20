function [ALLEEG EEG] = save_data(ALLEEG, EEG, filepath, setname, marker_filepath)
    loadset = table2array(readtable(filepath, "ThousandsSeparator", "."))*1e-3;
    dataset = loadset(:, 2:9);
    dataset = dataset';

    
    time = loadset(:, 1);
    t = time-time(1);

    
    EEG.data = dataset;
    EEG.setname = setname;
    EEG.srate = 125;
    EEG.times = t;

    EEG.chanlocs= pop_chanedit(EEG.chanlocs, 'load',{'channels_folder/chan_locations.ced', 'filetype', 'autodetect'});
    
    if exist(marker_filepath, "file") && contains('STcounting', marker_filepath, 'IgnoreCase', true)
        marker = loading_marker(marker_filepath, time(1));
        EEG = pop_importevent(EEG, 'event', marker, 'fields', {'type', 'latency'});

        for i = 1 : length(EEG.event)
            EEG.event(i).type = char(EEG.event(i).type);
        end
    end

    [ALLEEG EEG] = pop_saveset(EEG, 'filename', setname, 'filepath', 'dataset_folder/');
    
end