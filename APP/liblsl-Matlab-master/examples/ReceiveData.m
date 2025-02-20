%% instantiate the library
disp('Loading the library...');
lib = lsl_loadlib();

% resolve a stream...
disp('Resolving an EEG stream...');
result = {};
while isempty(result)
    result = lsl_resolve_byprop(lib,'type','EEG'); end

% create a new inlet
disp('Opening an inlet...');
inlet = lsl_inlet(result{1});

disp('Now receiving data...');
figure(1);
i = 1;
data = [];
while true
    % get data from the inlet
    [vec,ts] = inlet.pull_sample();
    
    data(i, :) = vec;
    times(i) = ts;
    % and display it
    fprintf('%.2f\t',vec);
    fprintf('%.5f\n',ts);
    for j = 1 : 8
        plot(times(1:i), data(1:i, j) + 10 * j)
    end
     i = i+1;

end