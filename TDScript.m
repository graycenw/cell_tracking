load("TrackingData.mat")
ModifiedTrackingData;
ModifiedTrackingData(ismember(ModifiedTrackingData.particledetectionx,'0'),:)=[];
L=~ModifiedTrackingData.particledetectionx==0; %true non-zero L values
L_toDelete=ModifiedTrackingData(L,:);
ModifiedTrackingData(~L,:)=[]; %removes columns with L(0)

ModifiedTrackingData(ismember(ModifiedTrackingData.particledetectiony,'0'),:)=[];
M=~ModifiedTrackingData.particledetectiony==0; %true non-zero M values
M_toDelete=ModifiedTrackingData(M,:);
ModifiedTrackingData(~M,:)=[] %removes columns with M(0)
