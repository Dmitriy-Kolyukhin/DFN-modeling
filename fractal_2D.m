
clear

parameters;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Statistical modeling fractures centers fractal set

rl = 2;               % number of segments in one dimension on one iteration step
R2=rl^(-Dc);
r=sqrt(R2-(1/rl)^2);

% Total number of cells
Nx=rl^T;
Ny=rl^T;

% Grid mesh sizes
hx=Lx/Nx;
hy=Ly/Ny;

Cntr=zeros(N,2);
P=ones(Nx,Ny);
p=zeros(rl,rl);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modeling of probability distribution

for iT=1:T

    for iNLx=1:rl^(iT-1)
    for iNLy=1:rl^(iT-1)
        
        M1=rl^(T-iT+1);     
        M2=rl^(T-iT);     
        
        x0=(iNLx-1)*M1;
        y0=(iNLy-1)*M1;
        
        flag=true;
        
        while(flag)

            f=rand(rl,rl);           
            ff=sum(sum(f));              
            f=f/ff-(1/rl)^2;            
            ff2=sqrt(sum(sum(f.^2)));
            pp=(1/rl)^2+f*r./ff2; 
            
            if (min(min(pp)>=0))               
                flag=false;
            end;
        
        end;

        p=reshape(pp(randperm(rl^2)),rl,rl);
        
        for ix=x0+1:x0+M2
        for iy=y0+1:y0+M2
            
            for ix1=1:rl
            for iy1=1:rl
                
                P(ix+M2*(ix1-1),iy+M2*(iy1-1))=p(ix1,iy1)*P(ix+M2*(ix1-1),iy+M2*(iy1-1));
                            
            end;        
            end;                  
    
        end;        
        end;
 
    end;
    end;

end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modeling of fractures centers 

for iN=1:N

    rn=rand;
    flag=1;
    SumP=0;
    iNL=0;
    
    while(flag==1)
        
        iy=floor(iNL/Nx)+1;
        ix=floor(iNL-(iy-1)*Nx)+1;
        iNL=iNL+1;       
        
        SumP=SumP+P(ix,iy);
        
        if(rn<SumP)
            
            flag=0;
            
            X1=hx*(ix-1);
            X2=hx*ix;
            Cntr(iN,1)=X1+(X2-X1)*rand;
            
            Y1=hy*(iy-1);
            Y2=hy*iy;
            Cntr(iN,2)=Y1+(Y2-Y1)*rand;
            
        end;
        
    end;

end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Writing to file
dlmwrite('Cntr.txt',Cntr,' ');

% scatter(Cntr(:,1),Cntr(:,2),10)
