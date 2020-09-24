%x = categorical({'PuO_{2}','AmO_{2}','SrTiO_{3}','Cm_{2}O_{3}'});
Pu238p = Pu238(8760:end);
Am241p = Am241(8760:end);
Cm244p = Cm244(8760:end);
Sr90p = Sr90(8760:end);
Pu238p = Pu238p*.2;
Am241p = Am241p*.2;
Sr90p = Sr90p*.2;
Cm244p = Cm244p*.2;

hold on 
plot(Pu238p,'--','LineWidth',2)
plot(Am241p,'--','LineWidth',2)
plot(Sr90p,'--','LineWidth',2)
plot(Cm244p,'--','LineWidth',2)
yline(1000,'-','LineWidth',4)
ylim([800 1800])
text(35040,950,'Minimum 1kW Peak Power Maintained',...
    'FontSize',14,'FontWeight','bold')
xticks([17520,35040,52560,70080,87600])
xticklabels({'2','4','6','8','10'})
legend('PuO_{2} 13kg','AmO_{2} 53.1kg','SrTiO_{3} 10.7kg',...
    'Cm_{2}O_{3} 16.4kg','FontSize',14,'FontWeight','bold')
hold off
x = categorical({'PuO_{2}','AmO_{2}','SrTiO_{3}','Cm_{2}O_{3}','TlCl',...
    'Pm_{2}O_{3}'});
y = [12115 52330 8800 12100 4830 11000];
y = y/1000;
figure('Name','Year Quanities')
bar(x,y)
