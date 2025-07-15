clear all;clc;close all;
fs = 500;  %采样频率
FreqRange2 = [4 8];  %滤波频带
FreqRange3 = [8 13];  %
FreqRange4 = [13 30];
nchan =32;  %目标导联
      temp=mean(data,3);       
     trail_Data_sect=temp; 
        for k = 1:nchan         
                data_new=trail_Data_sect(k,:);   
                 [psd2(:,k),SelectFilterFreq2] = MI_PSD(data_new',FreqRange2,fs);  
                 [psd3(:,k),SelectFilterFreq3] = MI_PSD(data_new',FreqRange3,fs);  
                 [psd4(:,k),SelectFilterFreq4] = MI_PSD(data_new',FreqRange4,fs);   
        end
%              
                 mean_nc_psd2=mean(psd2,1);  
                 mean_nc_psd3=mean(psd3,1);  
                 mean_nc_psd4=mean(psd4,1);                
%           
          trail_nc_psd2(1,:)=mean_nc_psd2;
          trail_nc_psd3(1,:)=mean_nc_psd3;
          trail_nc_psd4(1,:)=mean_nc_psd4;
            figure;
   topoplot(mean_nc_psd2,EEG.chanlocs);
    caxis([0,0.020]);
              figure;
   topoplot(mean_nc_psd3,EEG.chanlocs);
   caxis([0,0.020]);
              figure;
   topoplot(mean_nc_psd4,EEG.chanlocs);
  caxis([0,0.005]);
