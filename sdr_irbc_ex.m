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
% and the plotting of the impulse response functions under flexible prices

close all
clear

%%%%%%%%%%%%%%%%%%%%% Execution & Graph-Plotting File %%%%%%%%%%%%%%%%%%%%

cd '/Applications/Dynare/6.2-arm64/matlab'

folder = '/Users/alberto/Desktop/BOCCONI/ESS/Thesis/IRFs_test';

%%%%%%
% Running the models
%%%%%%

dynare sdr_irbc noclearall nolog

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
plot(y_irfdefp(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(y_irfdefp(:,2),'--r','Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Output', 'Interpreter', 'latex','FontSize',23)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(c_irfdefp(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(c_irfdefp(:,2),'--r','Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Consumption', 'Interpreter', 'latex','FontSize',23)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(rr_irfdefp(:,1),'-.b','Linewidth',4.5) % delta = 0.01
hold on
plot(rr_irfdefp(:,2),'--r','Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Interest Rate', 'Interpreter', 'latex','FontSize',23)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(s_irfdefp(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(s_irfdefp(:,2),'--r','Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Terms of Trade', 'Interpreter', 'latex','FontSize',23)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(nfa_irfdefp(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(nfa_irfdefp(:,2),'--r','Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Net Foreign Assets', 'Interpreter', 'latex','FontSize',23)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(nx_irfdefp(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(nx_irfdefp(:,2),'--r','Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Net Exports', 'Interpreter', 'latex','FontSize',23)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(q_irfdefp(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(q_irfdefp(:,2),'--r','Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Exchange Rate', 'Interpreter', 'latex','FontSize',23)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(d_irfdefp(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(d_irfdefp(:,2),'--r','Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Government Debt', 'Interpreter', 'latex','FontSize',23)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(def_irfdefp(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(def_irfdefp(:,2),'--r','Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Expected Default Risk', 'Interpreter', 'latex','FontSize',23)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

nexttile;
plot(t_irfdefp(:,1),'-.b','Linewidth',4.5) % delta = 0
hold on
plot(t_irfdefp(:,2),'--r','Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Taxes', 'Interpreter', 'latex','FontSize',23)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',20)

% Saving the figure
set(gcf,'Position',[100 100 1200 1200]);
exportgraphics(gcf, fullfile(folder,'Figure1.pdf'), 'ContentType','vector');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tax Shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
tiledlayout(4,3,'TileSpacing','compact','Padding','compact');

nexttile;
plot(y_irftp(:,1), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(y_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Output', 'Interpreter', 'latex','FontSize',20)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(c_irftp(:,1), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(c_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Consumption', 'Interpreter', 'latex','FontSize',20)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(rr_irftp(:,1), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(rr_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Interest Rate', 'Interpreter', 'latex','FontSize',20)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(s_irftp(:,1), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(s_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Terms of Trade', 'Interpreter', 'latex','FontSize',20)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(nfa_irftp(:,1), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(nfa_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Net Foreign Assets', 'Interpreter', 'latex','FontSize',20)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(nx_irftp(:,1), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(nx_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Net Exports', 'Interpreter', 'latex','FontSize',20)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(q_irftp(:,1), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(q_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Exchange Rate', 'Interpreter', 'latex','FontSize',20)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(d_irftp(:,1), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(d_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Government Debt', 'Interpreter', 'latex','FontSize',20)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(def_irftp(:,1), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(def_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Expected Default Risk', 'Interpreter', 'latex','FontSize',20)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

nexttile;
plot(t_irftp(:,1), '-.b', 'Linewidth',4.5) % delta = 0.01
hold on
plot(t_irftp(:,2), '--r', 'Linewidth',4.5) % delta = 0.01
hold off
yline(0,'k-','LineWidth',1.5);
ylabel('\%','Interpreter','latex','FontSize',14);
grid on; box off;
title('Real Taxes', 'Interpreter', 'latex','FontSize',20)
legend('$\delta=0$', '$\delta=0.01$', 'Interpreter', 'latex','FontSize',15)
xlabel('Quarters','Interpreter', 'latex','FontSize',18)

% Saving the figure
set(gcf,'Position',[100 100 1200 1200]);
exportgraphics(gcf, fullfile(folder,'Figure2.pdf'), 'ContentType','vector');









