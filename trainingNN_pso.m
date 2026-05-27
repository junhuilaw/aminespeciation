clear
format long

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

% Normalize
[inputNorm, inputSettings] = normalizeData(Input);
[targetNorm, targetSettings] = normalizeData(Output);

% Parameters
nHidden = 5;     % fixed number of neurons
cv = load("cv.mat");

% Create fixed net
netTemplate = feedforwardnet(nHidden);
netTemplate.trainParam.showWindow = false;
netTemplate.divideFcn = 'dividetrain';  % We handle CV manually
netTemplate = configure(netTemplate, inputNorm, targetNorm);
nVars = numel(getwb(netTemplate));  % total number of weights/biases
% nVars = 1;
% Particle Swarm options
options = optimoptions('particleswarm', ...
    'Display', 'iter', ...
    'SwarmSize', 50, ...
    'MaxIterations', 5000, ...
    'UseParallel', true, ...
    'MaxStallIterations',100, ...
    'FunctionTolerance',1e-20,...
    'OutputFcn',@OutFcn);

tic

trainIdx = cv.cv.training(5);
valIdx = cv.cv.test(5);

xTrain = inputNorm(:, trainIdx);
tTrain = targetNorm(:, trainIdx);
xVal = inputNorm(:, valIdx);
tVal = targetNorm(:, valIdx);

% Define cost function
costFun = @(wb) psCostFunction(wb, netTemplate, xTrain, tTrain, xVal, tVal);

% Run particleswarm
h = 2;
ub = h*ones(nVars,1);
% ub(3) = 3;
lb = -ub;
[bestWB, bestMSE] = particleswarm(costFun, nVars, lb, ub, options);

toc

function stop = OutFcn(optimValues, state)
    persistent allBestValues allIterations

    stop = false; % No stopping condition from here

    switch state
        case 'init'
            % Initialize storage variables
            allBestValues = [];
            allIterations = [];

        case 'iter'
            % Append current iteration data
            allBestValues = [allBestValues; optimValues.bestfval];
            allIterations = [allIterations; optimValues.iteration];

        case 'done'
            % Save data to base workspace or a MAT file at the end of optimization
            assignin('base', 'allBestValues', allBestValues);
            assignin('base', 'allIterations', allIterations);
            writematrix([allBestValues allIterations],'PSOResults.xlsx');
            
    end
end

function mseVal = psCostFunction(wb, net, xTrain, tTrain, xVal, tVal)
    % wb = [-0.018750221235209
    %       -0.231854007160830
    %        1.899987231083847
    %        0.670809382408576
    %       -0.278094038209275
    %       -0.089950450950594
    %        0.035897772543830
    %        0.069195747220091
    %        0.093727648148696
    %       -0.127305761729980
    %       -0.259215356900416
    %        0.386111507730231
    %       -0.406227618576906
    %       -0.754783716417552
    %       -0.590863730103667
    %        0.847076342575313
    %       -1.485114434729851
    %       -0.853149539313854
    %        1.597801629947248
    %        1.308869241811893
    %        0.961142479352968
    %       -0.370544046948418
    %       -0.496715799496696
    %        1.272701328955503
    %       -0.920286179192473
    %        1.610957505352615
    %        1.434459325723043];
    net = setwb(net, wb);  
    yPredTrain = net(xTrain);
    yPredVal = net(xVal);
    mseTrain = mse(tTrain - yPredTrain);
    mseValid = mse(tVal - yPredVal);   % Return MSE
    mseVal = mseTrain + mseValid;
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