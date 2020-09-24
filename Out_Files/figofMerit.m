%% Figure of merit 

clear;
% order Pu, Am , Sr
half = [87.7 432 28]; % halflife
half = half/max(half);
SP = [.42 .096 .6]; % specific power
SP = SP/max(SP);
TE = [30.6 8.52 30.58]; % total energy
TE = TE/max(TE);
PA = [5 8.3 1500]; % potential availability
PA = PA/max(PA); 
CA = [1.5 .5 .7]; % current availability
CA = CA/max(CA);
EFF = [8 6.8 8]; % efficiency
EFF = EFF/max(EFF);
P = [6 25 7]; % price
P = P/max(P);
P = 1 - P;
Shield = [.1 .7 6]; % shielding
Shield = Shield/max(Shield);
Shield = 1 - Shield;
SF = [3.2 2.5 0.5]; % neutron
SF = SF/max(SF);
SF = 1 - SF;
VUS = [10.5 44.8 17.9]; % volume
VUS = VUS/max(VUS);
VUS = 1 - VUS;
VUUV = [1040 4470 1760];
VUUV = VUUV/max(VUUV);
VUUV = 1 - VUUV;
% SP, TE, PA, CA, EFF, P, Shield, SF, V, half
w0 = linspace(0.03,.1,1000);
%w0(:,1) = [];
for i = 1:length(w0)
    w1(i) = 1 - 8*w0(i);
    
end
for i = 1:3
    w0 = [w0;w0];
end
w1 = [w1;w1];
w1 = w1./2;
check = sum(w0) + w1(1,:) + w1(2,:);
if sum(check) == length(check)
    disp('Correct')
    
else 
    disp('Incorrect')
    disp(check)
end

for i = 1:length(Shield)
    FoMSP(i,:) = w0(1,:).*SP(i)+w0(2,:).*TE(i)+w0(3,:).*PA(i)+w0(4,:).*CA(i)+w0(5,:).*EFF(i)+w0(6,:).*P(i) + w1(1,:).*Shield(i) + w1(2,:).*SF(i) + w0(7,:).*VUS(i) + w0(8,:).*(1 - half(i));
    FoMUS(i,:) = SP(i)+TE(i)+PA(i)+CA(i)+EFF(i) + P(i) + Shield(i) + SF(i) + VUS(i) + (1 - half(i));
    FoMUUV(i,:) = half(i)+ SP(i)+TE(i)+PA(i)+CA(i)+EFF(i) + P(i) + Shield(i) + SF(i) + VUUV(i);
end
x = w1(1,:)./w0(1,:);

figure('Name','FoM Soldier Power')
ax = gca;
hold on 
ax.FontSize = 16;
plot(x,FoMSP(1,:),'LineWidth',2)
plot(x,FoMSP(2,:),'LineWidth',2)
plot(x,FoMSP(3,:),'LineWidth',2)
%xline(x(367),'LineWidth',1,'LineStyle','--')
%h = text(5,.6,'Pu/Sr Intersect by Weighting Safety 5x Higher','FontSize',12,'FontWeight','bold');
%set(h,'Rotation',-90);
%set(gca,'XScale','log')
xlabel('Safety Factor (w_{2}/w_{1})','FontSize',14,'FontWeight','bold')
ylabel('Soldier Power Figure of Merit','FontSize',14,'FontWeight','bold')
legend('Pu-238','Am-241','Sr-90','FontSize',12,'FontWeight','bold')
hold off
