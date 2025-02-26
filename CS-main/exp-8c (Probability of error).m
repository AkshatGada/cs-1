E = 0:1:25;
E_db = 10*log10(E);

P1 = (1/2)*erfc(sqrt(E/2));
P2 = (1/2)*erfc(sqrt(E));
P3 = (3/4)*erfc(sqrt(E/2));

semilogy(E_db,P1,'-k',E_db,P2,'-r',E_db,P3,'-b','LineWidth',2);
legend('Unipolar','Polar','Bipolar');
xlabel('SNR per bit');
ylabel('Bit Error probability');



