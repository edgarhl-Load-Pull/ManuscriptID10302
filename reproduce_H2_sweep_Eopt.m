%% -------------------------------------------------------
% Reproduce harmonic load-pull results (Efficiency optimum)
% H2 sweep with R2 = 0 and H3 open circuit
%% -------------------------------------------------------

clear; clc

%% -------------------------------------------------------
% Load dataset
%% -------------------------------------------------------

load('SecondHarmonicSweep_H3Open_Eopt_data.mat')

%% -------------------------------------------------------
% Compute Γ2 from second harmonic reactance
%% -------------------------------------------------------

Z2Fo = 1j*ImagH2_Eopt_TD;
Coeff2Fo = (Z2Fo-1)./(Z2Fo+1);

%% -------------------------------------------------------
% FIGURE 9 — Smith chart
%% -------------------------------------------------------

figure(9);

% Optimal impedance (VNA / FD)
d = smithchart(GammaOpt_Eopt_FD);
set(d,'Marker','x','MarkerSize',9,'LineWidth',3,'Color','r')
hold on

% Optimal impedance (Oscilloscope / TD)
d = smithchart(GammaOpt_Eopt_TD);
set(d,'Marker','o','MarkerSize',9,'LineWidth',2,'Color','b')

% Second harmonic impedance
d = smithchart(Coeff2Fo);
set(d,'Marker','o','MarkerSize',9,'LineWidth',1,...
    'Color',[0.00,0.45,0.74],...
    'MarkerFaceColor',[0.00,0.45,0.74])

% Third harmonic open circuit
d = smithchart(1);
set(d,'Marker','hexagram','MarkerSize',14,'LineWidth',2,...
    'Color',[0.49,0.18,0.56],...
    'MarkerFaceColor',[0.49,0.18,0.56])


%% ======================================================
% FIGURE 11 — Output power vs second harmonic reactance
%% ======================================================

% Interpolate VNA data to oscilloscope grid
Pout_FD_interp = interp1(ImagH2_Eopt_FD,PoutH2_Eopt_FD,...
                         ImagH2_Eopt_TD,'linear','extrap');

figure(11)
subplot(3,1,[1 2]); hold on;

% VNA curve
plot(ImagH2_Eopt_TD,Pout_FD_interp,'LineStyle','-','Color','r','LineWidth',1,'Marker','none')
plot(ImagH2_Eopt_TD,Pout_FD_interp,'LineStyle','none','Color','r','Marker','s','MarkerSize',7)

% Oscilloscope curve
plot(ImagH2_Eopt_TD,PoutH2_Eopt_TD,'LineStyle','-','Color','b','LineWidth',1,'Marker','none')
plot(ImagH2_Eopt_TD,PoutH2_Eopt_TD,'LineStyle','none','Color','b','Marker','o','MarkerSize',7)

set(gca,'TickDir','out','FontWeight','bold','FontSize',12)

ylabel('P_{out} (dBm)','FontWeight','bold','FontSize',14)
grid on
xlim([-12 12])

% Legend
h1 = plot(NaN,NaN,'-s','Color','r','LineWidth',1.5,'MarkerSize',7);
h2 = plot(NaN,NaN,'-o','Color','b','LineWidth',1.5,'MarkerSize',7);

legend([h1 h2],{'VNA','Oscilloscope'},...
    'Location','Southeast','Orientation','Vertical',...
    'NumColumns',1,'FontSize',8)

%% ---- Output power error ----

error_Pout = PoutH2_Eopt_TD - Pout_FD_interp;

subplot(3,1,3)

stem(ImagH2_Eopt_TD,error_Pout)

set(gca,'TickDir','out','FontWeight','bold','FontSize',12)

xlabel('Second harmonic reactance','FontSize',14,'FontWeight','bold')
ylabel('\DeltaP_{out} (dB)','FontWeight','bold','FontSize',14)

grid on
xlim([-12 12])


%% ======================================================
% FIGURE 12 — Efficiency vs second harmonic reactance
%% ======================================================

Eff_FD_interp = interp1(ImagH2_Eopt_FD,EffH2_Eopt_FD,...
                        ImagH2_Eopt_TD,'linear','extrap');

figure(12)
subplot(3,1,[1 2])
hold on

% VNA curve
plot(ImagH2_Eopt_TD,Eff_FD_interp,'LineStyle','-','Color','r','LineWidth',1,'Marker','none')
plot(ImagH2_Eopt_TD,Eff_FD_interp,'LineStyle','none','Color','r','Marker','s','MarkerSize',7)

% Oscilloscope curve
plot(ImagH2_Eopt_TD,EffH2_Eopt_TD,'LineStyle','-','Color','b','LineWidth',1,'Marker','none')
plot(ImagH2_Eopt_TD,EffH2_Eopt_TD,'LineStyle','none','Color','b','Marker','o','MarkerSize',7)

set(gca,'TickDir','out','FontWeight','bold','FontSize',12)

ylabel('\eta_d (%)','FontWeight','bold','FontSize',14)
grid on
xlim([-12 12])

% Legend
h1 = plot(NaN,NaN,'-s','Color','r','LineWidth',1.5,'MarkerSize',7);
h2 = plot(NaN,NaN,'-o','Color','b','LineWidth',1.5,'MarkerSize',7);

legend([h1 h2],{'VNA','Oscilloscope'},...
    'Location','Southeast','Orientation','Vertical',...
    'NumColumns',1,'FontSize',8)

%% ---- Efficiency error ----

error_Eff = EffH2_Eopt_TD - Eff_FD_interp;

subplot(3,1,3)

stem(ImagH2_Eopt_TD,error_Eff)

set(gca,'TickDir','out','FontWeight','bold','FontSize',12)

xlabel('Second harmonic reactance','FontSize',14,'FontWeight','bold')
ylabel('\Delta\eta_d (%)','FontWeight','bold','FontSize',14)

grid on
xlim([-12 12])