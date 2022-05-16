clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MODEL PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Modeling domain size
Lx=200;
Ly=200;

% Number of ractures' families (sets) Nset
Nset=3;

% Number of ractures
Ns=zeros(Nset,1);

Ns(1)=round(Lx*Ly*0.5);
Ns(2)=round(Lx*Ly*0.5);
Ns(3)=round(Lx*Ly*0.5);

% Total number of ractures
N=sum(Ns);

% Correlation fractal dimension
Dc=1.8;

% Trucated power-law distriburion of fracture lengths
Lmin=[0.1,0.1,0.1];
Lmax=[22.5,22.5,22.5];
alpha_pl=[2.1,2.1,2.1];

% Fracture orientation distribution
m_or=[pi/6,pi/36;pi/3,pi/36;11*pi/12,pi/36];

% Fractures thickness
m_ap=[0.01;0.01;0.01];

% Number of iterations in cascade fractal modeling
T=8;