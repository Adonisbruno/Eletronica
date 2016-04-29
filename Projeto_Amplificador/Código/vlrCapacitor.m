function c = vlrCapacitor(frequencia,rt)
% C = vlrCapacitor(frequencia,rt)
% C é o valor do capacitor
% rt é a resistencia equivalente
    xc = rt*0.1;
	c =  1./(2*pi*frequencia*xc);
end