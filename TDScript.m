clear all
clc

% Load TrackMate output
%     Ultimately, we want to be able to import directly from an Excel
%     document
load("TrackingData.mat")
ModifiedTrackingData;

% Remove tracked points where both the x and y coordinates are integers
L=rem(ModifiedTrackingData.particledetectionx,1)~=0;
M=rem(ModifiedTrackingData.particledetectiony,1)~=0;

N=ones(size(L));
for i=1:length(L)
    if L(i,1)==0 && M(i,1)==0
        N(i,1)=0;
    end
end

ModifiedTrackingData(~N,:)=[];

% Remove cells with fewer than the designated number of consecutive
% timepoints tracked

