%% Autor: Bruno Adônis de Sá
%% Inicialização
clc; clear all; close all;

%valores baseado no JFET 2N5457
vgsOff = -7;
% gera 100 valores dentro do intervalo definido.
% para Vgs=0, Idss = 9mA.
% para Vgs=VgsOff, Idss = 0.
% por isso os pontos variam de 1 a Idss e de 1 a VgsOff.
idss = linspace(1,9*10^(-3),50);
vgs = linspace(1,vgsOff-1,50);

%plot
hold on
%plot continuo
plot(vgs,curvaTransc(idss,vgsOff,vgs),'r',...
    'LineWidth',2)
%plot discreto
stem(vgs,curvaTransc(idss,vgsOff,vgs),'k')
%legenda
xlabel('Vgs (V)')
ylabel('Idss (A)')
grid on
hold off
