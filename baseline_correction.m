function EEG = baseline_correction(EEG)
    media = mean(EEG.data, 2);
    EEG.data = EEG.data - media;
    % [ALLEEG EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', 'EEG_baselineCorrection', 'savenew', 'dataset_folder/ST_motor_baselinecorrection');
    % eegplot(EEG.data,'srate',125,'eloc_file',EEG.chanlocs,'events',EEG.event,'winlength', 30,'color',{'b'}, 'spacing', 80, 'title', 'Data after baseline correction');

end