function [rt] = rParalelo(rg,rl)
% [rt] = rParalelo(rg,rl)
% rt = resistencia total
% rg e rl s�o os resistores em paralelo
    rt = (rg*rl)/(rg+rl);
end