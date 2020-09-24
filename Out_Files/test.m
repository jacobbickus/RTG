clear;
SF = [0,0,6.2E-6,1.4E-4,0,1.9E-7,0,0,0,0,0,0,4E-10];
SF = SF*1E11;
for i=1:length(SF)
    if SF(i) ==0
        SF(i) =1;
    end
end

rho = [8.16,2.64,13.52,13.52,9.51,19.329,7.26,9.32,8.86,1.93,12.45,3.479,12];
SF = SF/max(SF);
HL = [.78,28.8,.45,18.1,.38,87.7,2.62,.35,5.24,30,1.02,10.76,432];
HL = HL/max(HL);
Shield = [10.2,6,.1,2,1.1,.01,8.1,2.6,9.5,4.6,9.2,9.0,.7];
Shield = Shield/max(Shield);
cost = [50,20,2000,170,2800,300,75,136,280,6.5,120,.33,1500];
cost = cost/max(cost);

SP = [25.6,.96,120,2.65,141,.56,.33,13.6,1.74,.42,33.1,.6,.097];
P = 1000;
M = P./SP;
V = M./rho;
V = V./max(V);
SP = SP/max(SP);
Access = [400, 1500, 50, 75, 0.1,1400, 400, 50000, 228, 3200, 250,.75, 850];
Access = Access/max(Access);
FOM = 0.01.*HL.*0.01.*SP.*0.01.*Access./(0.93.*cost.*0.01.*Shield.*0.01.*SF.*0.02.*V);
FOM2 = HL.*SP.*Access./(cost.*Shield.*SF.*V);
 %x = categorical({'Ce-144','Sr-90','Cm-242','Cm-244','Po-210',...
%     'Pu-238','Pm-147','Tm-170','Co-60','Cs-137','Ru-106','Kr085','Am-241'});
 %x = categorical({'Sr-90','Cm-244','Pu-238','Co-60','Cs-137','Kr085','Am-241'});
 x = categorical({'Ce-144','Cm-242','Po-210','Pm-147','Tm-170','Ru-106'});
 %FOM = [FOM(2),FOM(4),FOM(6),FOM(9),FOM(10),FOM(12),FOM(13)];
 FOM = [FOM(1),FOM(3),FOM(5),FOM(7),FOM(8),FOM(11)];
 FOM2 = [FOM2(1),FOM2(3),FOM2(5),FOM2(7),FOM2(8),FOM2(11)];
 cost = [cost(1),cost(3),cost(5),cost(7),cost(8),cost(11)];
 bar(x,FOM)
 xlabel('Isotope')
 ylabel('Figure of Merit [arb units]')
 title('FOM Weighting Cost 3x')
 set(gca,'YScale','log')