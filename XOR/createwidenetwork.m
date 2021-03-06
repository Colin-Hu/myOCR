# XOR truth table
xorinputtable = [0 0; 0 1; 1 0; 1 1];
xoroutputtable = [0 0 0; 1 0 0; 1 0 0; 0 0 0];

xoroutputtable

failednetworks = 0;
convergednetworks = 0;
for iseed = 1:100
  xornetwork = createnn([2 3 1]);
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