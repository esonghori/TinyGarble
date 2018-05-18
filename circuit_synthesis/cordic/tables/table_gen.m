N_Frac = 14;
N_Dec = 2;
L = N_Dec + N_Frac;

m = (2.^-(0:N_Frac))';

Ad = [m, atan(m), atanh(m*0.5)];

Adf = fi(Ad,1, L, N_Frac);

lin = bin(Adf(:,1));
cir = bin(Adf(:,2));
hyp = bin(Adf(:,3));

fid = fopen('linear.txt', 'wt');
for n = 1:N_Frac+1
    fprintf(fid, '%s\n', lin(n,:));
end
fclose(fid);

fid = fopen('circular.txt', 'wt');
for n = 1:N_Frac+1
    fprintf(fid, '%s\n', cir(n,:));
end
fclose(fid);

fid = fopen('hyperbolic.txt', 'wt');
for n = 1:N_Frac+1
    fprintf(fid, '%s\n', hyp(n,:));
end
fclose(fid);