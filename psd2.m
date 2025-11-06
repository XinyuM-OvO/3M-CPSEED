function [PSD, SelectFilterFreq] = MI_PSD(x,FreqRange,fs)
% input：x：eeg， time*channel
%           FreqRange：The frequency range of interest  for example，[5 30]
%           fs: frequency
% output：PSD:  psd*channel
%           SelectFilterFreq： freq*channel
%
%        written by zhang rui in 2012.09.15
%

PSD_windowlength = fs;

Nfft=fs*2;
ChanNum=size(x,2);
for i=1:ChanNum
    [PSD(:,i) FilterFeq]=pwelch(x(:,i),PSD_windowlength,[],Nfft,fs);
end
[r,c,v]=find(PSD==inf);
if ~isempty(v)
    fprintf('row:%d col:%d is inf error\n',r,c);
end
FeqLow=find(FilterFeq>=FreqRange(1),1,'first');
FeqUp=find(FilterFeq<=FreqRange(2),1,'last');
FeqSeqRange=FeqLow:FeqUp;
PSD=PSD(FeqSeqRange,:);
SelectFilterFreq=FilterFeq(FeqSeqRange,:);


