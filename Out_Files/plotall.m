% Plot all

% 2 year mission
Eff = .2;
% Am241p = Am241(525600:end);
% Am241p = Am241p*Eff;
% Cm244p = Cm244(525600:end);
% Cm244p = Cm244p*Eff;
% Co60p = Co60(525600:end);
% Co60p = Co60p*Eff;
% Cs137p = Cs137(525600:end);
% Cs137p = Cs137p*Eff;
% Pu238p = Pu238(525600:end);
% Pu238p = Pu238p*Eff;
% Sr90p = Sr90(525600:end);
% Sr90p = Sr90p*Eff;
% Tl204p = Tl204(525600:end);
% Tl204p = Tl204p*Eff;
% Pm147p = Pm147(525600:end);
% Pm147p = Pm147p*Eff;
% Kr85p = Kr85(525600:end);
% Kr85p = Kr85p*Eff;
% Ru106p = Ru106(525600:end);
% Ru106p = Ru106p*Eff;

hold on
set(gca,'Fontsize',16);
%plot(Am241*Eff,'-','LineWidth',2)
%plot(Cm244*Eff,'-','LineWidth',2)
plot(Co60*Eff,'--','LineWidth',2)
%plot(Cs137p,'-','LineWidth',2)
%plot(Pu238*Eff,'LineWidth',2)
%plot(Sr90*Eff,'LineWidth',2)
plot(Tl204*Eff,'--','LineWidth',2)
plot(Ru106*Eff,'--','LineWidth',2)
%plot(Kr85p,'-','LineWidth',2)
plot(Pm147*Eff,'--','LineWidth',2)
grid on
%xticks([8760,26280,43800,61320,78840])
myxticks = [365        1095        1825        2555        3285        4014];
myxticks = myxticks*2;
xticks(myxticks)
%xticklabels({'2','4','6','8','10'})
xticklabels({'2','4','6','8','10','12'})
%yticks([4000 4500 5000 5500 6000 6500 7000])
%yticklabels({'4000','4500','5000','5500','6000','6500','7000'})
yline(10,'-','LineWidth',3)
text(2000,9,'Watts Necessary to Maintain Peak Power','FontSize',12)
xlabel("Months",'FontSize',14,'FontWeight','bold')
%ylim([5 25])
ylabel("Electric Power [W]",'FontSize',14,'FontWeight','bold')
%set(gca,'YScale','log')
%legend('AmO_{2}','Cm_{2}O_{3}','Co-Metal','CsCl','PuO_{2}','SrTiO_{3}',...
%    'TlCl','Ru-metal','Kr-gas','Pm_{2}O_{3}')
%legend('AmO_{2}','Cm_{2}O_{3}','PuO_{2}','SrTiO_{3}')
legend('Co-60',...
    'Tl-204','Ru-106','Pm-147','FontSize',14)
%title('Short Half-life Power Spectrum for 1 Year Soldier Power Mission')
hold off

%% How to run description 
% when running run for 12 months 
%Ru 106 44 12 months
%Co 60 30 12 months
%Tl 204 34 12 months
%Pm 147 65 12 months