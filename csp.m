
data1=load('data1.mat');
data1=data1.data;
data2=load('data2.mat');
data2=data2.data;

cov1 = mean(covariances(data1), 3); 
cov2 = mean(covariances(data2), 3);


[W, D] = eig(cov1, cov1 + cov2);
[~, idx] = sort(diag(D), 'descend');
W = W(:, idx); 


csp_components = W(:, [1:2 end-1:end]);
csp_components = csp_components ./ max(abs(csp_components(:)));
num_components = size(csp_components, 2);



ALLEEG_csp = eeg_emptyset();
ALLEEG_csp.data = [];
ALLEEG_csp.chanlocs = ALLEEG.chanlocs; 
ALLEEG_csp.nbchan = num_components;
ALLEEG_csp.icawinv = csp_components; 


figure;
for i = 1:num_components
    subplot(2, 4, i);
    topoplot(ALLEEG_csp.icawinv(:, i), ALLEEG_csp.chanlocs, 'electrodes', 'on');
    title(['CSP Component ' num2str(i)]);
end
