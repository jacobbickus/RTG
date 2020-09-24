% Specific Activities

x = categorical({'PuO_{2}','AmO_{2}','Po-Metal','CsCl','Pm_{2}O_{3}','SrTiO_{3}'...
    ,'Ce_{2}O_{3}','Co-Metal','Cm_{2}O_{3}','Tm_{2}O_{3}','TlCl'});
y = [Pu238(1),Am241(1),Po210(1),Cs137(1),Pm147(1),Sr90(15),Ce144(1),Co60(1)...
    ,Cm244(1),Tm170(1),Tl204(1)];
z = [Pu1(1),Am1(1),Po1(1),Cs1(1),Pm1(1),Sr1(15),Ce1(1),Co1(1)...
    ,Cm1(1),Tm1(1),Tl1(1)];
T = [0 0];
for i =1:length(y)
    T = [T;y(i),z(i)];
end
T(1,:) = [];
hold on
set(gca,'FontSize',14)
bar(x,T)
xlabel('Most Likely Compound Form','FontSize',14,'FontWeight','bold')
ylim([0 1000])
ylabel('Specific Power [W/g]','FontSize',14,'FontWeight','bold')
set(gca,'YScale','log')
title('Initial Specific Power','FontSize',14,'FontWeight','bold')
legend('Theoritical Max/Pure Isotope',...
    'Accounting for Impurities/Compound Form','FontSize',12)