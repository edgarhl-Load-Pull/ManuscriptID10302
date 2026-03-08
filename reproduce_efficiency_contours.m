clear
clc

%% Load dataset
load('Contour_Eff_data.mat')

%% -------- FD-AHLP Efficiency --------

[X,Y] = meshgrid( ...
    linspace(min(DataX1),max(DataX1)), ...
    linspace(min(DataY1),max(DataY1)));

F_Eff = TriScatteredInterp(DataX1,DataY1,DataZ1);
Z_out = F_Eff(X,Y);

figure(2)
hold on
contour(X,Y,Z_out,30,'-','LineWidth',3)

%% -------- TD-AHLP Efficiency --------

[X,Y] = meshgrid( ...
    linspace(min(DataX2),max(DataX2)), ...
    linspace(min(DataY2),max(DataY2)));

F_Eff = TriScatteredInterp(DataX2,DataY2,DataZ2(:));
Z_out = F_Eff(X,Y);

contour(X,Y,Z_out,20,':','LineWidth',3)

%% Plot configuration

grid on
axis([-0.6 0.1 0.1 0.6])

colormap('cool')
colorbar

set(gca,'FontSize',24,'FontWeight','bold')

xlabel('Real(\Gamma_L)','FontSize',28,'FontWeight','bold')
ylabel('Imag(\Gamma_L)','FontSize',28,'FontWeight','bold')

%% Optimal efficiency points

hold on

d = smithchart(coeff1);
set(d,'Marker','x','MarkerSize',10,'LineWidth',4,'Color','r')

d = smithchart(coeff2);
set(d,'Marker','o','MarkerSize',10,'LineWidth',4,'Color','b')

%% Legend

h1 = plot(NaN,NaN,'-x','Color','r','MarkerEdgeColor','r','LineWidth',2,'MarkerSize',10);
h2 = plot(NaN,NaN,':o','Color','b','MarkerEdgeColor','b','LineWidth',2,'MarkerSize',10);

legend([h1,h2],{'VNA','Oscilloscope'}, ...
    'Location','northwest','Orientation','Vertical', ...
    'NumColumns',2,'FontSize',11)