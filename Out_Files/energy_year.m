% plot energy_year

x = categorical({'AmO_{2}','Cm_{2}O_{3}','Co-60','CsCl','PuO_{2}','SrTiO_{3}','TlCl'});
y = [42.6, 35.9, 41.0, 66.1, 153.0, 152.9, 21.9];
%x = categorical({'AmO_{2}','PuO_{2}','SrTiO_{3}'});
%y = [42.6,153,152.9];
z = y*.066;
y = y*.20;

ax = gca;
hold on 
bar(x,y)
bar(x,z)
ax.FontSize = 18;
legend('RITPV','Seebeck RTG','FontSize',14,'FontWeight','bold')
ylabel('Total Energy [kWeh/g]','FontSize',14,'FontWeight','bold')
xlabel('Compound','FontSize',14,'FontWeight','bold')
%title('Total Radioisotope Energy Capacity For Achievable Mission Times',...
 %   'FontSize',14,'FontWeight','bold')
text(.85,10,'50 yr','FontSize',14,'FontWeight','bold')
text(1.75,9,'10 yr','FontSize',14,'FontWeight','bold')
text(2.75,10,'2 yr','FontSize',14,'FontWeight','bold')
text(3.75,15,'20 yr','FontSize',14,'FontWeight','bold')
text(4.75,32,'50 yr','FontSize',14,'FontWeight','bold')
text(5.75,32,'20 yr','FontSize',14,'FontWeight','bold')
text(6.75,6, '2 yr','FontSize',14,'FontWeight','bold')
hold off