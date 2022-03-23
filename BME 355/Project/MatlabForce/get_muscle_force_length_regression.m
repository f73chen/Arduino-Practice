function [force_length_regression] = get_muscle_force_length_regression()
%%% TASK 2

% Input Parameters
% data(:,1): samples of an independent variable
% data(:,2): corresponding samples of a dependent variable

% Output
% force_length_regression: the genered Gaussian model

%     WRITE CODE HERE
%      1) Use WebPlotDigitizer to extract force-length points
%     from Winters et al. (2011) Figure 3C, which is on Learn. Click
%     "View Data", select all, cut, and paste below.
%     2) Normalize the data so optimal length = 1 and peak = 1.
%     3) Return a Regression object that  uses Gaussian basis functions.

%% Define data points
data = [39.31662870159453, 3.3986928104575327
    41.77676537585421, 1.8300653594771177
    37.33485193621868, 9.673202614379093
    38.359908883826876, 14.640522875816998
    41.36674259681094, 14.640522875816998
    41.36674259681094, 15.686274509803923
    40.34168564920273, 17.516339869281055
    40.34168564920273, 21.43790849673202
    39.24829157175398, 24.575163398692823
    41.36674259681094, 26.66666666666667
    42.87015945330296, 23.52941176470587
    43.416856492027335, 23.52941176470587
    43.82687927107061, 21.960784313725483
    41.36674259681094, 31.633986928104562
    42.0501138952164, 31.895424836601308
    43.34851936218679, 35.03267973856208
    40.34168564920273, 36.60130718954248
    42.52847380410023, 42.09150326797385
    43.34851936218679, 44.705882352941174
    44.373576309794984, 45.49019607843137
    42.80182232346242, 46.27450980392156
    42.80182232346242, 48.36601307189542
    43.14350797266515, 50.196078431372555
    45.53530751708428, 46.53594771241829
    45.53530751708428, 43.66013071895425
    46.69703872437357, 44.705882352941174
    43.416856492027335, 54.11764705882352
    43.69020501138952, 57.254901960784295
    45.33029612756264, 53.59477124183006
    45.19362186788155, 54.11764705882352
    44.373576309794984, 60.91503267973856
    46.42369020501139, 62.74509803921568
    47.380410022779046, 62.74509803921568
    48.95216400911161, 63.00653594771241
    47.722095671981776, 66.92810457516339
    45.67198177676538, 67.97385620915031
    45.945330296127565, 70.84967320261437
    46.42369020501139, 71.63398692810456
    47.380410022779046, 71.63398692810456
    46.35535307517084, 73.72549019607843
    46.62870159453303, 75.55555555555554
    47.03872437357631, 80.52287581699346
    47.51708428246014, 81.83006535947712
    48.13211845102505, 83.3986928104575
    48.95216400911161, 82.35294117647058
    48.95216400911161, 81.56862745098039
    49.772209567198175, 82.09150326797385
    49.430523917995444, 76.078431372549
    50.59225512528474, 74.77124183006535
    50.72892938496583, 78.16993464052285
    51.13895216400911, 78.95424836601305
    50.93394077448747, 80.52287581699346
    48.88382687927107, 85.75163398692808
    49.772209567198175, 85.22875816993462
    49.63553530751709, 86.79738562091501
    50.66059225512528, 85.22875816993462
    50.250569476082006, 87.84313725490195
    50.66059225512528, 87.32026143790848
    50.66059225512528, 90.718954248366
    51.48063781321184, 89.93464052287581
    51.68564920273349, 91.24183006535947
    52.642369020501135, 89.41176470588235
    53.25740318906605, 88.88888888888887
    53.59908883826879, 83.3986928104575
    53.4624145785877, 78.69281045751632
    53.87243735763098, 92.28758169934639
    53.59908883826879, 92.54901960784312
    53.4624145785877, 94.9019607843137
    54.28246013667426, 94.64052287581697
    54.145785876993166, 93.85620915032678
    53.53075170842824, 96.73202614379083
    53.80410022779043, 97.2549019607843
    54.62414578587699, 99.86928104575162
    55.71753986332574, 96.47058823529409
    56.12756264236902, 96.47058823529409
    56.40091116173121, 99.86928104575162
    56.81093394077448, 99.86928104575162
    57.289293849658314, 98.30065359477123
    57.08428246013667, 99.86928104575162
    57.49430523917995, 99.86928104575162
    57.83599088838269, 99.60784313725489
    58.587699316628694, 96.47058823529409
    58.86104783599089, 99.34640522875816
    59.33940774487471, 98.0392156862745
    59.68109339407745, 96.20915032679736
    59.817767653758544, 96.99346405228756
    59.95444191343963, 95.94771241830063
    57.83599088838269, 91.24183006535947
    58.38268792710706, 90.98039215686273
    59.33940774487471, 91.5032679738562
    60.56947608200455, 99.86928104575162
    60.56947608200455, 93.85620915032678
    61.32118451025057, 95.16339869281043
    61.32118451025057, 92.28758169934639
    62.34624145785877, 96.73202614379083
    62.20956719817767, 89.67320261437908
    61.38952164009112, 88.10457516339868
    61.252847380410024, 84.70588235294116
    61.38952164009112, 79.73856209150324
    61.45785876993166, 77.64705882352939
    62.619589977220954, 79.73856209150324
    63.7129840546697, 89.93464052287581
    63.16628701594533, 86.53594771241828
    63.64464692482915, 85.75163398692808
    63.78132118451025, 87.05882352941174
    64.46469248291572, 87.05882352941174
    63.43963553530751, 79.73856209150324
    63.43963553530751, 80.7843137254902
    63.84965831435079, 80.26143790849673
    64.53302961275625, 81.83006535947712
    63.986332574031884, 76.33986928104574
    65.14806378132118, 76.33986928104574
    66.44646924829158, 75.81699346405227
    65.626423690205, 72.94117647058823
    66.10478359908883, 72.15686274509802
    65.7630979498861, 68.23529411764704
    65.7630979498861, 66.40522875816993
    65.42141230068336, 64.31372549019606
    66.85649202733484, 66.40522875816993
    67.19817767653758, 63.26797385620914
    67.8132118451025, 62.74509803921568
    68.42824601366743, 59.6078431372549
    67.47152619589977, 52.02614379084967
    63.371298405466966, 53.0718954248366
    64.80637813211845, 53.59477124183006
    64.80637813211845, 52.02614379084967
    65.69476082004556, 47.84313725490195
    67.06150341685648, 42.61437908496731
    63.371298405466966, 59.34640522875816
    70.54669703872437, 48.627450980392155
    69.45330296127563, 41.83006535947712
    67.40318906605921, 35.55555555555556
    71.43507972665148, 34.50980392156862
    73.41685649202734, 34.50980392156862
    70.20501138952164, 29.542483660130713
    70.41002277904327, 29.542483660130713
    72.46013667425967, 24.575163398692823
    73.00683371298405, 25.620915032679747
    73.41685649202734, 18.56209150326798
    73.41685649202734, 17.516339869281055
    73.41685649202734, 12.54901960784315
    74.44191343963553, 12.810457516339866
    68.56492027334852, 27.45098039215685
    75.26195899772209, 17.516339869281055
    75.46697038724373, 12.54901960784315
    76.42369020501138, 8.627450980392169];

length = data(:,1);
force = data(:,2);

%% Normalization
% normalizing force
[max_force, index] = max(force);
force_norm = force / max_force;
% normalizing length
rest_length = length(index);
length_norm = length / rest_length;

%% Regression with "fit" function with "gauss2" option as model type
force_length_regression = fit(length_norm, force_norm, 'gauss2');
end
