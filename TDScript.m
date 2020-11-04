
load("TrackingData.mat")

Lremainders=rem(ModifiedTrackingData.particledetectionx,1);
Ltrue=(Lremainders==0); 
ModifiedTrackingData(Ltrue,:)=[]; %removes columns with L(whole number)

Mremainders=rem(ModifiedTrackingData.particledetectiony,1);
Mtrue=(Mremainders==0);
ModifiedTrackingData(Mtrue,:)=[]; %removes columns with M(whole number)

x=12;
TimePointTotals=ModifiedTrackingData.particlenSpots>=x;
ModifiedTrackingData(~TimePointTotals,:)=[]; %removes data with less than x time points

Change=diff(ModifiedTrackingData.particledetectiont);
TrueChange=Change<0;
TrueChange(1)=1;
%This makes it so that the true values are the first timepoints so we would
%subtract those from the other values, but I don't know how to do that


