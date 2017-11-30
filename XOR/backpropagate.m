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
## @deftypefn {Function File} {@var{retval} =} backpropagate (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: colin <colin@colin-VirtualBox>
## Created: 2017-11-28

function [newnetwork] = backpropagate (neuralnetwork, nnout, target, learningrate)

newnetwork = neuralnetwork;

deltas = zeros(size(newnetwork));

# Calculate Deltas for each node
for ilayer = size(newnetwork,1):-1:1
  if ilayer == size(newnetwork,1)
    for ineuron = 1:size(nnout,2)
      deltas(ilayer,ineuron) = (nnout(ilayer+1, ineuron) - target(ineuron)) * nnout(ilayer+1, ineuron) * (1 - nnout(ilayer+1, ineuron));
    end
  else
    for ineuron = 1:size(nnout,2)
      for jneuron = 1:size(nnout,2)
        if length(neuralnetwork(ilayer+1,jneuron).neurons) > 0
          deltas(ilayer,ineuron) = deltas(ilayer,ineuron) + deltas(ilayer+1,jneuron) * neuralnetwork(ilayer+1,jneuron).neurons.weights(ineuron);
        end
      end
      deltas(ilayer,ineuron) = deltas(ilayer,ineuron) * nnout(ilayer+1,ineuron) * (1 - nnout(ilayer+1, ineuron));      
    end
  end
end

# Adjust weights and biases
for ilayer = 1:size(newnetwork,1)
  for ineuron = 1:size(nnout,2)
    if length(neuralnetwork(ilayer,ineuron).neurons) > 0
      for iweight = 1:length(newnetwork(ilayer,ineuron).neurons.weights)
        newnetwork(ilayer,ineuron).neurons.weights(iweight) = newnetwork(ilayer,ineuron).neurons.weights(iweight) - learningrate * deltas(ilayer,ineuron) * nnout(ilayer,iweight);
      end
      newnetwork(ilayer,ineuron).neurons.bias = newnetwork(ilayer,ineuron).neurons.bias - learningrate * deltas(ilayer,ineuron);
    end
  end
end

endfunction
