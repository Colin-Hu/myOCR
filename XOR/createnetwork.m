# XOR truth table
xorinputtable = [0 0; 0 1; 1 0; 1 1];
xoroutputtable = [0 0; 1 0; 1 0; 0 0];

# Constant seeds for initialization
%seed1 = 2;
%seed2 = 3;
%seed3 = 4;

%seed1 = 20;
%seed2 = 31;
%seed3 = 7;

xoroutputtable
%figure;
%visualizenetwork(learningxor);
% Convergence on local minima can be found in about 2000 generations tops
% Oscillations seem to indicate local minima, while global solution continues
% to converge, use this metric as a restart criteria?
% How does pretraining work?
failednetworks = 0;
convergednetworks = 0;
for iseed = 1:100
  seed1 = rand();
  seed2 = rand();
  seed3 = rand();
  printf("\n\nTrying seeds %f %f %f\n",seed1,seed2,seed3);
  fflush(stdout);
  clear xornetwork;
  xornetwork = struct('neurons',{2,2});
  xornetwork(1,1).neurons = initializeneuron(2,seed1);
  xornetwork(1,2).neurons = initializeneuron(2,seed2);
  xornetwork(2,1).neurons = initializeneuron(2,seed3);
  learningxor = xornetwork;
  previouserror = 1;
  for i = 1:10
    learningxor = trainnetwork(learningxor,xorinputtable,xoroutputtable,500,0.5);
%    visualizenetwork(learningxor);
    nnout = vertcat(applynetwork([0,0],learningxor)(3,:),applynetwork([0,1],learningxor)(3,:),applynetwork([1,0],learningxor)(3,:),applynetwork([1,1],learningxor)(3,:));
    nnerror = error_mse(xoroutputtable, nnout);
    totalerror = nnerror(length(nnerror));
    if (totalerror > previouserror)
%      visualizenetwork(learningxor);
      printf("Stuck in local minima, resetting seeds\n");
      fflush(stdout);
      failednetworks++;
      break;
    end
    previouserror = totalerror;
  end
  if (i == 10)
%    visualizenetwork(learningxor);
    convergednetworks++;
    printf("Proper network found\n");
    fflush(stdout);
  end
%  w = waitforbuttonpress;
end
printf("\nFailed networks %d\nConverged networks %d\n",failednetworks,convergednetworks);