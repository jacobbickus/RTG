x = categorical({'PuO_{2}','AmO_{2}','SrTiO_{3}','Cm_{2}O_{3}',...
    'Pm_{2}O_{3}','Co-Metal','CsCl','Ru-Metal','Kr-85 Gas','TlCl'});
y_2 = [121 523 86 116 85 35 312 85 36 41];
y_21 = [11975,52205,8460,11375,7370,3205,30780,6000,3460,3665];
y_22 = [1193300,5216900,837500,112000,66100,303200,3050000,45700,33600,33950];
Y = [0 0 0];
for i =1:length(y_2)
    Y = [Y;y_2(i),y_21(i),y_22(i)];
end
Y(1,:) = [];

figure
hold on
bar(x,Y)
set(gca,'FontSize',14)
ylim([0 1E9])
yline(14300,'g--','LineWidth',3)
yline(1700,'m:','LineWidth',3)
%text(3,18000,'Bluefin-12 1.5 kW-Hr Battery Mass = 14300','FontSize',14,'FontWeight','bold')
ylabel('Mass of Fuel Necessary [grams]','FontSize',14,'FontWeight','bold')
xlabel('Fuel Compound','FontSize',14,'FontWeight','bold')
set(gca,'YScale','log')
legend('Year Unattended Sensor Mission min 10 W','6 Month UUV Mission min 1000 W',...
    '1 Month UAV Mission min 100 kW','Bluefin-12 1.5 kW-Hr Battery Mass = 14300','Jenny 600S Battery Mass =1700','FontSize',12) 
%title('Mission-Contingent Fuel Mass Necessary')
hold off


density = [11.5,11.68,4.81,13.51,7.26,8.86,3.99,12.45,3.479,7];
Volume_1 = y_2./density;
Volume_2 = y_21./density;
Volume = [0 0];
for i =1:length(y_2)
    Volume = [Volume;Volume_1(i), Volume_2(i)];
end

Volume(1,:) = [];
figure
hold on
bar(x,Volume)
set(gca,'YScale','log')
set(gca,'FontSize',14)
yline(3431,'--','LineWidth',2)
yline(10725,'--','LineWidth',2)
text(3,15500,'Bluefin-12 1.5 kW-Hr Battery Volume = 10725','FontSize',14,'FontWeight','bold')
text(5,5000,'Jenny Battery Volume = 3431','FontSize',14,'FontWeight','bold')
ylim([0 1E6])
xlabel('Fuel Compound','FontSize',14,'FontWeight','bold')
ylabel('Fuel Volume [cm^3]','FontSize',14,'FontWeight','bold')
legend('Year Unattended Sensor Mission min 10 W',...
    '6 Month UUV Mission min 1000 W','FontSize',12)
%title('Fuel Volume Necessary for Reasonable Missions')
hold off