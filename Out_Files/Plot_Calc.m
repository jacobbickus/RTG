%% C++ File Analysis
function Power = Plot_Calc(element,daughters)

% if daughters > 1
%     for i=1:daughters
%     element(1) = [];
%     end
% end
index = 1:length(element)/daughters;
index2 = 1+length(element)/daughters:length(element);
Power = zeros(1,length(element)/daughters);

if daughters == 1
    Power = element;
else
    Power = element(index) + element(index2);
end
Power(end) =[];

    
% Dont forget to change figure name 
a = figure('Name', 'Specific Power');
hold on
plot(Power)
grid on
% xticks([17520,35040,52560,70080,87600,96357])
xticks([8760,17520,26280])
xticklabels({'1','2','3'})
yline(5000,'-.',{'Watts Necessary to Maintain'})
xlabel("Years");
ylabel("Power [W]")
title('Specific Power over 3 Years')

end
%% Notes 
% All at one gram 
% Ce144 60 months done. unit hours x axis
% Co60 20 years done.
% Cs137 20 years done.
% Sr90 20 years done
% Pu238 100 years done.
% Pm147
% Am241 105 years done.


