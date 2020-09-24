k = 1.645; % based on 95% confidence factor 
Ro = [614,815,788,790];
% NYC, Boston, LA, Denver
Ts = 60; % source sample time min
To = 1; % background sample time min
eff = .25; % detector efficnecy 
A = 100; % detector area cm^2
f = 1; % branching ratio is 1 for each isotope 

USL = 4; % mSv allowable to civilian population per hour 
specA = [17,3.43,142];


%% Calculate steps

Lc = 1.645*sqrt((Ro/To)*1 + (To/Ts));
theta = 60*A*eff*f; 
sqrtStep = sqrt((USL*theta + k^2/(2*Ts))^2 - ((USL*theta)^2 - Lc.^2 - k^2*(Ro/Ts)));
Amax = USL + (((k^2/(2*Ts)) - sqrtStep)/theta);
