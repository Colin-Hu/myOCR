# 7seg truth table
# only input numbers
sevenseginputtable = [0 0 0 0; ...
                      0 0 0 1; ...
                      0 0 1 0; ...
                      0 0 1 1; ...
                      0 1 0 0; ...
                      0 1 0 1; ...
                      0 1 1 0; ...
                      0 1 0 1; ...
                      0 1 1 1; ...
                      1 1 1 1; ...
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


failednetworks = 0;
convergednetworks = 0;
for iseed = 1:1
  seeds = rand(3,7);
#  printf("\n\nTrying seeds %f %f %f\n",seed1,seed2,seed3);
  #fflush(stdout);
  clear sevensegnetwork;
  sevensegnetwork = struct('neurons',{3,7});
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
  previouserror = 1;
  for i = 1:1
    learningxor = trainnetwork(learningnetwork,sevenseginputtable,sevensegoutputtable,100,0.5);
    visualizenetwork(learningxor);
%    nnout = vertcat(applynetwork([0,0],learningxor)(3,:),applynetwork([0,1],learningxor)(3,:),applynetwork([1,0],learningxor)(3,:),applynetwork([1,1],learningxor)(3,:));
%    nnerror = error_mse(xoroutputtable, nnout);
%    totalerror = nnerror(length(nnerror));
%    if (totalerror > previouserror)
%%      visualizenetwork(learningxor);
%      printf("Stuck in local minima, resetting seeds\n");
%      fflush(stdout);
%      failednetworks++;
%      break;
%    end
%    previouserror = totalerror;
  end
%  if (i == 10)
%%    visualizenetwork(learningxor);
%    convergednetworks++;
%    printf("Proper network found\n");
%    fflush(stdout);
%  end
%%  w = waitforbuttonpress;
end
%printf("\nFailed networks %d\nConverged networks %d\n",failednetworks,convergednetworks);
disp7(round(applynetwork([0 1 0 1],learningnetwork)(4,:)));