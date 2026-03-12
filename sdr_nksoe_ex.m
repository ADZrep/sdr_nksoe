%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% SOVEREIGN RISK & EXCHANGE RATES ACROSS REGIMES %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Alberto Dario Zanettin %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MSc Thesis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% March 2026 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This script contains the code for the execution of the model simulations
% and the plotting of the impulse response functions under price rigidity

close all
clear

%%%%%%%%%%%%%%%%%%%%% Execution & Graph-Plotting File %%%%%%%%%%%%%%%%%%%%

cd '/Applications/Dynare/6.2-arm64/matlab'

folder = '/Users/alberto/Desktop/BOCCONI/ESS/Thesis/IRFs_test';

%%%%%%
% Running the models
%%%%%%

dynare sdr_nksoe noclearall nolog
dynare sdr_nksoe_peg noclearall nolog

lightBlue = [0.7 0.85 1];
lightRed  = [1 0.7 0.7];
darkGrey  = [0.2 0.2 0.2];  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default Shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
tiledlayout(4,3,'TileSpacing','compact','Padding','compact');

nexttile;
plot(y_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(y_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Output', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(c_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(c_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Consumption', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(pi_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(pi_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Domestic Inflation', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(cpi_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(cpi_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('CPI Inflation', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(r_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(r_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Bond Interest Rate', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(s_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(s_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Terms of Trade', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(nfa_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(nfa_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Net Foreign Assets', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(nx_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(nx_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Net Exports', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(e_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(e_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Nominal Exchange Rate', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(q_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(q_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Exchange Rate', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(d_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(d_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Government Debt', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(def_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(def_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Expected Default Risk', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

% Saving the figure
set(gcf,'Position',[100 100 1200 1200]);
exportgraphics(gcf, fullfile(folder,'Figure5.pdf'), 'ContentType','vector');

% Compact version of the figure 

figure;
tiledlayout(3,3,'TileSpacing','compact','Padding','compact');

nexttile;
plot(y_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(y_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Output', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(c_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(c_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Consumption', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(pi_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(pi_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Domestic Inflation', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(r_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(r_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Bond Interest Rate', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(s_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(s_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Terms of Trade', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(nfa_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(nfa_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Net Foreign Assets', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(e_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(e_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Nominal Exchange Rate', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(d_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(d_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Government Debt', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(def_irfdef(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(def_irfdefp(:,1),'--r','Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Expected Default Risk', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0$', 'peg, $\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

% Saving the figure
set(gcf,'Position',[100 100 1200 1200]);
exportgraphics(gcf, fullfile(folder,'Figure3.pdf'), 'ContentType','vector');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tax Shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
tiledlayout(4,4,'TileSpacing','compact','Padding','compact');

nexttile;
plot(y_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(y_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(y_irft(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Output', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(c_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(c_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(c_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Consumption', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(pi_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(pi_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(pi_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Domestic Inflation', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(cpi_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(cpi_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(cpi_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('CPI Inflation', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(r_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(r_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(r_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Bond Interest Rate', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(s_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(s_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(s_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Terms of Trade', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(nfa_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(nfa_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(nfa_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Net Foreign Assets', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(nx_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(nx_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(nx_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Net Exports', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(e_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(e_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(e_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Nominal Exchange Rate', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(q_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(q_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(q_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Exchange Rate', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(d_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(d_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(d_irft(:,1), 'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Government Debt', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(def_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(def_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(def_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Expected Default Risk', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(t_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(t_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(t_irftp(:,1), 'Color', darkGrey, 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Taxes', 'Interpreter', 'latex','FontSize',20)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',13)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

% Saving the figure
set(gcf,'Position',[100 100 1200 1200]);
exportgraphics(gcf, fullfile(folder,'Figure6.pdf'), 'ContentType','vector');

% Compact version of the figure

figure;
tiledlayout(3,3,'TileSpacing','compact','Padding','compact');

nexttile;
plot(y_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(y_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(y_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Output', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(c_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(c_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(c_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Consumption', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(pi_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(pi_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(pi_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Domestic Inflation', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(r_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(r_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(r_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Bond Interest Rate', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(s_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(s_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(s_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Terms of Trade', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(e_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(e_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(e_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Nominal Exchange Rate', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(d_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(d_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(d_irft(:,1), 'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Government Debt', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(def_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(def_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(def_irftp(:,1),'Color', darkGrey,'Linewidth',4.5) % delta = 0
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Expected Default Risk', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(t_irft(:,2), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(t_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold on
plot(t_irftp(:,1), 'Color', darkGrey, 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Taxes', 'Interpreter', 'latex','FontSize',23)
legend('free ex., $\delta=0.01$', 'peg, $\delta=0.01$', '$\delta=0$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

% Saving the figure
set(gcf,'Position',[100 100 1200 1200]);
exportgraphics(gcf, fullfile(folder,'Figure4.pdf'), 'ContentType','vector');
