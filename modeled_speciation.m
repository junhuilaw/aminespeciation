clear
format long
gem = get(gca,'ColorOrder');
H = rgb2hex(gem);

%% Speciation Data
T = 25;

% T1K0
pHo_10_exp = [8.55	8.41	8.18	7.95	7.65	7.57];
pHo_10 = [flip(pHo_10_exp) 9:0.2:11 11.41];
% modeledpH = [7.56 11.6]
Camine = 1;
csalt = 0;
[xdm_10, pco2_10, loading_10] = speciation(pHo_10, Camine, csalt, T);
% ysp10 = actcoeff(pHo_10, Camine, csalt, T);
bicarb_exp = [0.674	0.774	0.853	0.955	0.974	0.979];
carb_exp = [0.063	0.048	0.029	0.016	0.006	0.005];
dmea_exp = [0.092	0.060	0.032	0.014	0.006	0.003];
dmeah_exp = [0.908	0.940	0.968	0.986	0.994	0.997];
exp_t1k0 = [dmea_exp; dmeah_exp; bicarb_exp; carb_exp];

% pH1040 = 7.66:.01:11.22;
% [xdm1040, pco21040, load1040] = speciation(pH1040, Camine, csalt, 40);
% pH1050 = 7.74:.01:10.99;
% [xdm1050, pco21050, load1050] = speciation(pH1050, Camine, csalt, 50);

pka1025 = abs(xdm_10(:,1)-xdm_10(:,2));
[minval1025,idx1025] = min(pka1025);
% pka1040 = abs(xdm1040(:,1) - xdm1040(:,2));
% [minval1040,idx1040] = min(pka1040);
% pka1050 = abs(xdm1050(:,1) - xdm1050(:,2));
% [minval1050,idx1050] = min(pka1050);
pka1025 = pHo_10(idx1025);
% pka1040 = pH1040(idx1040);
% pka1050 = pH1050(idx1050);

% T2K0
pHo_20_exp = [8.64	8.41	8.16	7.92	7.79];
pHo_20 = [flip(pHo_20_exp) 9:0.2:11 11.48];
% modeledpH = [7.84 11.75]
Camine = 2;
csalt = 0;
[xdm_20, pco2_20, loading_20] = speciation(pHo_20, Camine, csalt, T);
% ysp20 = actcoeff(pHo_20, Camine, csalt, T);
bicarb_exp = [1.401	1.571	1.759	1.858	1.875];
carb_exp = [0.164	0.113	0.072	0.031	0.022];
dmea_exp = [0.160	0.092	0.046	0.011	0.000];
dmeah_exp = [1.840	1.908	1.954	1.989	2.000];
exp_t2k0 = [dmea_exp; dmeah_exp; bicarb_exp; carb_exp];

% pH2040 = 7.96:.01:11.38;
% [xdm2040, pco22040, load2040] = speciation(pH2040, Camine, csalt, 40);
% pH2050 = 8.04:.01:11.14;
% [xdm2050, pco22050, load2050] = speciation(pH2050, Camine, csalt, 50);

pka2025 = abs(xdm_20(:,1)-xdm_20(:,2));
[minval2025,idx2025] = min(pka2025);
% pka2040 = abs(xdm2040(:,1) - xdm2040(:,2));
% [minval2040,idx2040] = min(pka2040);
% pka2050 = abs(xdm2050(:,1) - xdm2050(:,2));
% [minval2050,idx2050] = min(pka2050);
% pka2025 = pHo_20(idx2025);
% pka2040 = pH2040(idx2040);
% pka2050 = pH2050(idx2050);

% T3K0
pHo_30_exp = [8.71	8.47	8.19	8.14];
pHo_30 = [flip(pHo_30_exp) 9:0.2:11.6 11.80];
% modeledpH = [8.02 11.84];
Camine = 3;
csalt = 0;
[xdm_30, pco2_30, loading_30] = speciation(pHo_30, Camine, csalt, T);
% ysp30 = actcoeff(pHo_30, Camine, csalt, T);
bicarb_exp = [2.170	2.452	2.654	2.667];
carb_exp = [0.204	0.137	0.072	0.051];
dmea_exp = [0.071	0.078	0.017	0.000];
dmeah_exp = [2.929	2.922	2.983	3.000];
exp_t3k0 = [dmea_exp; dmeah_exp; bicarb_exp; carb_exp];

% pH3040 = 8.16:0.2:11.46;
% [xdm3040, pco23040, load3040] = speciation(pH3040, Camine, csalt, 40);
% pH3050 = 8.29:.01:11.23;
% [xdm3050, pco23050, load3050] = speciation(pH3050, Camine, csalt, 50);

pka3025 = abs(xdm_30(:,1)-xdm_30(:,2));
[minval3025,idx3025] = min(pka3025);
% pka3040 = abs(xdm3040(:,1) - xdm3040(:,2));
% [minval3040,idx3040] = min(pka3040);
% pka3050 = abs(xdm3050(:,1) - xdm3050(:,2));
% [minval3050,idx3050] = min(pka3050);
pka3025 = pHo_30(idx3025);
% pka3040 = pH3040(idx3040);
% pka3050 = pH3050(idx3050);

% T1K2
pHo_12_exp = [8.61	8.33	8.16	7.93	7.50];
pHo_12 = [flip(pHo_12_exp) 9:0.2:11 11.64];
% modeledpH = [7.53 11.6];
Camine = 1;
csalt = 2;
[xdm_12, pco2_12, loading_12] = speciation(pHo_12, Camine, csalt, T);
% ysp12 = actcoeff(pHo_12, Camine, csalt, T);
bicarb_exp = [0.764	0.851	0.900	0.962	1.042];
carb_exp = [0.080	0.045	0.026	0.013	0.000];
dmea_exp = [0.055	0.028	0.017	0.008	0.000];
dmeah_exp = [0.945	0.972	0.983	0.992	1.000];
exp_t1k2 = [dmea_exp; dmeah_exp; bicarb_exp; carb_exp];

% pH1240 = 7.65:.01:11.22;
% [xdm1240, pco21240, load1240] = speciation(pH1240, Camine, csalt, 40);
% pH1250 = 7.71:.01:10.99;
% [xdm1250, pco21250, load1250] = speciation(pH1250, Camine, csalt, 50);

pka1225 = abs(xdm_12(:,1)-xdm_12(:,2));
[minval1225,idx1225] = min(pka1225);
% pka1240 = abs(xdm1240(:,1) - xdm1240(:,2));
% [minval1240,idx1240] = min(pka1240);
% pka1250 = abs(xdm1250(:,1) - xdm1250(:,2));
% [minval1250,idx1250] = min(pka1250);
pka1225 = pHo_12(idx1225);
% pka1240 = pH1240(idx1240);
% pka1250 = pH1250(idx1250);

% T2K2
pHo_22_exp = [8.75	8.63	8.41	8.23	7.95	7.87];
pHo_22 = [flip(pHo_22_exp) 9:0.2:11.6 12.02];
% modeledpH = [7.84 11.75];
Camine = 2;
csalt = 2;
[xdm_22, pco2_22, loading_22] = speciation(pHo_22, Camine, csalt, T);
% ysp22 = actcoeff(pHo_22, Camine, csalt, T);
bicarb_exp = [1.361	1.483	1.694	1.786	1.892 1.920];
carb_exp = [0.192	0.139	0.090	0.045	0.009 0];
dmea_exp = [0.076	0.051	0.028	0.014	0.003 0];
dmeah_exp = [1.924	1.949	1.972	1.986	1.997 2];
exp_t2k2 = [dmea_exp; dmeah_exp; bicarb_exp; carb_exp];

% pH2240 = 7.96:.01:11.38;
% [xdm2240, pco22240, load2240] = speciation(pH2240, Camine, csalt, 40);
% pH2250 = 8.06:.01:11.14;
% [xdm2250, pco22250, load2250] = speciation(pH2250, Camine, csalt, 50);

pka2225 = abs(xdm_22(:,1)-xdm_22(:,2));
[minval2225,idx2225] = min(pka2225);
% pka2240 = abs(xdm2240(:,1) - xdm2240(:,2));
% [minval2240,idx2240] = min(pka2240);
% pka2250 = abs(xdm2250(:,1) - xdm2250(:,2));
% [minval2250,idx2250] = min(pka2250);
pka2225 = pHo_22(idx2225);
% pka2240 = pH2240(idx2240);
% pka2250 = pH2250(idx2250);

%% Plots
figure(1)
t1 = tiledlayout(1,2);
nexttile
plot(pHo_10,xdm_10(:,1),'d-','color',H{1})
hold on
plot(pHo_10,xdm_10(:,2),'v-','color',H{2})
plot(pHo_10,xdm_10(:,3),'^-','color',H{3})
plot(pHo_10,xdm_10(:,4),'o-','color',H{4})
plot(pHo_12,xdm_12(:,1),'d--','color',H{1})
plot(pHo_12,xdm_12(:,2),'v--','color',H{2})
plot(pHo_12,xdm_12(:,3),'^--','color',H{3})
plot(pHo_12,xdm_12(:,4),'o--','color',H{4})
% plot(pHo_10_exp,exp_t1k0(1,:),'o','color',H(1));
% plot(pHo_10_exp,exp_t1k0(2,:),'d','color',H(2));
% plot(pHo_10_exp,exp_t1k0(3,:),'s','color',H(3));
% plot(pHo_10_exp,exp_t1k0(4,:),'v','color',H(4));
% plot(pHo_12_exp,exp_t1k2(1,:),'o','markerfacecolor',H(1),'MarkerEdgeColor','none');
% plot(pHo_12_exp,exp_t1k2(2,:),'d','markerfacecolor',H(2),'MarkerEdgeColor','none');
% plot(pHo_12_exp,exp_t1k2(3,:),'s','markerfacecolor',H(3),'MarkerEdgeColor','none');
% plot(pHo_12_exp,exp_t1k2(4,:),'v','MarkerFaceColor',H(4),'MarkerEdgeColor','none');
hold off
axis square
ylim([0 1])
text(0.8,0.5,'(a)','units','normalized')

nexttile
plot(pHo_20,xdm_20(:,1),'d-','color',H{1})
hold on
plot(pHo_20,xdm_20(:,2),'v-','color',H{2})
plot(pHo_20,xdm_20(:,3),'^-','color',H{3})
plot(pHo_20,xdm_20(:,4),'o-','color',H{4})
plot(pHo_22,xdm_22(:,1),'d--','color',H{1})
plot(pHo_22,xdm_22(:,2),'v--','color',H{2})
plot(pHo_22,xdm_22(:,3),'^--','color',H{3})
plot(pHo_22,xdm_22(:,4),'o--','color',H{4})
hold off
axis square
ylim([0 2])
text(0.8,0.5,'(b)','units','normalized')

xlabel(t1,'pH')
ylabel(t1, 'Species Concentration (M)')
lgd1 = legend('DMEA','DMEAH^+','HCO_3^-','CO_3^2^-',...
              'DMEA in 2 M KCl','DMEAH^+ in 2 M KCl','HCO_3^- in 2 M KCl','CO_3^2^- in 2 M KCl',...
              'orientation','horizontal','numcolumns',4);
lgd1.Layout.Tile = 'north';

% figure(2)
% t2 = tiledlayout(1,2);
% nexttile
% plot(pHo_10,ysp10(:,1),'d-','color',H{1})
% hold on
% plot(pHo_10,ysp10(:,2),'v-','color',H{2})
% plot(pHo_10,ysp10(:,3),'^-','color',H{3})
% plot(pHo_10,ysp10(:,4),'o-','color',H{4})
% plot(pHo_12,ysp12(:,1),'d--','color',H{1})
% plot(pHo_12,ysp12(:,2),'v--','color',H{2})
% plot(pHo_12,ysp12(:,3),'^--','color',H{3})
% plot(pHo_12,ysp12(:,4),'o--','color',H{4})
% hold off
% axis square
% text(0.8,0.5,'(a)','units','normalized')
% 
% nexttile
% plot(pHo_20,ysp20(:,1),'d-','color',H{1})
% hold on
% plot(pHo_20,ysp20(:,2),'v-','color',H{2})
% plot(pHo_20,ysp20(:,3),'^-','color',H{3})
% plot(pHo_20,ysp20(:,4),'o-','color',H{4})
% plot(pHo_22,ysp22(:,1),'d--','color',H{1})
% plot(pHo_22,ysp22(:,2),'v--','color',H{2})
% plot(pHo_22,ysp22(:,3),'^--','color',H{3})
% plot(pHo_22,ysp22(:,4),'o--','color',H{4})
% hold off
% axis square
% text(0.8,0.5,'(b)','units','normalized')
% 
% xlabel(t2,'pH')
% ylabel(t2, 'Activity Coefficient, \gamma')
% lgd2 = legend('DMEA','DMEAH^+','HCO_3^-','CO_3^2^-',...
%               'DMEA in 2 M KCl','DMEAH^+ in 2 M KCl','HCO_3^- in 2 M KCl','CO_3^2^- in 2 M KCl',...
%               'orientation','horizontal','numcolumns',4);
% lgd2.Layout.Tile = 'north';

figure(2)
t2 = tiledlayout(2,3);
nexttile(1)
plot(pHo_10,xdm_10(:,1),'Color',H(1))
hold on
plot(pH1040,xdm1040(:,1),'--','Color',H(2))
plot(pH1050,xdm1050(:,1),'-.','color',H(3))
plot(pHo_10,xdm_10(:,2),'Color',H(1))
plot(pH1040,xdm1040(:,2),'--','Color',H(2))
plot(pH1050,xdm1050(:,2),'-.','color',H(3))
hold off
axis square
ylim([0 1])
text(0.8,0.9,'(a-1)','units','normalized')

nexttile(4)
plot(pHo_10,xdm_10(:,3),'Color',H(1))
hold on
plot(pH1040,xdm1040(:,3),'--','Color',H(2))
plot(pH1050,xdm1050(:,3),'-.','color',H(3))
plot(pHo_10,xdm_10(:,4),'Color',H(1))
plot(pH1040,xdm1040(:,4),'--','Color',H(2))
plot(pH1050,xdm1050(:,4),'-.','color',H(3))
hold off
axis square
ylim([0 1])
text(0.8,0.9,'(a-2)','units','normalized')

nexttile(2)
plot(pHo_20,xdm_20(:,1),'Color',H(1))
hold on
plot(pH2040,xdm2040(:,1),'--','Color',H(2))
plot(pH2050,xdm2050(:,1),'-.','color',H(3))
plot(pHo_20,xdm_20(:,2),'Color',H(1))
plot(pH2040,xdm2040(:,2),'--','Color',H(2))
plot(pH2050,xdm2050(:,2),'-.','color',H(3))
hold off
axis square
ylim([0 2])
text(0.8,0.9,'(b-1)','units','normalized')

nexttile(5)
plot(pHo_20,xdm_20(:,3),'Color',H(1))
hold on
plot(pH2040,xdm2040(:,3),'--','Color',H(2))
plot(pH2050,xdm2050(:,3),'-.','color',H(3))
plot(pHo_20,xdm_20(:,4),'Color',H(1))
plot(pH2040,xdm2040(:,4),'--','Color',H(2))
plot(pH2050,xdm2050(:,4),'-.','color',H(3))
hold off
axis square
ylim([0 2])
text(0.8,0.9,'(b-2)','units','normalized')

nexttile(3)
plot(pHo_30,xdm_30(:,1),'Color',H(1))
hold on
plot(pH3040,xdm3040(:,1),'--','Color',H(2))
plot(pH3050,xdm3050(:,1),'-.','color',H(3))
plot(pHo_30,xdm_30(:,2),'Color',H(1))
plot(pH3040,xdm3040(:,2),'--','Color',H(2))
plot(pH3050,xdm3050(:,2),'-.','color',H(3))
hold off
axis square
ylim([0 3])
text(0.8,0.9,'(b-1)','units','normalized')

nexttile(6)
plot(pHo_30,xdm_30(:,3),'Color',H(1))
hold on
plot(pH3040,xdm3040(:,3),'--','Color',H(2))
plot(pH3050,xdm3050(:,3),'-.','color',H(3))
plot(pHo_30,xdm_30(:,4),'Color',H(1))
plot(pH3040,xdm3040(:,4),'--','Color',H(2))
plot(pH3050,xdm3050(:,4),'-.','color',H(3))
hold off
hold off
axis square
ylim([0 3])
text(0.8,0.9,'(b-2)','units','normalized')

lgd2 = legend('25 ^oC','40 ^oC','50 ^oC','Orientation','horizontal');
lgd2.Layout.Tile = 'north';
xlabel(t2,'pH')
ylabel(t2,'Species Concentration (M)')
t2.TileSpacing = "compact";
t2.Padding = "compact";

figure(3)
t3 = tiledlayout(1,3);
nexttile(1)
plot(pHo_12,xdm_12(:,1),'Color',H(1))
hold on
plot(pH1240,xdm1240(:,1),'--','Color',H(2))
plot(pH1250,xdm1250(:,1),'-.','color',H(3))
plot(pHo_12,xdm_12(:,2),'Color',H(1))
plot(pH1240,xdm1240(:,2),'--','Color',H(2))
plot(pH1250,xdm1250(:,2),'-.','color',H(3))
hold off
axis square
ylim([0 1])
text(0.8,0.9,'(a-1)','units','normalized')

nexttile(3)
plot(pHo_12,xdm_12(:,3),'Color',H(1))
hold on
plot(pH1240,xdm1240(:,3),'--','Color',H(2))
plot(pH1250,xdm1250(:,3),'-.','color',H(3))
plot(pHo_12,xdm_12(:,4),'Color',H(1))
plot(pH1240,xdm1240(:,4),'--','Color',H(2))
plot(pH1250,xdm1250(:,4),'-.','color',H(3))
hold off
axis square
ylim([0 1])
text(0.8,0.9,'(a-2)','units','normalized')

nexttile(2)
plot(pHo_22,xdm_22(:,1),'Color',H(1))
hold on
plot(pH2240,xdm2240(:,1),'--','Color',H(2))
plot(pH2250,xdm2250(:,1),'-.','color',H(3))
plot(pHo_22,xdm_22(:,2),'Color',H(1))
plot(pH2240,xdm2240(:,2),'--','Color',H(2))
plot(pH2250,xdm2250(:,2),'-.','color',H(3))
hold off
axis square
ylim([0 2])
text(0.8,0.9,'(b-1)','units','normalized')

nexttile(4)
plot(pHo_22,xdm_22(:,3),'Color',H(1))
hold on
plot(pH2240,xdm2240(:,3),'--','Color',H(2))
plot(pH2250,xdm2250(:,3),'-.','color',H(3))
plot(pHo_22,xdm_22(:,4),'Color',H(1))
plot(pH2240,xdm2240(:,4),'--','Color',H(2))
plot(pH2250,xdm2250(:,4),'-.','color',H(3))
hold off
axis square
ylim([0 2])
text(0.8,0.9,'(b-2)','units','normalized')

lgd3 = legend('25 ^oC','40 ^oC','50 ^oC','Orientation','horizontal');
lgd3.Layout.Tile = 'north';
t3.TileSpacing = "compact";
t3.Padding = "compact";
xlabel(t3,'pH')
ylabel(t3,'Species Concentration (M)')


%% Functions
function [xdm, pco2, loading] = speciation(pHo, Camine, csalt, T)
% Calculate temperature dependent params

pka46 = pka_HCO3(T);
pka45 = pka_CO3(T);
pka_dmea = pka_DMEA(T);

Hco2 = henry(T);

%% Other constants
Kw = water(T);
atm = 101.325;

ln = length(pHo);
%% Create Array
sp = 5; % 5 species + 7 ions (K and Cl)
xini = zeros(ln,sp);
Ival = zeros(ln,1);
ysp = zeros(ln,sp);
xdm = zeros(ln,sp);
loading = zeros(ln,1);
pco2 = zeros(ln,1);

%% System Solving
for m = 1:1:ln
    pH = pHo(m);
    % C = cDMEA(m);
    % cK = KCl(m);
    C = Camine;
    cCl = csalt;
    cK = csalt;

    % Infinite Dilution
    syms Am AmH HCO3 carbonate co2free
    eq1 = Am == AmH*10^(pH - pka_dmea);
    eq2 = AmH == C-Am;
    eq4 = HCO3 == cK-cCl+AmH+10^(-pH)-10^(pH-Kw)-2*carbonate;
    eq5 = carbonate == HCO3*10^(pH - pka45);
    eq6 = co2free == HCO3/10^(pH - pka46);
    [Am,AmH,HCO3,carbonate,co2free] = solve(eq1,eq2,eq4,eq5,eq6);
    soln = [Am,AmH,HCO3,carbonate,co2free];
    soln = double(soln);
    xini(m,:) = soln;
    check = sum(soln>=0);
    if check(1) < sp
        warning('Modelling inaccuracy.')
    end
    sol_kcl = [soln cK cCl];
    z = [0 +1 -1 -2 0 +1 -1 ];
    z = z';

    I = 0.5*sol_kcl*(z.^2);
    Ival(m) = I;

    % Deshmukh-Mather Model, % Dong Fang Zhao 2024?
    if T < 273.15
        T = T+273.15;
        A = 1.306548+0.132823e-1/T-0.3550803e-4/(T^2)+0.3381968e-7/(T^3);
    else
        A = 1.306548+0.132823e-1/T-0.3550803e-4/(T^2)+0.3381968e-7/(T^3);
    end
    B = 1.2;
    Bij = zeros(sp+2,sp+2);
    % ab = 1e-3*[-0.698661144874426   0.057038206574542
    %            0.967894103126326   0.788145128306444
    %           -0.686786577314299   0.412432313028131
    %           -0.813045162565286   0.086889846530503
    %           -0.786678411114744  -0.462911429838779
    %           -0.045625595871069   0.060370961334994
    %           -0.862936547395458   0.339473795123459
    %           -0.137742357987167  -0.956150141971813
    %            0.899133112131313   0.072998828061862
    %           -0.660035590418535   0.194317310497253
    %           -0.253747598086172   0.954580583118840];
     ab = 1e-3*[-0.698661   0.057038
               0.967894   0.788145
              -0.686787   0.412432
              -0.813045   0.086890
              -0.786678  -0.462911
              -0.0456256   0.060371
              -0.8629365   0.339474
              -0.1377424  -0.956150
               0.8991331   0.072999
              -0.6600356   0.194317
              -0.2537476  0.954581];

    % DMEA-DMEAH+ 1-2
    Bij(1,2) = ab(1,1)+ab(1,2)*T; 
    Bij(2,1) = Bij(1,2);
    % DMEA-HCO3- 1-4
    Bij(1,3) = ab(2,1)+ab(2,2)*T;
    Bij(3,1) = Bij(1,3);
    % DMEA-CO3_2- 1-5
    Bij(1,4) = ab(3,1)+ab(3,2)*T;
    Bij(4,1) = Bij(1,4);
    % DMEA-K+ 1-7
    Bij(1,6) = ab(4,1)+ab(4,2)*T;
    Bij(6,1) = Bij(1,6);
    % DMEA-Cl- 1-8
    Bij(1,7) = ab(5,1)+ab(5,2)*T;
    Bij(7,1) = Bij(1,7);
    % DMEAH+-HCO3- 2-4
    Bij(2,3) = ab(6,1)+ab(6,2)*T;
    Bij(3,2) = Bij(2,3);
    % DMEAH+-CO3_2- 2-5
    Bij(2,4) = ab(7,1)+ab(7,2)*T;
    Bij(4,2) = Bij(2,4);
    % DMEAH+-Cl- 2-8
    Bij(2,7) = ab(8,1)+ab(8,2)*T;
    Bij(7,2) = Bij(2,7);
    % % HCO3--CO3_2- 4-5
    % Bij(3,4) = ab(9,1)+ab(9,2)*T;
    % Bij(4,3) = Bij(3,4);
    % HCO3--K+ 4-7
    Bij(3,6) = ab(9,1)+ab(9,2)*T;
    Bij(6,3) = Bij(4,7);
    % CO3_2--K+ 5-7
    Bij(4,6) = ab(10,1)+ab(10,2)*T;
    Bij(6,4) = Bij(4,6);
    % K+ - Cl- 7-8
    Bij(6,7) = ab(11,1)+ab(11,2)*T;
    Bij(7,6) = Bij(6,7);

    sol_kcl = sol_kcl';
    term2 = 2*Bij*sol_kcl;
    for i = 1:1:length(soln)
        term1(i) = -A*(z(i)^2)*sqrt(I)/(1+B*sqrt(I));
        ysp(m,i) = exp(term1(i)+term2(i));
    end
    ysp1 = ysp(m,1); ysp2 = ysp(m,2); 
    ysp4 = ysp(m,3); ysp5 = ysp(m,4); ysp6 = ysp(m,5);
    
    syms Amdm AmHdm HCO3dm carbonatedm co2freedm
    eq1dm = ysp1*Amdm == ysp2*AmHdm*10^(pH - pka_dmea);
    eq2dm = AmHdm == C-Amdm;
    eq4dm = HCO3dm == cK-cCl+AmHdm+10^(-pH)-10^(pH-Kw)-2*carbonatedm;
    eq5dm = ysp5*carbonatedm == ysp4*HCO3dm*10^(pH - pka45);
    eq6dm = ysp6*co2freedm == ysp4*HCO3dm/10^(pH - pka46);
    [AmHdm,Amdm,HCO3dm,carbonatedm,co2freedm] = solve(eq1dm,eq2dm,eq4dm,eq5dm,eq6dm);
    solndm= [Amdm,AmHdm,HCO3dm,carbonatedm,co2freedm];
    solndm = double(solndm);
    xdm(m,:) = solndm;
    checkdm = sum(solndm>=0);
    if checkdm(1) < sp
        warning('Modelling inaccuracy.')
    end

    Amdm = solndm(1); AmHdm = solndm(2); 
    HCO3dm = solndm(3); carbonatedm = solndm(4); co2freedm = solndm(5);
    totAm = Amdm+AmHdm;
    totC = HCO3dm+carbonatedm+co2freedm;
    loading(m) = totC/totAm;
    pco2(m) = co2freedm*Hco2*atm;
   
    disp(['DMEA ',num2str(Camine),' M + KCl ',num2str(csalt),' M. Done pH = ',num2str(pH),'. T = ',num2str(T-273.15),' C.'])
end
end

function ysp = actcoeff(pHo, Camine, csalt, T)
% Calculate temperature dependent params

pka46 = pka_HCO3(T);
pka45 = pka_CO3(T);
pka_dmea = pka_DMEA(T);

%% Other constants
Kw = water(T);

ln = length(pHo);
%% Create Array
sp = 5; % 5 species + 7 ions (K and Cl)
xini = zeros(ln,sp);
Ival = zeros(ln,1);
ysp = zeros(ln,sp);

%% System Solving
for m = 1:1:ln
    pH = pHo(m);
    % C = cDMEA(m);
    % cK = KCl(m);
    C = Camine;
    cCl = csalt;
    cK = csalt;

    % Infinite Dilution
    syms Am AmH HCO3 carbonate co2free
    eq1 = Am == AmH*10^(pH - pka_dmea);
    eq2 = AmH == C-Am;
    eq4 = HCO3 == cK-cCl+AmH+10^(-pH)-10^(pH-Kw)-2*carbonate;
    eq5 = carbonate == HCO3*10^(pH - pka45);
    eq6 = co2free == HCO3/10^(pH - pka46);
    [Am,AmH,HCO3,carbonate,co2free] = solve(eq1,eq2,eq4,eq5,eq6);
    soln = [Am,AmH,HCO3,carbonate,co2free];
    soln = double(soln);
    xini(m,:) = soln;
    check = sum(soln>=0);
    if check(1) < sp
        warning('Modelling inaccuracy.')
    end
    sol_kcl = [soln cK cCl];
    z = [0 +1 -1 -2 0 +1 -1 ];
    z = z';

    I = 0.5*sol_kcl*(z.^2);
    Ival(m) = I;

    % Deshmukh-Mather Model
    if T < 273.15
        T = T+273.15;
        A = 1.306548+0.132823e-1/T-0.3550803e-4/(T^2)+0.3381968e-7/(T^3);
    else
        A = 1.306548+0.132823e-1/T-0.3550803e-4/(T^2)+0.3381968e-7/(T^3);
    end
    B = 1.2;
    Bij = zeros(sp+2,sp+2);
    % ab = 1e-3*[-0.698661144874426   0.057038206574542
    %            0.967894103126326   0.788145128306444
    %           -0.686786577314299   0.412432313028131
    %           -0.813045162565286   0.086889846530503
    %           -0.786678411114744  -0.462911429838779
    %           -0.045625595871069   0.060370961334994
    %           -0.862936547395458   0.339473795123459
    %           -0.137742357987167  -0.956150141971813
    %            0.899133112131313   0.072998828061862
    %           -0.660035590418535   0.194317310497253
    %           -0.253747598086172   0.954580583118840];
     ab = 1e-3*[-0.698661   0.057038
               0.967894   0.788145
              -0.686787   0.412432
              -0.813045   0.086890
              -0.786678  -0.462911
              -0.0456256   0.060371
              -0.8629365   0.339474
              -0.1377424  -0.956150
               0.8991331   0.072999
              -0.6600356   0.194317
              -0.2537476  0.954581];
     % ab = zeros(size(ab));

    % DMEA-DMEAH+ 1-2
    Bij(1,2) = ab(1,1)+ab(1,2)*T; 
    Bij(2,1) = Bij(1,2);
    % DMEA-HCO3- 1-4
    Bij(1,3) = ab(2,1)+ab(2,2)*T;
    Bij(3,1) = Bij(1,3);
    % DMEA-CO3_2- 1-5
    Bij(1,4) = ab(3,1)+ab(3,2)*T;
    Bij(4,1) = Bij(1,4);
    % DMEA-K+ 1-7
    Bij(1,6) = ab(4,1)+ab(4,2)*T;
    Bij(6,1) = Bij(1,6);
    % DMEA-Cl- 1-8
    Bij(1,7) = ab(5,1)+ab(5,2)*T;
    Bij(7,1) = Bij(1,7);
    % DMEAH+-HCO3- 2-4
    Bij(2,3) = ab(6,1)+ab(6,2)*T;
    Bij(3,2) = Bij(2,3);
    % DMEAH+-CO3_2- 2-5
    Bij(2,4) = ab(7,1)+ab(7,2)*T;
    Bij(4,2) = Bij(2,4);
    % DMEAH+-Cl- 2-8
    Bij(2,7) = ab(8,1)+ab(8,2)*T;
    Bij(7,2) = Bij(2,7);
    % % HCO3--CO3_2- 4-5
    % Bij(3,4) = ab(9,1)+ab(9,2)*T;
    % Bij(4,3) = Bij(3,4);
    % HCO3--K+ 4-7
    Bij(3,6) = ab(9,1)+ab(9,2)*T;
    Bij(6,3) = Bij(4,7);
    % CO3_2--K+ 5-7
    Bij(4,6) = ab(10,1)+ab(10,2)*T;
    Bij(6,4) = Bij(4,6);
    % K+ - Cl- 7-8
    Bij(6,7) = ab(11,1)+ab(11,2)*T;
    Bij(7,6) = Bij(6,7);

    sol_kcl = sol_kcl';
    term2 = 2*Bij*sol_kcl;
    for i = 1:1:length(soln)
        term1(i) = -A*(z(i)^2)*sqrt(I)/(1+B*sqrt(I));
        ysp(m,i) = exp(term1(i)+term2(i));
    end
   
    disp(['DMEA ',num2str(Camine),' M + KCl ',num2str(csalt),' M. Done pH = ',num2str(pH)])
end
end

%% pKa of HCO3-
function pka3 = pka_HCO3(T)
if T < 273.15
    T= T+273.15;
    pka3 = -1234.4+68608./T+193.37.*log(T)-0.16423.*T-3746800./(T.^2);
else
    pka3 = -1234.4+68608./T+193.37.*log(T)-0.16423.*T-3746800./(T.^2);
end
end

%% pKa of CO3_2-
function pka4 = pka_CO3(T)

T0 = [25 50 75];
pka4_0 = [10.33 10.17 10.107];
if T > 273.15
    T = T-273.15;
    pka4 = makima(T0,pka4_0,T);
else
    pka4 = makima(T0,pka4_0,T);
end
end

%% pKa of DMEA
function pka1 = pka_DMEA(T)

T0 = [293 303 318 333];
lnK_DMEA_0 = [-21.47 -21.01 -20.33 -19.68];
K_DMEA_0 = exp(lnK_DMEA_0);
pKa_DMEA_0 = -log10(K_DMEA_0);
if T < 273.15
    T = T+273.15;
    pka1 = makima(T0,pKa_DMEA_0,T);
else
    pka1 = makima(T0,pKa_DMEA_0,T);
end
end

%% Henry's Law Constant
function He = henry(T)
if T < 273.15
    T = T+273.15;
    He = exp(94.4914-6789.04/T-11.4519*log(T)-0.010454*T);
else
    He = exp(94.4914-6789.04/T-11.4519*log(T)-0.010454*T);
end    
end

%% Kw
function pKw = water(T)
if T < 273.15
    T = T+273.15;
    Kw = exp(140.932-13445.09/T-22.4773*log(T));
else
    Kw = exp(140.932-13445.09/T-22.4773*log(T));
end    
pKw = -log10(Kw);
end