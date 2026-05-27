clear
format long
gem = get(gca,'ColorOrder');
H = rgb2hex(gem);

%% Speciation Data
T = 25;
% cDMEA	= [3	3	3	3	2	2	2	2	2	2	2	2	2	2	2	1	1	1	1	1	1	1	1	1	1	1];
% KCl	= [0	0	0	0	0	0	0	0	0	2	2	2	2	2	2	0	0	0	0	0	0	2	2	2	2	2];
% pCO2	= [20	40	80	101.325	10	20	40	80	101.325	5	10	20	40	80	101.325	5	10	20	40	80	101.325	5	10	20	40	101.325];
% pHo	= [8.71	8.47	8.19	8.14	8.64	8.41	8.16	7.92	7.79	8.75	8.63	8.41	8.23	7.95	7.87	8.55	8.41	8.18	7.95	7.65	7.57	8.61	8.33	8.16	7.93	7.50];
% alpha	= [0.791	0.863	0.909	0.906	0.782	0.842	0.915	0.944	0.948	0.777	0.811	0.892	0.915	0.951	0.960	0.737	0.821	0.882	0.971	0.980	0.984	0.844	0.896	0.926	0.976	1.042];
% Bicarb	= [2.170	2.452	2.654	2.667	1.401	1.571	1.759	1.858	1.875	1.361	1.483	1.694	1.786	1.892	1.920	0.674	0.774	0.853	0.955	0.974	0.979	0.764	0.851	0.900	0.962	1.042];
% Carb	= [0.204	0.137	0.072	0.051	0.164	0.113	0.072	0.031	0.022	0.192	0.139	0.090	0.045	0.009	0.000	0.063	0.048	0.029	0.016	0.006	0.005	0.080	0.045	0.026	0.013	0.000];
% DMEA	= [0.071	0.078	0.017	0.000	0.160	0.092	0.046	0.011	0.000	0.076	0.051	0.028	0.014	0.003	0.000	0.092	0.060	0.032	0.014	0.006	0.003	0.055	0.028	0.017	0.008	0.000];
% DMEAH	= [2.929	2.922	2.983	3.000	1.840	1.908	1.954	1.989	2.000	1.924	1.949	1.972	1.986	1.997	2.000	0.908	0.940	0.968	0.986	0.994	0.997	0.945	0.972	0.983	0.992	1.000];
% Input = [cDMEA' KCl' pCO2']';
% Output = [DMEAH' Bicarb' alpha']';

cDMEA	= [3	3	3	3	2	2	2	2	2	2	2	2	2	2	2	1	1	1	1	1	1	1	1	1	1	1];
KCl	= [0	0	0	0	0	0	0	0	0	2	2	2	2	2	2	0	0	0	0	0	0	2	2	2	2	2];
pCO2	= [20	40	80	101.325	10	20	40	80	101.325	5	10	20	40	80	101.325	5	10	20	40	80	101.325	5	10	20	40	101.325];
pHo	= [8.71	8.47	8.19	8.14	8.64	8.41	8.16	7.92	7.79	8.75	8.63	8.41	8.23	7.95	7.87	8.55	8.41	8.18	7.95	7.65	7.57	8.61	8.33	8.16	7.93	7.50];
alpha	= [0.791	0.863	0.909	0.906	0.782	0.842	0.915	0.944	0.948	0.777	0.811	0.892	0.915	0.951	0.960	0.737	0.821	0.882	0.971	0.980	0.984	0.844	0.896	0.926	0.976	1.042];
Bicarb	= [2.170	2.452	2.654	2.667	1.401	1.571	1.759	1.858	1.875	1.361	1.483	1.694	1.786	1.892	1.920	0.674	0.774	0.853	0.955	0.974	0.979	0.764	0.851	0.900	0.962	1.042];
Carb	= [0.204	0.137	0.072	0.051	0.164	0.113	0.072	0.031	0.022	0.192	0.139	0.090	0.045	0.009	0.000	0.063	0.048	0.029	0.016	0.006	0.005	0.080	0.045	0.026	0.013	0.000];
DMEA	= [0.071	0.078	0.017	0.000	0.160	0.092	0.046	0.011	0.000	0.076	0.051	0.028	0.014	0.003	0.000	0.092	0.060	0.032	0.014	0.006	0.003	0.055	0.028	0.017	0.008	0.000];
DMEAH	= [2.929	2.922	2.983	3.000	1.840	1.908	1.954	1.989	2.000	1.924	1.949	1.972	1.986	1.997	2.000	0.908	0.940	0.968	0.986	0.994	0.997	0.945	0.972	0.983	0.992	1.000];
Input = [cDMEA' KCl' pCO2']';
Output = [DMEAH' Bicarb' alpha']';


[DMEAH_DM,HCO3_DM,loading_DM] = speciation(pHo, cDMEA, KCl, T);
[DMEAH_NN,HCO3_NN,loading_NN] = nnpredict(Input,Output);

% Metrics
[aard_DMEAH_DM, aad_DMEAH_DM, r2_DMEAH_DM] = computeMetrics(DMEAH, DMEAH_DM);
[aard_DMEAH_NN, aad_DMEAH_NN, r2_DMEAH_NN] = computeMetrics(DMEAH, DMEAH_NN);
[aard_Bicarb_DM, aad_Bicarb_DM, r2_Bicarb_DM] = computeMetrics(Bicarb, HCO3_DM);
[aard_Bicarb_NN, aad_Bicarb_NN, r2_Bicarb_NN] = computeMetrics(Bicarb, HCO3_NN);
[aard_loading_DM, aad_loading_DM, r2_loading_DM] = computeMetrics(alpha, loading_DM');
[aard_loading_NN, aad_loading_NN, r2_loading_NN] = computeMetrics(alpha, loading_NN);

t1 = tiledlayout(2,2);
nexttile
plot(min(DMEAH)-0.1:0.01:max(DMEAH)+0.1,min(DMEAH)-0.1:0.01:max(DMEAH)+0.1,'k')
hold on
plot(DMEAH,DMEAH_NN,'o','color',H(1))
plot(DMEAH,DMEAH_DM,'s','color',H(2))
hold off
xlim([min(DMEAH)-0.1 max(DMEAH)+0.1])
ylim([min(DMEAH)-0.1 max(DMEAH)+0.1])
axis square
text(0.8,0.2,'(a)','units','normalized')
legend('y = x','PSO-NN','DM model','location','northwest')

nexttile
plot(min(Bicarb)-0.1:0.01:max(Bicarb)+0.1,min(Bicarb)-0.1:0.01:max(Bicarb)+0.1,'k')
hold on
plot(Bicarb,HCO3_NN,'o','color',H(1))
plot(Bicarb,HCO3_DM,'s','color',H(2))
hold off
axis square
xlim([min(Bicarb)-0.1 max(Bicarb)+0.1])
ylim([min(Bicarb)-0.1 max(Bicarb)+0.1])
text(0.8,0.2,'(b)','units','normalized')

nexttile
plot(min(alpha)-0.05:0.01:max(alpha)+0.05,min(alpha)-0.05:0.01:max(alpha)+0.05,'k')
hold on
plot(alpha,loading_NN,'o','color',H(1))
plot(alpha,loading_DM,'s','color',H(2))
hold off
axis square
xlim([min(alpha)-0.05 max(alpha)+0.05])
ylim([min(alpha)-0.05 max(alpha)+0.05])
text(0.8,0.2,'(c)','units','normalized')

xlabel(t1,'Experimental Data')
ylabel(t1,'Predicted Data')
t1.TileSpacing = 'compact';
t1.Padding = 'compact';

function [DMEAH,Bicarb, loading] = speciation(pHo, Camine, csalt, T)
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
    C = Camine(m);
    cK = csalt(m);
    cCl = cK;
    % C = Camine;
    % cCl = csalt;
    % cK = csalt;

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

    DMEAH(m) = AmHdm;
    Bicarb(m) = HCO3dm;
   
    disp(['DMEA ',num2str(Camine(m)),' M + KCl ',num2str(csalt(m)),' M. Done pH = ',num2str(pH),'. T = ',num2str(T-273.15),' C.'])
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

function [DMEAH,HCO3,alpha] = nnpredict(Input,Output)
[inputNorm, ~] = normalizeData(Input);
[targetNorm, targetSettings] = normalizeData(Output);

% nInput = size(xTestNorm, 1);
nHidden = 5;           

% Re-create and configure network (NO training needed)
net = feedforwardnet(nHidden);
net = configure(net,inputNorm,targetNorm);

bestWBpso = [-1.999999999	2	1.768156687	-2	0.020520331	0.722357016	-0.114443375	0.5770255	-0.985306464	1.99999869	-0.094082436	0.133005926	-0.149416779	0.781060295	0.012548242	-1.999999999	1.770640408	-0.073445249	0.354324386	0.031176569	0.81337789	-0.937369202	-1.862699504	-0.008951952	-0.361282756	0.220054772	0.061064808	0.17387981	1.959682601	-1.073025862	0.747777409	0.93839119	-0.141057119	0.143652674	0.393778214	1.041177597	0.836937926	-0.334705755];
netpso = setwb(net, bestWBpso);

tPred = netpso(inputNorm);
tPredNorm = denormalizeData(tPred,targetSettings);
DMEAH = tPredNorm(1,:);
HCO3 = tPredNorm(2,:);
alpha = tPredNorm(3,:);

end

function [normalizedData, settings] = normalizeData(data)
    dataMin = min(data, [], 2);
    dataMax = max(data, [], 2);
    settings.min = dataMin;
    settings.max = dataMax;
    settings.range = dataMax - dataMin;
    normalizedData = (data - dataMin) ./ settings.range;
end

function denormalizedData = denormalizeData(normalizedData, settings)
    denormalizedData = normalizedData .* settings.range + settings.min;
end

function r2 = rsquared(yTrue, yPred)
% yTrue = yTrue(:);
% yPred = yPred(:);
    SS_res = sum((yTrue - yPred).^2);
    SS_tot = sum((yTrue - mean(yTrue)).^2);
    r2 = 1 - SS_res / SS_tot;
end

function aad = computeAAD(yTrue, yPred)
% yTrue = yTrue(:);
% yPred = yPred(:)
    deviation = abs(yTrue - yPred);
    aad = mean(mean(deviation))*100;
end

function aard = computeAARD(yTrue, yPred)
% yTrue = yTrue(:);
% yPred = yPred(:);
    deviation = abs(yTrue - yPred)'./yTrue';
    aard = mean(mean(deviation))*100;
end

function [aard, aad, r2] = computeMetrics(yTrue, yPred)
    [row, ~] = size(yTrue);
    for i = 1:1:row
        aard(i) = computeAARD(yTrue(i,:),yPred(i,:));
        aad(i) = computeAAD(yTrue(i,:),yPred(i,:));
        r2(i) = rsquared(yTrue(i,:),yPred(i,:));
    end
end