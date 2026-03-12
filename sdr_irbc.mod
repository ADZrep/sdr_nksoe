%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% SOVEREIGN RISK & EXCHANGE RATES ACROSS REGIMES %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Alberto Dario Zanettin %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MSc Thesis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% March 2026 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This script contains the code for the definition and parametrization of 
% the model, as well as the simulation of the impulse response functions 
% under flexible prices 

%%%%%%%%%%%%%%%%%% Model & Shocks File %%%%%%%%%%%%%%%%%%

%%%%
% Endogenous Variables
%%%%

var	
	c
	y
    nfa
    nx
    d
    t
    s
    q
	rr
	def
	g
	a
    edef					;



%%%%
% Exogenous Variables
%%%%

varexo	
	eg
    	et
    	udef
    	cu
    	ru                      ;

%%%%
% Values of delta to iterate over
%%%%

deltas = [0, 0.01];

%%%%
% Preallocate IRF matrices
%%%%

irflen = 40;                     
nd     = length(deltas);

y_irfdefp  = zeros(irflen, nd);  c_irfdefp  = zeros(irflen, nd);
pi_irfdefp = zeros(irflen, nd);  rr_irfdefp  = zeros(irflen, nd);  
s_irfdefp  = zeros(irflen, nd);  nfa_irfdefp= zeros(irflen, nd);  
e_irfdefp  = zeros(irflen, nd);  d_irfdefp  = zeros(irflen, nd);
def_irfdefp= zeros(irflen, nd);  t_irfdefp  = zeros(irflen, nd);
g_irfdefp  = zeros(irflen, nd);  cpi_irfdefp = zeros(irflen, nd);
q_irfdefp  = zeros(irflen, nd);  nx_irfdefp  = zeros(irflen, nd);

y_irftp  = zeros(irflen, nd);  c_irftp  = zeros(irflen, nd);
pi_irftp = zeros(irflen, nd);  rr_irftp  = zeros(irflen, nd);  
s_irftp  = zeros(irflen, nd);  nfa_irftp= zeros(irflen, nd);  
e_irftp  = zeros(irflen, nd);  d_irftp  = zeros(irflen, nd);
def_irftp= zeros(irflen, nd);  t_irftp  = zeros(irflen, nd);
g_irftp  = zeros(irflen, nd);  cpi_irftp = zeros(irflen, nd);
q_irftp  = zeros(irflen, nd);  nx_irftp  = zeros(irflen, nd);

%%%%
% Model's Parameters
%%%%

parameters 
    alpha
	beta
	gamma
	varphi
	theta
	lambda
    eta
    xi
    psi
    zeta
    nu
	phipi
    phit
	rhog
    rhos						;

alpha   = 0.33						        ;  
beta	= 0.99						        ;  
varphi	= 3						            ;  
theta	= 0.75						        ;  
gamma	= 0.49						        ;  
lambda	= ((1-theta)*(1-beta*theta))/theta	;
eta     = (1-gamma)*(1-alpha)               ;  
nu      = (1-gamma)*alpha                   ;  
xi      = 0.001                             ; 
psi     = 0.55                              ; 
zeta 	= psi-((1-beta)/beta)		  	    ;  
phipi	= 1.5						        ; 
phit 	= 0.1875   					        ; 
rhog    = 0.89					            ;
rhos    = 0.5                               ; 

%%%%
% Model
%%%%

for delta_idx = 1:length(deltas)
    parameters delta;
    delta = deltas(delta_idx);


        model(linear);

            % New-Keynesian Phillips Curves

            varphi*y  + c  + alpha*s - (1+varphi)*a = 0 ;

            % Dynamic IS Curve

            y =   y(+1) - eta*(rr - alpha*(s(+1)-s)) - nu*( (s(+1)-s) + (cu(+1)-cu) ) - gamma*( g(+1)-g );

            % Goods Market Clearing

            y = (1-gamma)*alpha*(2-alpha)*s + eta*c + nu*cu + gamma*g  ;

            % Real Exchange Rate

            q = (1-alpha)*s ;

            % Net exports

            nx = y - (1-gamma)*c - gamma*g - nu*s ;

            % Net Foreign Assets Dynamics

            nfa   = (1/beta)*nfa(-1) + y - (1-gamma)*c - gamma*g - nu*s ;

            % UIP Condition

            rr = ru + def + ( q(+1)-q ) - xi*nfa;

            % Default risk

            def  = delta*d + edef;

            % Government Budget Constraint

            d = psi*g - zeta*t + (1/beta)*(d(-1) + rr(-1) - alpha*(s-s(-1)))  ;

            % Tax Rule

            t = phit*d - et;

            % Government spending process

            g =  rhog*g(-1) + eg ;

            % Productivity process

            a =  rhog*a(-1) ;

            % Shock process

            edef =  rhos*edef(-1) + udef ;

        end;

    initval;
    c		= 0;
    y		= 0;
    s		= 0;
    q		= 0;
    nx		= 0;
    nfa     = 0;
    def 	= 0;
    rr      = 0;
    t       = 0;
    g		= 0;
    a 		= 0;
    end;

    steady;
    check;

    shocks;

    var udef   = 1^2;
    var et   = 1^2;

    end;

    stoch_simul(order = 1,ar=0, irf = 40, nograph);

    y_irfdefp(:, delta_idx)  = oo_.irfs.y_udef'  ;
    c_irfdefp(:, delta_idx)  = oo_.irfs.c_udef'  ;
    rr_irfdefp(:, delta_idx)  = oo_.irfs.rr_udef'  ;
    s_irfdefp(:, delta_idx)  = oo_.irfs.s_udef'  ;
    nfa_irfdefp(:, delta_idx)= oo_.irfs.nfa_udef';
    t_irfdefp(:, delta_idx)  = oo_.irfs.t_udef'  ;
    def_irfdefp(:, delta_idx)= oo_.irfs.def_udef';
    d_irfdefp(:, delta_idx)  = oo_.irfs.d_udef'  ;
    g_irfdefp(:, delta_idx)  = oo_.irfs.g_udef'  ;
    q_irfdefp(:, delta_idx)  = oo_.irfs.q_udef' ;
    nx_irfdefp(:, delta_idx)  = oo_.irfs.nx_udef' ;


    y_irftp(:, delta_idx)  = oo_.irfs.y_et'  ;
    c_irftp(:, delta_idx)  = oo_.irfs.c_et'  ;
    rr_irftp(:, delta_idx)  = oo_.irfs.rr_et'  ;
    s_irftp(:, delta_idx)  = oo_.irfs.s_et'  ;
    nfa_irftp(:, delta_idx)= oo_.irfs.nfa_et';
    t_irftp(:, delta_idx)  = oo_.irfs.t_et'  ;
    def_irftp(:, delta_idx)= oo_.irfs.def_et';
    d_irftp(:, delta_idx)  = oo_.irfs.d_et'  ;
    g_irftp(:, delta_idx)  = oo_.irfs.g_et'  ;
    q_irftp(:, delta_idx)  = oo_.irfs.q_et' ;
    nx_irftp(:, delta_idx)  = oo_.irfs.nx_et' ;
end;