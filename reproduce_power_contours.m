%% Load reproducibility dataset
load('Contour_Pow_data.mat')

%% ---------- FD-AHLP (Frequency Domain Load-Pull) ----------

[X,Y] = meshgrid( ...
    linspace(min(DataX1),max(DataX1)), ...
    linspace(min(DataY1),max(DataY1)));

% F_Pout = scatteredInterpolant(DataX1,DataY1,DataZ1);
F_Pout = scatteredInterpolant(DataX1,DataY1,DataZ1,'natural');
F_Pout.ExtrapolationMethod = 'none';
Z_out = F_Pout(X,Y);

figure(1)
hold on
contour(X,Y,Z_out,30,'-','LineWidth',3)

%% ---------- TD-AHLP (Time Domain Load-Pull) ----------

[X,Y] = meshgrid( ...
    linspace(min(DataX2),max(DataX2)), ...
    linspace(min(DataY2),max(DataY2)));

F_Pout = scatteredInterpolant(DataX2,DataY2,DataZ2,'natural');
F_Pout.ExtrapolationMethod = 'none';
Z_out = F_Pout(X,Y);

contour(X,Y,Z_out,22,':','LineWidth',3)

%% Plot settings

colormap('jet')
colorbar

set(gca,'FontSize',24,'FontWeight','bold')

xlabel('Real(\Gamma_L)','FontSize',28,'FontWeight','bold')
ylabel('Imag(\Gamma_L)','FontSize',28,'FontWeight','bold')

grid on
axis([-0.6 0.0 0.1 0.6])

%% ---------- Optimal load points ----------

hold on

d = smithchart(coeff1);
set(d,'Marker','x','MarkerSize',10,'LineWidth',4,'Color','r')

d = smithchart(coeff2);
set(d,'Marker','o','MarkerSize',10,'LineWidth',4,'Color','b')

%% ---------- Legend ----------

h1 = plot(NaN,NaN,'-x','Color','r','MarkerEdgeColor','r','LineWidth',2,'MarkerSize',10);
h2 = plot(NaN,NaN,':o','Color','b','MarkerEdgeColor','b','LineWidth',2,'MarkerSize',10);

legend([h1,h2],{'VNA','Oscilloscope'}, ...
    'Location','northwest','Orientation','Vertical', ...
    'NumColumns',2,'FontSize',11)