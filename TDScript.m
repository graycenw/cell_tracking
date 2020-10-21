<<<<<<< Updated upstream
=======
% comment

clear all
clc
>>>>>>> Stashed changes

load("TrackingData.mat")
ModifiedTrackingData;
ModifiedTrackingData(ismember(ModifiedTrackingData.particledetectionx,'0'),:)=[];
L=~ModifiedTrackingData.particledetectionx==0; %true non-zero L values
L_toDelete=ModifiedTrackingData(L,:);
ModifiedTrackingData(~L,:)=[]; %removes columns with L(0)

ModifiedTrackingData(ismember(ModifiedTrackingData.particledetectiony,'0'),:)=[];
M=~ModifiedTrackingData.particledetectiony==0; %true non-zero M values
M_toDelete=ModifiedTrackingData(M,:);
ModifiedTrackingData(~M,:)=[]; %removes columns with M(0)

Lremainders=rem(ModifiedTrackingData.particledetectionx,1);
Ltrue=(Lremainders==0); 
ModifiedTrackingData(Ltrue,:)=[]; %removes columns with L(whole number)

Mremainders=rem(ModifiedTrackingData.particledetectiony,1);
Mtrue=(Mremainders==0);
ModifiedTrackingData(Mtrue,:)=[]; %removes columns with M(whole number)
