function [force_length_regression] = get_muscle_force_length_regression()
    %%% TASK 2
    % Input Parameters
    %   data(:,1): samples of an independent variable
    %   data(:,2): corresponding samples of a dependent variable
    % Output
    %   force_length_regression: the generated Gaussian model

    %     WRITE CODE HERE
    %      1) Use WebPlotDigitizer to extract force-length points
    %     from Winters et al. (2011) Figure 3C, which is on Learn. Click
    %     "View Data", select all, cut, and paste below. 
    %     2) Normalize the data so optimal length = 1 and peak = 1. 
    %     3) Return a Regression object that  uses Gaussian basis functions.

    % Define data points
    data = [37.3443579766537 9.420935412026708;
            39.445525291828794 3.6302895322939435;
            41.780155642023345 1.7371937639198052;
            38.336575875486375 14.432071269487736;
            40.35019455252918 17.772828507795083;
            40.37937743190662 21.55902004454346;
            39.1828793774319 24.23162583518929;
            40.35019455252918 36.703786191536736;
            41.40077821011673 31.581291759465458;
            42.159533073929964 31.804008908685944;
            43.356031128404666 34.92204899777282;
            43.385214007782096 34.47661469933183;
            42.8307392996109 23.34075723830736;
            43.414396887159526 23.78619153674832;
            43.852140077821005 22.227171492204874;
            41.40077821011673 26.458797327394194;
            41.34241245136187 14.432071269487764;
            41.40077821011673 15.54565701559018;
            45.369649805447466 53.630289532293986;
            45.22373540856031 54.07572383073496;
            44.37743190661479 60.64587973273942;
            43.706225680933855 57.08240534521157;
            43.385214007782096 53.85300668151447;
            43.09338521400778 50.17817371937639;
            42.85992217898833 48.39643652561246;
            42.80155642023347 46.391982182628055;
            43.326848249027236 44.49888641425389;
            42.45136186770428 42.271714922048986;
            44.37743190661478 45.38975501113585;
            45.4863813229572 46.50334075723829;
            45.54474708171206 46.280623608017805;
            45.54474708171206 43.608017817371916;
            46.6828793774319 44.721603563474375;
            46.39105058365759 62.65033407572382;
            47.38326848249028 62.53897550111357;
            48.98832684824903 62.87305122494432;
            47.67509727626458 66.77060133630289;
            47.383268482490266 71.55902004454342;
            45.719844357976655 67.66146993318485;
            45.92412451361868 70.77951002227171;
            46.42023346303502 71.67037861915367;
            46.42023346303502 73.45211581291758;
            46.65369649805447 75.456570155902;
            47.06225680933852 80.35634743875278;
            47.58754863813229 81.46993318485522;
            47.47081712062257 81.24721603563474;
            48.11284046692606 83.25167037861917;
            48.87159533073929 85.25612472160356;
            49.80544747081712 85.03340757238307;
            49.630350194552534 86.48106904231625;
            50.214007782101156 87.5946547884187;
            50.651750972762635 87.03786191536747;
            50.680933852140065 85.25612472160356;
            50.6225680933852 84.92204899777283;
            50.68093385214007 90.48997772828508;
            51.67315175097277 90.8240534521158;
            51.527237354085614 89.48775055679286;
            52.63618677042802 89.15367483296214;
            53.24902723735407 88.70824053452117;
            53.5408560311284 83.25167037861914;
            53.5408560311284 78.79732739420933;
            50.73929961089494 77.90645879732739;
            50.73929961089494 78.12917594654787;
            51.11867704280154 78.6859688195991;
            50.94357976653697 80.13363028953228;
            48.929961089494164 82.1380846325167;
            48.98832684824903 81.24721603563474;
            49.747081712062254 81.9153674832962;
            49.45525291828793 76.12472160356347;
            50.564202334630366 74.34298440979956;
            53.657587548638126 92.38307349665924;
            53.89105058365759 92.0489977728285;
            54.124513618677035 93.71937639198218;
            54.29961089494163 94.38752783964365;
            53.48249027237354 94.72160356347439;
            53.57003891050582 96.39198218262806;
            53.83268482490273 96.83741648106904;
            54.62062256809339 99.51002227171492;
            55.72957198443579 96.05790645879733;
            56.07976653696498 96.05790645879733;
            56.40077821011673 99.62138084632517;
            56.80933852140078 99.62138084632517;
            57.04280155642024 99.73273942093542;
            57.50972762645913 99.62138084632517;
            57.80155642023346 99.28730512249444;
            57.276264591439684 97.83964365256125;
            58.53112840466927 96.05790645879733;
            58.910505836575865 99.1759465478842;
            59.319066147859935 97.83964365256125;
            59.78599221789884 96.83741648106904;
            59.61089494163424 95.72383073496658;
            59.961089494163424 95.72383073496658;
            60.54474708171205 93.60801781737194;
            61.36186770428016 94.83296213808464;
            62.32490272373541 96.28062360801782;
            60.54474708171206 99.51002227171492;
            61.30350194552528 91.93763919821826;
            61.391050583657574 87.70601336302894;
            62.178988326848255 89.37639198218262;
            57.80155642023346 91.15812917594656;
            58.3852140077821 90.48997772828508;
            59.34824902723736 91.0467706013363;
            63.69649805447471 89.48775055679286;
            63.14202334630349 86.25835189309576;
            63.66731517509726 85.70155902004453;
            63.66731517509726 85.47884187082406;
            63.754863813229555 86.92650334075724;
            64.51361867704281 86.81514476614699;
            63.463035019455255 79.57683741648106;
            63.40466926070039 80.69042316258351;
            63.871595330739304 80.1336302895323;
            64.48443579766537 81.69265033407572;
            63.929961089494164 76.12472160356347;
            62.5875486381323 79.6881959910913;
            61.39105058365758 79.46547884187082;
            61.39105058365759 76.79287305122494;
            61.24513618677043 84.14253897550111;
            65.38910505836577 63.986636971046764;
            65.73929961089493 66.3251670378619;
            65.65175097276264 68.10690423162583;
            65.5933852140078 72.78396436525613;
            66.08949416342412 72.00445434298442;
            66.38132295719845 75.456570155902;
            65.09727626459144 76.23608017817372;
            66.84824902723736 66.21380846325165;
            67.16926070038909 63.20712694877504;
            67.78210116731518 62.53897550111357;
            68.39494163424125 59.53229398663696;
            63.34630350194553 59.19821826280622;
            63.37548638132295 52.850779510022264;
            64.74708171206225 53.407572383073486;
            64.74708171206224 51.84855233853007;
            65.71011673151752 47.728285077950986;
            67.49027237354085 51.62583518930957;
            66.96498054474708 42.71714922048997;
            67.37354085603113 35.59020044543428;
            69.38715953307391 41.38084632516703;
            69.38715953307391 41.714922048997764;
            70.52529182879377 48.50779510022271;
            68.54085603112841 27.238307349665874;
            70.20428015564201 29.576837416481084;
            70.35019455252916 29.576837416481055;
            71.40077821011673 34.25389755011135;
            73.41439688715953 34.47661469933183;
            72.42217898832686 24.454342984409777;
            72.97665369649806 25.56792873051222;
            73.44357976653697 18.66369710467704;
            73.44357976653697 17.661469933184875;
            73.41439688715953 12.538975501113569;
            74.40661478599222 12.873051224944334;
            75.3988326848249 12.538975501113597;
            75.22373540856029 17.77282850779511;
            76.44941634241243 8.4187082405345];

    length = data(:,1); 
    force = data(:,2); 
      
    % Normalization 
    force = force./max(force); % normalize force 
    max_force_index = round(median(find(force == max(force)))); % find the index of location where force is max 
    length = length./length(max_force_index); % normalize length
      
    force_length_regression = fit(length, force,'gauss2');
end