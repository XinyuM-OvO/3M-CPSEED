function cov_matrix = covariances(data)
% 输入: data 为三维矩阵 [channels × samples × trials]
% 输出: cov_matrix 为协方差矩阵 [channels × channels × trials]

[channels, samples, trials] = size(data);
cov_matrix = zeros(channels, channels, trials);

for i = 1:trials
    trial_data = data(:, :, i);  % 提取第i个试次的数据
    trial_data = trial_data - mean(trial_data, 2);  % 去除均值（中心化）
    cov_trial = (trial_data * trial_data') / (samples - 1);  % 计算协方差
    cov_matrix(:, :, i) = cov_trial;
end
end