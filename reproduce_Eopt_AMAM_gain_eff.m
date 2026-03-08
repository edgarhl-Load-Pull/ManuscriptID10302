%% -------------------------------------------------------
% Reproduce AM-AM, gain and efficiency curves
% at the optimal efficiency operating point (Eopt)
%% -------------------------------------------------------

clear; clc;

%% -------- Load dataset --------

load('OptimalEfficiency_Performance_data.mat')

%% -------- Interpolation grid --------
% common Pin axis for comparison

Pin_interp = linspace(min(Pin_Eopt_TD),max(Pin_Eopt_TD),17);

%% -------- Interpolation FD-AHLP (VNA) --------

Pout_FD_interp = interp1(Pin_Eopt_FD,Pout_Eopt_FD,Pin_interp,'linear','extrap');
Eff_FD_interp  = interp1(Pin_Eopt_FD,Eff_Eopt_FD ,Pin_interp,'linear','extrap');

Gain_FD_interp = Pout_FD_interp - Pin_interp;

%% -------- Interpolation TD-AHLP (Oscilloscope) --------

Pout_TD_interp = interp1(Pin_Eopt_TD,Pout_Eopt_TD,Pin_interp,'linear','extrap');
Eff_TD_interp  = interp1(Pin_Eopt_TD,Eff_Eopt_TD ,Pin_interp,'linear','extrap');

Gain_TD_interp = Pout_TD_interp - Pin_interp;

%% -------------------------------------------------------
% Plot curves
%% -------------------------------------------------------

figure(4)

subplot(3,1,[1 2])

yyaxis left
hold on
grid on

plot(Pin_interp,Pout_FD_interp,'LineStyle','-','color','r','LineWidth',1,'Marker','s')
plot(Pin_interp,Pout_TD_interp,'LineStyle','-','color','b','LineWidth',1,'Marker','o')

plot(Pin_interp,Gain_FD_interp,'LineStyle','-','color','r','LineWidth',1,'Marker','s')
plot(Pin_interp,Gain_TD_interp,'LineStyle','-','color','b','LineWidth',1,'Marker','o')

ylabel('G_p(dB), P_{out}(dBm)','FontSize',14,'FontWeight','bold','Color','k')

set(gca,'FontSize',14,'FontWeight','bold','YColor','k')

yyaxis right

plot(Pin_interp,Eff_FD_interp,'LineStyle','-','color','r','LineWidth',1,'Marker','s')
plot(Pin_interp,Eff_TD_interp,'LineStyle','-','color','b','LineWidth',1,'Marker','o')

ylabel('\eta_d (%)','FontSize',11,'FontWeight','bold','Color','k')

set(gca,'FontSize',14,'FontWeight','bold','YColor','k')

xlim([7 18])
ylim([0 100])

%% -------- Legend --------

clr_b=[0.00,0.45,0.74];
clr_r=[0.85,0.33,0.10];

h1 = plot(NaN, NaN, '-s',  'Color','r','MarkerEdgeColor', 'r','LineWidth',2,'MarkerSize',9);
h2 = plot(NaN, NaN, '-o',  'Color','b','MarkerFaceColor','none','LineWidth',2,'MarkerSize',9);

legend([h1,h2],{'VNA','Oscilloscope'}, ...
       'Location','north','Orientation','horizontal', ...
       'NumColumns',4,'FontSize',9)

%% -------------------------------------------------------
% Error calculation
%% -------------------------------------------------------

Pout_error = Pout_TD_interp - Pout_FD_interp;
Gain_error = Gain_TD_interp - Gain_FD_interp;
Eff_error  = Eff_TD_interp  - Eff_FD_interp;

%% -------------------------------------------------------
% Plot errors
%% -------------------------------------------------------

subplot(3,1,3)

yyaxis left
hold on
grid on

plot(Pin_interp,Pout_error,'Marker','<','Color',clr_r)

ylabel('\DeltaP_{out} (dB)','FontWeight','bold','FontSize',9,'Color','k')

set(gca,'FontSize',14,'FontWeight','bold','YColor','k')

xlim([7 18])

yyaxis right

plot(Pin_interp,Eff_error,'LineStyle','--','Marker','>','Color',clr_b)

ylabel('\Delta\eta_d (%)','FontWeight','bold','FontSize',9,'Color','k')

xlabel('Input Power (dBm)','FontSize',14,'FontWeight','bold')

set(gca,'FontSize',14,'FontWeight','bold','YColor','k')

xlim([7 18])

%% -------- Legend errors --------

h1 = plot(NaN,NaN,'LineStyle','-','Marker','<','Color',clr_r,'LineWidth',1,'MarkerSize',6);
h2 = plot(NaN,NaN,'LineStyle','--','Marker','>','Color',clr_b,'LineWidth',1,'MarkerSize',6);

legend([h1,h2],{'ΔP_{out}','Δ\eta_d'}, ...
       'Location','north','Orientation','horizontal', ...
       'NumColumns',4,'FontSize',9)