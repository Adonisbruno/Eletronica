function [Vin1, Vout]=...
    amp_DoisEstados(freq,VCC,VBE1,VBE2,R11,R21,Re1,RE1,RC1,R12,R22,Re2,RE2,RC2,RL,VG,RG)

% analise DC
% primeiro estagio
% calcula a tensão de entrada
Vb1 = VCC * (R21/(R11+R21));
% calcula a corrente no emissor
VE1 = (Vb1-VBE1);
IE1 = VE1/(RE1+Re1);
% obtem o valor o r'e do primeiro estagio
re1 = 0.025/IE1;
fprintf('\nAnalise DC do primeiro estagio\n');
fprintf('Vb: %.3f V, VE: %.3f V, IE: %f A, re: %.2f Ohms\n', Vb1,VE1,IE1,re1);
pause;
disp('Pressione enter para continuar');

% pro segundo estagio
% calcula a tensão de entrada
Vb2 = VCC * R22/(R12+R22);
% calcula a corrente no emissor
VE2 =(Vb2-VBE2);
IE2 = VE2/(RE2+Re2);
% obtem o valor o r'e do primeiro estagio
re2 = 0.025/IE2;
fprintf('\nAnalise DC do segundo estagio\n');
fprintf('Vb: %.3f V, VE: %.3f V, IE: %f A, re: %.2f Ohms\n', Vb2,VE2,IE2,re2);
pause;
disp('Pressione enter para continuar');
% --------------- impedancia do circuito e ganho -------------
%constante beta 100 AC
B1 = 100;
B2 = B1;
% A impedancia de entrada da primeira base eh:
ZinB1 = B1*(Re1+re1);
fprintf('\nImpedancia da base do primeiro estagio\n');
fprintf('Zin(base): %.2f Ohms\n', ZinB1);
pause;
disp('Pressione enter para continuar');

% A impedancia de entrada da segunda base eh:
ZinB2 = B2*(Re2+re2);
fprintf('\nImpedancia  da base do segundo estagio\n');
fprintf('Zin(base): %.2f Ohms\n', ZinB2);
pause;
disp('Pressione enter para continuar');
% A impedancia de entrada do primeiro estagio:
ZinE1 = rParalelo(rParalelo(R11,R21),ZinB1);
fprintf('\nImpedancia de entrada do primeiro estagio\n');
fprintf('Zin(estagio): %.2f Ohms\n', ZinE1);
pause;
disp('Pressione enter para continuar');
%O sinal de entrada da primeira base eh:
Vin1 = VG * ZinE1/(RG+ZinE1);
fprintf('\nO sinal de entrada da primeira base\n');
fprintf('Vin(estagio): %.3f V\n', Vin1);
pause;
disp('Pressione enter para continuar');
%A impedancia de entrada da segunda base eh a mesma do primeiro estagio:
ZinE2 = rParalelo(rParalelo(R12,R22),ZinB2);
fprintf('\nImpedancia de entrada do segundo estagio\n');
fprintf('Zin(estagio): %.2f Ohms\n', ZinE2);
pause;
disp('Pressione enter para continuar');
%A impedancia de entrada Ã© a resistencia de carga do primeiro estagio. Em outras palavras
% a resistencia no coletor CA no primeiro estagio eh:
rc1 = rParalelo(RC1,ZinE1);
fprintf('\nA resistencia no coletor CA no primeiro estagio\n');
fprintf('rc: %.2f Ohms\n', rc1);
pause;
disp('Pressione enter para continuar');
% O ganho de tensao do primeiro estagio eh:
Av1 = rc1/Re1;
fprintf('\nO ganho de tensao do primeiro estagio\n');
fprintf('Av1: %.3f \n', Av1);
pause;
disp('Pressione enter para continuar');
% A tensao CA no coletor do primeiro estagio eh:
% vc1 = Av1*Vin1;
% A resistencia CA do coletor no segundo estagio eh:
rc2 = rParalelo(RC2,RL);
fprintf('\nA resistencia no coletor CA no segundo estagio\n');
fprintf('rc: %.2f  Ohms\n', rc2);
pause;
disp('Pressione enter para continuar');
%o ganho de tensao eh:
Av2 = rc2/Re2;
fprintf('\nO ganho de tensao do segundo estagio\n');
fprintf('Av2: %.3f \n', Av2);
pause;
disp('Pressione enter para continuar');
% A tensao CA de saida do resistor de carga eh
Vout = Av1*Av2*Vin1; 
fprintf('\nA tensao CA de saida do resistor de carga eh\n');
fprintf('Vout: %.3f V\n', Vout);
pause;
disp('Pressione enter para continuar');
%c4: RC // RL
%c5: Zin(estagio2) // RE
%c2: zin(estagio2) // RC do 1 estagio
%c1: Zin(estagio1) + RG 

C4 = vlrCapacitor(freq,rParalelo(RC2,RL));
C5 = vlrCapacitor(freq,rParalelo(ZinE2,RE2));
C3 = vlrCapacitor(freq,rParalelo(ZinE1,RE1));
C2 = vlrCapacitor(freq,rParalelo(ZinE2,RC1));
C1 = vlrCapacitor(freq,ZinE1+RG);

fprintf('\nOs valores dos capacitores são:\n');
fprintf('C1: %f F, C2: %f F, C3: %f F, C4: %f F, C5: %f F \n', C1,C2,C3,C4,C5);
pause;
disp('Pressione enter para finalizar!');

end