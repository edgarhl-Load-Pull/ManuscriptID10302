%% -------------------------------------------------------
% Load dataset (optimal output power operating point)
%% -------------------------------------------------------

load('OptimalPower_Performance_data.mat')

%% -------------------------------------------------------
% Interpolation to compare FD-AHLP and TD-AHLP results
% Both datasets are evaluated at the same input power points
%% -------------------------------------------------------

Pin_interp = linspace(min(Pin_Popt_TD),max(Pin_Popt_TD),17);

%% -------- Interpolation FD-AHLP (VNA) --------

Pout_FD_interp = interp1(Pin_Popt_FD,Pout_Popt_FD,Pin_interp,'linear','extrap');
Eff_FD_interp  = interp1(Pin_Popt_FD,Eff_Popt_FD ,Pin_interp,'linear','extrap');

Gain_FD_interp = Pout_FD_interp - Pin_interp;

%% -------- Interpolation TD-AHLP (Oscilloscope) --------

Pout_TD_interp = interp1(Pin_Popt_TD,Pout_Popt_TD,Pin_interp,'linear','extrap');
Eff_TD_interp  = interp1(Pin_Popt_TD,Eff_Popt_TD ,Pin_interp,'linear','extrap');

Gain_TD_interp = Pout_TD_interp - Pin_interp;

%% -------------------------------------------------------
% Plot AM-AM, Gain and Efficiency
%% -------------------------------------------------------

figure(30)
subplot(3,1,[1 2])

yyaxis left; hold on; grid on;

plot(Pin_interp,Pout_FD_interp,'LineStyle','-','color','r','LineWidth',1,'Marker','s')
plot(Pin_interp,Pout_TD_interp,'LineStyle','-','color','b','LineWidth',1,'Marker','o')

plot(Pin_interp,Gain_FD_interp,'LineStyle','-','color','r','LineWidth',1,'Marker','s')
plot(Pin_interp,Gain_TD_interp,'LineStyle','-','color','b','LineWidth',1,'Marker','o')

ylabel('G_p(dB), P_{out}(dBm)','FontSize',14,'FontWeight','bold','Color','k');

set(gca,'FontSize',14,'FontWeight','bold','YColor','k')

xlim([6 16])
ylim([20 42])

yyaxis right; hold on; grid on;

plot(Pin_interp,Eff_FD_interp,'LineStyle','-','color','r','LineWidth',1,'Marker','s')
plot(Pin_interp,Eff_TD_interp,'LineStyle','-','color','b','LineWidth',1,'Marker','o')

ylabel('\eta_d (%)','FontSize',11,'FontWeight','bold','Color','k');

set(gca,'FontSize',14,'FontWeight','bold','YColor','k')

xlim([6 16])
ylim([0 100])

%% -------- Legend --------

for n=[30]
figure(n)

clr_b=[0.00,0.45,0.74];
clr_r=[0.85,0.33,0.10];

h1 = plot(NaN, NaN, '-s',  'Color','r','MarkerEdgeColor', 'r', 'LineWidth', 2,'MarkerSize',9);
h2 = plot(NaN, NaN, '-o', 'Color','b','MarkerFaceColor', 'none', 'LineWidth', 2,'MarkerSize',9);

legend([h1, h2], {'FD-AHLP (VNA)','TD-AHLP (Oscilloscope)'},...
    'Location', 'north','Orientation', 'horizontal', ...
    'NumColumns', 4,'FontSize',9)
end

%% -------------------------------------------------------
% Point-by-point error calculation
%% -------------------------------------------------------

Pout_error = Pout_TD_interp - Pout_FD_interp;
Gain_error = Gain_TD_interp - Gain_FD_interp;
Eff_error  = Eff_TD_interp - Eff_FD_interp;

%% -------------------------------------------------------
% Plot errors
%% -------------------------------------------------------

subplot(3,1,3)

yyaxis left; hold on; grid on;

clr_r=[0.85,0.33,0.10];
clr_b=[0.00,0.45,0.74];

plot(Pin_interp,Pout_error,'Marker','<','Color',clr_r)

set(gca,'TickDir','out','fontweight','bold','FontSize',12)

xlabel('Input Power (dBm)','FontSize',14,'FontWeight','bold')

ylabel('\DeltaP_{out} (dB)','FontWeight','bold','FontSize',9,'Color','k');

set(gca,'FontSize',14,'FontWeight','bold','YColor','k')

xlim([6 16])

yyaxis right; hold on; grid on;

plot(Pin_interp,Eff_error,'LineStyle','--','Marker','>','Color',clr_b)

set(gca,'TickDir','out','fontweight','bold','FontSize',12)

xlabel('Input Power (dBm)','FontSize',14,'FontWeight','bold')

ylabel('\Delta\eta_d (%)','FontWeight','bold','FontSize',9,'Color','k');

set(gca,'FontSize',14,'FontWeight','bold','YColor','k')

xlim([6 16])

%% -------- Legend errors --------

for n=[30]
figure(n)
subplot(3,1,3)

h1 = plot(NaN, NaN, 'LineStyle','-', 'Marker', '<','Color', clr_r,'MarkerEdgeColor', clr_r ,'LineWidth',1,'MarkerSize',6);
h2 = plot(NaN, NaN, 'LineStyle','--','Marker', '>','Color', clr_b,'MarkerFaceColor', 'none','LineWidth',1,'MarkerSize',6);

legend([h1, h2], {'\DeltaP_{out}','\Delta\eta_d'},...
    'Location', 'north','Orientation', 'horizontal', ...
    'NumColumns', 4,'FontSize',9)
end