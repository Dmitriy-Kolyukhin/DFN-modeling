
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PARAMETRY I PEREMENNYE

parameters;

% Modeling of fracture patameters

L=zeros(N,1);        % Fractures lengths
T=zeros(N,1);        % Fractures thicknesses
phi=zeros(N,1);      % Fractures orientations

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Statistical modeling

iN=0;

for iNset=1:Nset
    
    for iNs=1:Ns(iNset)
        
        iN=iN+1;
    
% Power-law distribution of fractures lengthes

%         L(iN)=exp( ( (1-alpha_pl(iNset)) * log(Lmin(iNset)) + log(1-rand) ) / (1-alpha_pl(iNset)) );

% Truncated power-law distribution of fractures lengthes

        r=rand;
        L(iN)=exp( log( (1-r)*Lmin(iNset)^(1-alpha_pl(iNset)) + r*Lmax(iNset)^(1-alpha_pl(iNset)) ) / (1-alpha_pl(iNset)) );

% Constant fractures thicknesses
        T(iN)=m_ap(iNset);

% Normal distribution of fractures orientation
        phi(iN)=m_or(iNset,1)+m_or(iNset,2)*randn;
        
    end;
    
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Writing to file

dlmwrite('fractures_o.txt',[L, T, phi],' ');

