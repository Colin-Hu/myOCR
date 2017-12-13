# XOR truth table
xorinputtable = [0 0; 0 1; 1 0; 1 1];
xoroutputtable = [0; 1; 1; 0];

xoroutputtable

totseed = 100;
failednetworks = 0;
convergednetworks = 0;
for iseed = 1:totseed
  nnlayout = [2 2 2 1];
  clear xornetwork;
  xornetwork = createnn(nnlayout);
  learningxor = xornetwork;
  previouserror = 1;
  outputlayer = length(nnlayout);
  for i = 1:10
    learningxor = trainnetwork(learningxor,xorinputtable,xoroutputtable,500,0.5);
%    visualizenetwork(learningxor);
    nnout = vertcat(applynetwork([0,0],learningxor)(outputlayer,:),applynetwork([0,1],learningxor)(outputlayer,:),applynetwork([1,0],learningxor)(outputlayer,:),applynetwork([1,1],learningxor)(outputlayer,:));
    nnerror = error_mse(xoroutputtable, nnout);
    totalerror = nnerror(length(nnerror));
    if (totalerror > previouserror)
%      visualizenetwork(learningxor);
      printf("%d of %d: Stuck in local minima, resetting seeds\n",iseed,totseed);
      fflush(stdout);
      failednetworks++;
      break;
    end
    previouserror = totalerror;
  end
  if (i == 10)
%    visualizenetwork(learningxor);
    convergednetworks++;
    printf("%d of %d: Proper network found\n",iseed,totseed);
    fflush(stdout);
  end
%  w = waitforbuttonpress;
end
printf("\nFailed networks %d\nConverged networks %d\n",failednetworks,convergednetworks);