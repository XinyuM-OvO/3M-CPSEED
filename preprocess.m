EEG= pop_resample(EEG, 500);
EEG = pop_eegfiltnew(EEG, 'locutoff',4,'hicutoff',45);
EEG = pop_eegfiltnew(EEG, 'locutoff',49,'hicutoff',51,'revfilt',1);
EEG = pop_select( EEG, 'rmchannel',{'ECG','HEOR','HEOL','VEOU','VEOL'});

EEG = pop_iclabel(EEG, 'default');
EEG = pop_icflag(EEG, [NaN NaN;0.9 1;0.9 1;NaN NaN;NaN NaN;NaN NaN;NaN NaN]);