# XOR truth table
xorinputtable = [0 0; 0 1; 1 0; 1 1];
xoroutputtable = [0 0; 1 0; 1 0; 0 0];

# Constant seeds for initialization
seed1 = 2;
seed2 = 3;
seed3 = 4;

seed1 = 20;
seed2 = 31;
seed3 = 7;

xornetwork = struct('neurons',{2,2});
xornetwork(1,1).neurons = initializeneuron(2,seed1);
xornetwork(1,2).neurons = initializeneuron(2,seed2);
xornetwork(2,1).neurons = initializeneuron(2,seed3);

# Evaluate network
%xorout = applynetwork([0,0],xornetwork);
%
%xornetwork2 = backpropagate(xornetwork,xorout,[0,0],0.5);

%for itrial = 1:10000
%  for itruth = 1:4
%    xorout = applynetwork(xorinputtable(itruth,:),learningxor);
%    learningxor = backpropagate(learningxor,xorout,xoroutputtable(itruth,:),0.5);
%  end
%end

learningxor = xornetwork;
xoroutputtable
figure;
visualizenetwork(learningxor);
% Convergence on local minima can be found in about 2000 generations tops
% Oscillations seem to indicate local minima, while global solution continues
% to converge, use this metric as a restart criteria?
% How does pretraining work?
for i = 1:10
  learningxor = trainnetwork(learningxor,xorinputtable,xoroutputtable,500,0.5);
  visualizenetwork(learningxor);
  vertcat(applynetwork([0,0],learningxor)(3,:),applynetwork([0,1],learningxor)(3,:),applynetwork([1,0],learningxor)(3,:),applynetwork([1,1],learningxor)(3,:))
  w = waitforbuttonpress;
end