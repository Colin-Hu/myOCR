# XOR truth table
xorinputtable = [0 0; 0 1; 1 0; 1 1];
xoroutputtable = [0 0; 1 0; 1 0; 0 0];

# Constant seeds for initialization
seed1 = 2;
seed2 = 3;
seed3 = 4;

xornetwork = struct('neurons',{2,2});
xornetwork(1,1).neurons = initializeneuron(2,seed1);
xornetwork(1,2).neurons = initializeneuron(2,seed2);
xornetwork(2,1).neurons = initializeneuron(2,seed3);

# Evaluate network
xorout = applynetwork([0,0],xornetwork);

xornetwork2 = backpropagate(xornetwork,xorout,[0,0],0.5);

learningxor = xornetwork;

for itrial = 1:10000
  for itruth = 1:4
    xorout = applynetwork(xorinputtable(itruth,:),learningxor);
    learningxor = backpropagate(learningxor,xorout,xoroutputtable(itruth,:),0.5);
  end
end