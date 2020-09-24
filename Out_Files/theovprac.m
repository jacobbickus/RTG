%% Theo vs Prac Calculation 

am241 = importdata('Am241.dat');
Am241 = am241(10);
ce144 = importdata('Ce144.dat');
Ce144 = ce144(10);
sr90 = importdata('Sr90.dat');
Sr90 = sr90(10);
cm242 = importdata('Cm242.dat');
Cm242 = cm242(10);
cm244 = importdata('Cm244.dat');
Cm244 = cm244(10);
po210 = importdata('Po210.dat');
Po210 = po210(10);
pu238 = importdata('Pu238.dat');
Pu238 = pu238(10);
pm147 = importdata('Pm147.dat');
Pm147 = pm147(10);
tm170 = importdata('Tm170.dat');
Tm170 = tm170(10);
co60 = importdata('Co60.dat');
Co60 = co60(10);
cs137 = importdata('Cs137.dat');
Cs137 = cs137(10);
ru106 = importdata('Ru106.dat');
Ru106 = ru106(10);
kr85 = importdata('Kr85.dat');
Kr85 = kr85(10);
h3 = importdata('H3.dat');
H3 = h3(10);
tl204 = importdata('Tl204.dat');
Tl204 = tl204(10);

%% Plot data 
x = categorical({'AmO_2','Ce_2O_3','Cm_2O_3','Co-60','CsCl','Pm_2O_3'};
bar(x,y)

