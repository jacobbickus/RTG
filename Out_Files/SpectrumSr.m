%% Secular Equilibrium proof
eff = .2;
Ru106p = Ru106*eff;
Sr90p = Sr90*eff;

hold on
set(gca,'FontSize',16)
plot(Sr90p,'LineWidth',3)
plot(Ru106p,'LineWidth',3)
%set(gca,'YScale','log')
xticks([7200,14400,28800,43200])
xticklabels({'5','10','20','30'})
legend('Sr-90','Ru-106','FontSize',14,'FontWeight','bold')
ylabel('Power [W]','FontSize',14,'FontWeight','bold')
xlabel('Days','FontSize',14,'FontWeight','bold')
%title('Power Growth within first Month','FontSize',14,'FontWeight','bold')


hold off

%% How to run Discription 

% Here you run RTG for a month at 100 kg 