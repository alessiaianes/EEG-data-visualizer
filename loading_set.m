function [ALLEEG EEG] = loading_set(setpath)
    [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
    EEG = pop_loadset(setpath);
end