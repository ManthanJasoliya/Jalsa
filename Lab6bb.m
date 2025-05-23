% M-file, mag_Field.m
% M-file to calculate the net magnetic field produced
% by a three phase stator.

% Set up the basic conditions
bmax = 1;
freq = 100;
w = 2 * pi *freq;

t = 0:1/6000:1/60;
O = 0;
Baa = sin(w*t) .*(cos(O) + 1i*sin(O));
Ebb = sin(w*t - 2*pi/3) .* (cos(2*pi/3)+ 1i * sin(2*pi/3));
Ecc = sin(w*t + 2*pi/3) .* (cos(-2*pi/3)+ 1i * sin(-2*pi/3));

Enet = Baa+Ebb+Ecc;
Bloop = (cos(w*t+O)+ 1i*sin(w*t+O));
circle = 1.5 * (cos(w*t) + 1i*sin(w*t));

for ii = 1:length(t)
    plot(circle, 'k');
    hold on;

    plot( [0 real(Enet(ii))] , [0 imag(Enet(ii))], 'r', 'LineWidth', 3);
    plot( [0 real(Bloop(ii))] , [0 imag(Bloop(ii))], 'r', 'LineWidth', 3); 
    axis square;
    axis([-2 2 -2 2]);
    drawnow;
    hold off;
end    

