

load('TrackingData.mat')


Lremainders=rem(ModifiedTrackingData.particledetectionx,1);
Ltrue=(Lremainders==0); 
ModifiedTrackingData(Ltrue,:)=[]; %removes columns with L(whole number)

Mremainders=rem(ModifiedTrackingData.particledetectiony,1);
Mtrue=(Mremainders==0);
ModifiedTrackingData(Mtrue,:)=[]; %removes columns with M(whole number)

x=12;
TimePointTotals=ModifiedTrackingData.particlenSpots>=x;
ModifiedTrackingData(~TimePointTotals,:)=[]; %removes data with less than x time points

CellChange=ischange(ModifiedTrackingData.particleid); %finds changes in particleid
ModifiedTrackingData.deltax=double(CellChange);
ModifiedTrackingData.deltax(1)=1; 
y=nnz(ModifiedTrackingData.particleid==(max(ModifiedTrackingData.particleid)))-1;
 
isChangexIND=[1;find(diff(ModifiedTrackingData.particleid))+1]; %index when id changes
for i=1:(length(isChangexIND)-1)
    IND1=isChangexIND(i);
    IND2=isChangexIND(i+1)+y;
    
    
    ModifiedTrackingData.deltax(IND1:IND2)=ModifiedTrackingData.particledetectionx(IND1:IND2)-ModifiedTrackingData.particledetectionx(IND1);
    %difference between particle x and original x positions
end
 
ModifiedTrackingData.deltay=double(CellChange);
ModifiedTrackingData.deltay(1)=1;
 
isChangeyIND=[1;find(diff(ModifiedTrackingData.particleid))+1];
for i=1:(length(isChangeyIND)-1)
    IND1=isChangeyIND(i);
    IND2=isChangeyIND(i+1)+y;
    
    
    ModifiedTrackingData.deltay(IND1:IND2)=ModifiedTrackingData.particledetectiony(IND1:IND2)-ModifiedTrackingData.particledetectiony(IND1);
    %difference between particle y and original y positions
end
 
ModifiedTrackingData.deltax(ModifiedTrackingData.deltax==0)=0;
delta2x=diff(ModifiedTrackingData.deltax);  delta2x(isnan(delta2x))=0;

ModifiedTrackingData.deltay(ModifiedTrackingData.deltay==0)=0;
delta2y=diff(ModifiedTrackingData.deltay); delta2y(isnan(delta2y))=0;

deltaposition=sqrt(delta2x.^2+delta2y.^2);
ModifiedTrackingData.deltapos=[0;deltaposition];

zeroIND=ModifiedTrackingData.deltax==0;
for i=1:(length(zeroIND))
    ModifiedTrackingData.deltapos(zeroIND)=NaN; 
    %makes the first timepoint of each cell have deltapos of NaN
end

