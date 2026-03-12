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
% under price rigidity and a flexible exchange rate

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
	pi
    cpi
    s
    e
    q
	r
	def
	g
	a
    edef
    er						;



%%%%
% Exogenous Variables
%%%%

varexo	
	eg
    et
    udef
    ur
    cu
    piu
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

y_irfdef  = zeros(irflen, nd);  c_irfdef  = zeros(irflen, nd);
pi_irfdef  = zeros(irflen, nd);  r_irfdef  = zeros(irflen, nd);  
s_irfdef  = zeros(irflen, nd);  nfa_irfdef= zeros(irflen, nd);  
e_irfdef  = zeros(irflen, nd);  d_irfdef  = zeros(irflen, nd);
def_irfdef= zeros(irflen, nd);  t_irfdef  = zeros(irflen, nd);
g_irfdef  = zeros(irflen, nd);  cpi_irfdef  = zeros(irflen, nd);
q_irfdef  = zeros(irflen, nd);  nx_irfdef  = zeros(irflen, nd);

y_irft  = zeros(irflen, nd);  c_irft  = zeros(irflen, nd);
pi_irft  = zeros(irflen, nd);  r_irft  = zeros(irflen, nd);  
s_irft  = zeros(irflen, nd);  nfa_irft= zeros(irflen, nd);  
e_irft  = zeros(irflen, nd);  d_irft  = zeros(irflen, nd);
def_irft= zeros(irflen, nd);  t_irft  = zeros(irflen, nd);
g_irft  = zeros(irflen, nd);  cpi_irft  = zeros(irflen, nd);
q_irft  = zeros(irflen, nd);  nx_irft  = zeros(irflen, nd);

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

            pi  = beta*pi(+1)  + lambda*(varphi*y  + c  + alpha*s - (1+varphi)*a);

            % CPI

            cpi = pi + alpha*(s - s(-1));

            % Dynamic IS Curve

            y =   y(+1) - eta*(r -  pi(+1)) - nu*( (s(+1)-s) + (cu(+1)-cu) ) - gamma*( g(+1)-g );

            % Goods Market Clearing

            y = (1-gamma)*alpha*(2-alpha)*s + eta*c + nu*cu + gamma*g  ;

            % Terms of Trade Dynamics

            s = s(-1) + ( e - e(-1) ) + piu - pi  ;

            % Real Exchange Rate

            q = (1-alpha)*s ;

            % Net exports

            nx = y - (1-gamma)*c - gamma*g - nu*s ;

            % Net Foreign Assets Dynamics

            nfa   = (1/beta)*nfa(-1) + y - (1-gamma)*c - gamma*g - nu*s ;

            % UIP Condition

            r = ru + def + ( e(+1)-e ) - xi*nfa;

            % Default risk

            def  = delta*d + edef;

            % Government Budget Constraint

            d = psi*g - zeta*t + (1/beta)*(d(-1) + r(-1) - pi)  ;

            % Tax Rule

            t = phit*d - et;

            % Taylor rule

            r = phipi*pi + er;

            % Government spending process

            g =  rhog*g(-1) + eg ;

            % Productivity process

            a =  rhog*a(-1) ;

            % Shock process

            edef =  rhos*edef(-1) + udef ;
            er =  rhos*er(-1) + ur ;

        end;

    initval;
    c		= 0;
    y		= 0;
    pi		= 0;
    s		= 0;
    nfa     = 0;
    r 		= 0;
    e       = 0;
    def 	= 0;
    t       = 0;
    g		= 0;
    a 		= 0;
    end;

    steady;
    check;

    shocks;

    var eg   = 1^2;
    var udef   = 1^2;
    var ur   = 1^2;
    var et   = 1^2;

    end;

    stoch_simul(order = 1,ar=0, irf = 40, nograph);

    y_irfdef(:, delta_idx)  = oo_.irfs.y_udef'  ;
    c_irfdef(:, delta_idx)  = oo_.irfs.c_udef'  ;
    pi_irfdef(:, delta_idx) = oo_.irfs.pi_udef' ;
    r_irfdef(:, delta_idx)  = oo_.irfs.r_udef'  ;
    s_irfdef(:, delta_idx)  = oo_.irfs.s_udef'  ;
    nfa_irfdef(:, delta_idx)= oo_.irfs.nfa_udef';
    e_irfdef(:, delta_idx)  = oo_.irfs.e_udef'  ;
    t_irfdef(:, delta_idx)  = oo_.irfs.t_udef'  ;
    def_irfdef(:, delta_idx)= oo_.irfs.def_udef';
    d_irfdef(:, delta_idx)  = oo_.irfs.d_udef'  ;
    g_irfdef(:, delta_idx)  = oo_.irfs.g_udef'  ;
    cpi_irfdef(:, delta_idx)= oo_.irfs.cpi_udef';
    q_irfdef(:, delta_idx)  = oo_.irfs.q_udef' ;
    nx_irfdef(:, delta_idx)  = oo_.irfs.nx_udef' ;

    y_irft(:, delta_idx)  = oo_.irfs.y_et'  ;
    c_irft(:, delta_idx)  = oo_.irfs.c_et'  ;
    pi_irft(:, delta_idx) = oo_.irfs.pi_et' ;
    r_irft(:, delta_idx)  = oo_.irfs.r_et'  ;
    s_irft(:, delta_idx)  = oo_.irfs.s_et'  ;
    nfa_irft(:, delta_idx)= oo_.irfs.nfa_et';
    e_irft(:, delta_idx)  = oo_.irfs.e_et'  ;
    t_irft(:, delta_idx)  = oo_.irfs.t_et'  ;
    def_irft(:, delta_idx)= oo_.irfs.def_et';
    d_irft(:, delta_idx)  = oo_.irfs.d_et'  ;
    g_irft(:, delta_idx)  = oo_.irfs.g_et'  ;
    cpi_irft(:, delta_idx)= oo_.irfs.cpi_et';
    q_irft(:, delta_idx)  = oo_.irfs.q_et' ;
    nx_irft(:, delta_idx)  = oo_.irfs.nx_et' ;
    
end;
