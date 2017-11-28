seed1 = 2;
seed2 = 3;
seed3 = 4;


xornetwork = struct('neurons',{2,2});
xornetwork(1,1).neurons = initializeneuron(2,seed1);
xornetwork(1,2).neurons = initializeneuron(2,seed2);
xornetwork(2,1).neurons = initializeneuron(2,seed3);