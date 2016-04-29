function c = vlrCapacitor(frequencia,rt)
% C = vlrCapacitor(frequencia,rt)
% C � o valor do capacitor
% rt � a resistencia equivalente
    xc = rt*0.1;
	c =  1./(2*pi*frequencia*xc);
end