function RE = pontoQ(RC,rc,VCC,VE)
% RE = pontoQ(RC,rc,VCC,VE)
% rc = rParalelo(RC,RL)
% VE = Vb-Vbe
    RE = (RC+rc)/((VCC/VE)-1);
end