# 7seg truth table
# only input numbers
sevenseginputtable = [0 0 0 0; ... #0
                      0 0 0 1; ... #1
                      0 0 1 0; ... #2
                      0 0 1 1; ... #3
                      0 1 0 0; ... #4
                      0 1 0 1; ... #5
                      0 1 1 0; ... #6
                      0 1 1 1; ... #7
                      1 0 0 0; ... #8
                      1 0 0 1; ... #9
                      ];
#uses https://en.wikipedia.org/wiki/Seven-segment_display#Displaying_letters
sevensegoutputtable = [1 1 1 1 1 1 0; ... #0
                       0 1 1 0 0 0 0; ... #1
                       1 1 0 1 1 0 1; ... #2
                       1 1 1 1 0 0 1; ... #3
                       0 1 1 0 0 1 1; ... #4
                       1 0 1 1 0 1 1; ... #5
                       1 0 1 1 1 1 1; ... #6
                       1 1 1 0 0 0 0; ... #7
                       1 1 1 1 1 1 1; ... #8
                       1 1 1 1 0 1 1; ... #9
                      ];
subinputtable = sevenseginputtable([1,4,8,9],:);
suboutputtable = sevensegoutputtable([1,4,8,9],:);
%subinputtable = sevenseginputtable;
%suboutputtable = sevensegoutputtable;
# Full table 43/100 Quiessed
# 0/7 table 100/100
# 0/7/8 100/100
# 1,4,8,9 99/100
# 1,4,5,8,9 86/100
# 1,4,5,8,9,10 87/100
# 1,4,5,7,8,9,10 84/100
# 1,4,5,6,7,8,9,10 51/100
# 1,3,4,5,6,7,8,9,10 52/100
# All  45/100


failednetworks = 0;
convergednetworks = 0;
quiessednetworks = 0;

outnetwork = createbestnetwork (subinputtable, suboutputtable, 5, 100, 0.5);

%%%%%%%%  Pre train 2 layer
%subinputtable = sevenseginputtable([1,4,5,8,9,10],:);
%suboutputtable = sevensegoutputtable([1,4,5,8,9,10],:);


outnetwork = createbestnetwork (subinputtable, suboutputtable, 5, 100, 0.5, outnetwork);
visualizenetwork(outnetwork);
disp7all(subinputtable,outnetwork);