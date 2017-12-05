## Copyright (C) 2017 colin
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} visualizenetwork (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: colin <colin@colin-VirtualBox>
## Created: 2017-12-05

function [retval] = visualizenetwork (neuralnetwork)

nndepth = size(neuralnetwork,1);
biasmax = neuralnetwork(1,1).neurons.bias;
biasmin = neuralnetwork(1,1).neurons.bias;
weightmax = neuralnetwork(1,1).neurons.weights(1);
weightmin = neuralnetwork(1,1).neurons.weights(1);

for ilayer = 1:nndepth
  for ineuron = 1:size(neuralnetwork,2)
    if length(neuralnetwork(ilayer,ineuron).neurons) > 0
      if (biasmax < neuralnetwork(ilayer,ineuron).neurons.bias)
        biasmax = neuralnetwork(ilayer,ineuron).neurons.bias;
      end
      if (biasmin > neuralnetwork(ilayer,ineuron).neurons.bias)
        biasmin = neuralnetwork(ilayer,ineuron).neurons.bias;
      end
      if (weightmax < max(neuralnetwork(ilayer,ineuron).neurons.weights))
        weightmax = max(neuralnetwork(ilayer,ineuron).neurons.weights);
      end
      if (weightmin > min(neuralnetwork(ilayer,ineuron).neurons.weights))
        weightmin = min(neuralnetwork(ilayer,ineuron).neurons.weights);
      end
    end
  end
end

biasmax = 5;
biasmin = -5;
weightmax = 5;
weightmin = -5;

biasrange = biasmax - biasmin;
weightrange = weightmax - weightmin;

yposition = 0;
#figure;
hold off;
for ilayer = nndepth:-1:1
  nneurons = 0;
  nconnection = length(neuralnetwork(ilayer,1).neurons.weights);
  for ineuron = 1:size(neuralnetwork,2)
    if length(neuralnetwork(ilayer,ineuron).neurons) > 0
      nneurons = nneurons + 1;
    end
  end
  mycolormap = parula(100);
  xpositions = linspace(-1*(nneurons-1)/2,(nneurons-1)/2,nneurons);
  xabovepositions = linspace(-1*(nconnection-1)/2,(nconnection-1)/2,nconnection);
  for ineuron = 1:nneurons
    for iconnection = 1:nconnection
      myconnection = plot([xpositions(ineuron) xabovepositions(iconnection)],[yposition yposition+1]);
      mycolor = (neuralnetwork(ilayer,ineuron).neurons.weights(iconnection)-weightmin)/weightrange;
      mycolor = floor(mycolor * 99)+1;
      set(myconnection,'Color',mycolormap(mycolor,:));
      hold on;
    end
    mycolor = (neuralnetwork(ilayer,ineuron).neurons.bias-biasmin)/biasrange;
    mycolor = floor(mycolor * 99)+1;
    myneuron = plot(xpositions(ineuron),yposition,'MarkerSize',100);
    set(myneuron,'MarkerEdgeColor',mycolormap(mycolor,:));
  end
  yposition = yposition + 1;
end

ninput = length(neuralnetwork(1,1).neurons.weights);
for iinput = 1:ninput
  xpositions = linspace(-1*(ninput-1)/2,(ninput-1)/2,ninput);
  myneuron = plot(xpositions(iinput),yposition,'MarkerSize',100);
  set(myneuron,'MarkerEdgeColor','k');
end

retval = [biasmax, biasmin, weightmax, weightmin];

endfunction
