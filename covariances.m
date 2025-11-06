function cov_matrix = covariances(data)
% input: "data" is a three-dimensional matrix [channels × samples × trials]
% output: cov_matrix is the covariance matrix [channels × channels × trials]

[channels, samples, trials] = size(data);
cov_matrix = zeros(channels, channels, trials);

for i = 1:trials
    trial_data = data(:, :, i);  % Extract the data of the i-th trial
    trial_data = trial_data - mean(trial_data, 2);  % Remove the mean (centralization)
    cov_trial = (trial_data * trial_data') / (samples - 1);  % Calculate the covariance
    cov_matrix(:, :, i) = cov_trial;
end

end
