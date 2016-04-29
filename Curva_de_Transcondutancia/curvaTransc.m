function [id] = curvaTransc(idss,vgsOff, vgs)
% id = curvaTransc(idss,vgsOff, vgs)
% idss: corrente dreno para fonte com porta curto-circuitada
% vgs: tensao gate-source
% vgsOff: tensao de constrição (estrangulamento)
    id = idss.*(1-(vgs/vgsOff)).^2;
end