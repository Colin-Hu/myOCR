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
%subinputtable = sevenseginputtable([1,8],:);
%suboutputtable = sevensegoutputtable([1,8],:);
subinputtable = sevenseginputtable;
suboutputtable = sevensegoutputtable;

failednetworks = 0;
convergednetworks = 0;
for iseed = 1:1
  seeds = rand(2,7);
  #printf("\n\nTrying seeds %f %f %f\n",seed1,seed2,seed3);
%  seeds
  fflush(stdout);
  clear sevensegnetwork;
  sevensegnetwork = struct('neurons',zeros(size(seeds,1),size(seeds,2)));
  for ilevel = 1:size(seeds,1)
    for ineuron = 1:size(seeds,2)
      if ilevel == 1
        sevensegnetwork(ilevel,ineuron).neurons = initializeneuron(4,seeds(ilevel,ineuron));
      else
        sevensegnetwork(ilevel,ineuron).neurons = initializeneuron(7,seeds(ilevel,ineuron));
      end
    end
  end
  learningnetwork = sevensegnetwork;
  previouserror = 100000;
  numloops = 100;
  for i = 1:numloops
    learningnetwork = trainnetwork(learningnetwork,subinputtable,suboutputtable,100,5);
%    visualizenetwork(learningnetwork);
%    nnout = vertcat(applynetwork(subinputtable(1,:),learningnetwork)(size(seeds,1)+1,:),applynetwork(subinputtable(2,:),learningnetwork)(size(seeds,1)+1,:));
    nnout = getnnout(subinputtable, learningnetwork, suboutputtable);
    nnerror = error_mse(suboutputtable, nnout);
    totalerror = nnerror;
%    suboutputtable
%    nnout
%    totalerror
    fflush(stdout);
    if (totalerror > previouserror)
      printf("Stuck in local minima, resetting seeds %f\n",totalerror);
      fflush(stdout);
      failednetworks++;
      break;
    end
    if (totalerror < 0.01)
      printf("Achieved quiescence %f\n",totalerror);
      break;
    end
    previouserror = totalerror;
%    disp7(round(applynetwork([0 1 1 0],learningnetwork)(2,:)));
%    disp7(round(applynetwork([0 1 1 1],learningnetwork)(2,:)));
%    pause();
  end
  if (i == numloops || totalerror < 0.01)
    visualizenetwork(learningnetwork);
%    convergednetworks++;
    printf("Proper network found\n");
    fflush(stdout);
%    disp7(round(applynetwork([0 0 0 0],learningnetwork)(2,:)));
%    disp7(round(applynetwork([0 1 1 1],learningnetwork)(2,:)));
    disp7all(subinputtable,learningnetwork);
%    pause();
  end
%  w = waitforbuttonpress;
end
%printf("\nFailed networks %d\nConverged networks %d\n",failednetworks,convergednetworks);
%disp7(round(applynetwork([0 1 0 1],learningnetwork)(4,:)));