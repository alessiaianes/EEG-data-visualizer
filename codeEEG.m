%%RIFERIMENTO
clear all;
close all;
clc;

rng(0, "twister");

task = 'STmotor';
subject = 6;
setname = strcat('EEG_', task, '_S', num2str(subject));
setpath = strcat('EEG/', task, '/S', num2str(subject), '/', setname);
folderpath = strcat('dataset_folder/', setname,'.set');

if exist(strcat(folderpath), "file")
    [ALLEEG EEG] = loading_set(folderpath);
else
    eeglab
    [ALLEEG EEG] = save_data(ALLEEG, EEG, strcat(setpath,'.csv'), setname, strcat(setpath,'_mrk.csv'));
end

eeglab redraw


% PLOT RAW DATA
eegplot(EEG.data,'srate',125,'eloc_file',EEG.chanlocs,'events',EEG.event,'winlength', 30,'color',{'b'}, 'spacing', 80, 'title', 'Raw data');


%BASELINE CORRECTION
EEG = baseline_correction(EEG);
[ALLEEG EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', strcat(setname,'_baselineCorrection'), 'savenew', strcat('dataset_folder/', setname, '_baselinecorrection'));
eegplot(EEG.data,'srate',125,'eloc_file',EEG.chanlocs,'events',EEG.event,'winlength', 30,'color',{'b'}, 'spacing', 80, 'title', 'Data after baseline correction');

eeglab redraw;

%FILTERING
d = (EEG.data)';
fs = EEG.srate;
fn = fs/2;
Rp = 3;
Rs = 20;
f_high = 2;
f_low = 30;

EEG.data = filter_data(f_high, f_low, fn, Rp, Rs, d);
[ALLEEG EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', strcat(setname, '_butterworth'), 'savenew', strcat('dataset_folder/', setname, '_filtered'));
eegplot(EEG.data,'srate',125,'eloc_file',EEG.chanlocs,'events',EEG.event,'winlength', 30,'color',{'b'}, 'spacing', 150, 'title', 'Filtered data with Butterworth filter');
eeglab redraw


%ICA
EEG = pop_runica(EEG, 'icatype', 'fastica');
[ALLEEG EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', strcat(setname,'_ICA'), 'savenew', strcat('dataset_folder/', setname, '_ICA'));
eeglab redraw;


pop_viewprops(EEG, 0, 1:8);
pop_eegplot(EEG, 0, 0, 1, [], 'srate',125,'events',EEG.event,'winlength', 30,'color',{'b'}, 'spacing', 150, 'title', 'Indipendent components');