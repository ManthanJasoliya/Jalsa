% M-file, mag_Field.m
% M-file to calculate the net magnetic field produced
% by a three phase stator.

% Set up the basic conditions
bmax = 1;
freq = 50;
w = 2*pi*freq;

t = 0:1/6000:1/10;
Baa = sin(w*t) .* (cos(0) + 1j*sin(0));
Ebb = sin(w*t - 2*pi/3) .*(cos(2*pi/3) + 1j*sin(2*pi/3));
Ecc = sin(w*t + 2*pi/3) .*(cos(-2*pi/3) + 1j*sin(-2*pi/3));

Enet = Baa+Ebb+Ecc;

circle = 1.5 * (cos(w*t) + 1j*sin(w*t));

for ii = 1:length(t)
    plot(circle, 'k');
    hold on;

    plot( [0 real(Baa(ii))] , [0 imag(Baa(ii))], 'k', 'LineWidth', 2);
    plot( [0 real(Ebb(ii))] , [0 imag(Ebb(ii))], 'b', 'LineWidth', 2);
    plot( [0 real(Ecc(ii))] , [0 imag(Ecc(ii))], 'm', 'LineWidth', 2);
    plot( [0 real(Enet(ii))] , [0 imag(Enet(ii))], 'r', 'LineWidth', 3);
     
    axis square;
    axis([-2 2 -2 2]);
    drawnow;
    hold off;
end    


