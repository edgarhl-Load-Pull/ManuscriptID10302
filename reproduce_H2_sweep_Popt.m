%% -------------------------------------------------------
% Reproduce harmonic load-pull figures (Popt)
% H2 sweep (R2 = 0), H3 open circuit
%% -------------------------------------------------------

clear; clc

%% -------- Load dataset --------
load('SecondHarmonicSweep_H3Open_Popt_data.mat')

%% -------- Compute Γ2 from reactance --------
Z2Fo = 1j*ImagH2_Popt_TD;
Gamma2Fo = (Z2Fo-1)./(Z2Fo+1);

%% ======================================================
% FIGURE 9 – Smith chart
%% ======================================================

figure(9)

d = smithchart(GammaOpt_FD);
set(d,'Marker','x','MarkerSize',9,'LineWidth',3,'Color','r')
hold on

d = smithchart(GammaOpt_TD);
set(d,'Marker','o','MarkerSize',9,'LineWidth',2,'Color','b')

d = smithchart(Gamma2Fo);
set(d,'Marker','o','MarkerSize',9,'LineWidth',1,...
      'Color',[0 0.45 0.74],'MarkerFaceColor',[0 0.45 0.74])

d = smithchart(1); % H3 open circuit
set(d,'Marker','hexagram','MarkerSize',14,'LineWidth',2,...
      'Color',[0.49 0.18 0.56],'MarkerFaceColor',[0.49 0.18 0.56])

%% ======================================================
% FIGURE 11 – Pout vs H2 reactance
%% ======================================================

Pout_FD_interp = interp1(ImagH2_Popt_FD,PoutH2_Popt_FD,...
                         ImagH2_Popt_TD,'linear','extrap');

figure(11)

subplot(3,1,[1 2])
hold on

plot(ImagH2_Popt_TD,Pout_FD_interp,'-r','LineWidth',1)
plot(ImagH2_Popt_TD,Pout_FD_interp,'LineStyle','none','Marker','s','Color','r','MarkerSize',7)

plot(ImagH2_Popt_TD,PoutH2_Popt_TD,'-b','LineWidth',1)
plot(ImagH2_Popt_TD,PoutH2_Popt_TD,'LineStyle','none','Marker','o','Color','b','MarkerSize',7)

ylabel('P_{out} (dBm)','FontWeight','bold','FontSize',14)
grid on
xlim([-12 12])
ylim([38.6 40.6])

set(gca,'TickDir','out','FontWeight','bold','FontSize',12)

h1 = plot(NaN,NaN,'-s','Color','r','LineWidth',1.5,'MarkerSize',7);
h2 = plot(NaN,NaN,'-o','Color','b','LineWidth',1.5,'MarkerSize',7);

legend([h1 h2],{'VNA','Oscilloscope'},...
       'Location','southeast','FontSize',8)

%% ---- Pout error ----

error_Pout = PoutH2_Popt_TD - Pout_FD_interp;

subplot(3,1,3)

stem(ImagH2_Popt_TD,error_Pout)

xlabel('Second harmonic reactance','FontSize',14,'FontWeight','bold')
ylabel('\DeltaP_{out} (dB)','FontSize',14,'FontWeight','bold')

grid on
xlim([-12 12])
ylim([-0.08 0.19])

set(gca,'TickDir','out','FontWeight','bold','FontSize',12)

%% ======================================================
% FIGURE 12 – Efficiency vs H2 reactance
%% ======================================================

Eff_FD_interp = interp1(ImagH2_Popt_FD,EffH2_Popt_FD,...
                        ImagH2_Popt_TD,'linear','extrap');

figure(12)

subplot(3,1,[1 2])
hold on

plot(ImagH2_Popt_TD,Eff_FD_interp,'-r','LineWidth',1)
plot(ImagH2_Popt_TD,Eff_FD_interp,'LineStyle','none','Marker','s','Color','r','MarkerSize',7)

plot(ImagH2_Popt_TD,EffH2_Popt_TD,'-b','LineWidth',1)
plot(ImagH2_Popt_TD,EffH2_Popt_TD,'LineStyle','none','Marker','o','Color','b','MarkerSize',7)

ylabel('\eta_d (%)','FontWeight','bold','FontSize',14)
grid on
xlim([-12 12])

set(gca,'TickDir','out','FontWeight','bold','FontSize',12)

h1 = plot(NaN,NaN,'-s','Color','r','LineWidth',1.5,'MarkerSize',7);
h2 = plot(NaN,NaN,'-o','Color','b','LineWidth',1.5,'MarkerSize',7);

legend([h1 h2],{'VNA','Oscilloscope'},...
       'Location','southeast','FontSize',8)

%% ---- Efficiency error ----

error_Eff = EffH2_Popt_TD - Eff_FD_interp;

subplot(3,1,3)

stem(ImagH2_Popt_TD,error_Eff)

xlabel('Second harmonic reactance','FontSize',14,'FontWeight','bold')
ylabel('\Delta\eta_d (%)','FontSize',14,'FontWeight','bold')

grid on
xlim([-12 12])

set(gca,'TickDir','out','FontWeight','bold','FontSize',12)
