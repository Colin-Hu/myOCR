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
## @deftypefn {Function File} {@var{retval} =} initializeneuron (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: colin <colin@colin-VirtualBox>
## Created: 2017-11-22

function [outneuron] = initializeneuron (numinputs, seed)

# Requires seeded random for testing and evaluation as well as local minimums
switch nargin
  case 1
    seed = rand();
end

rand("seed",seed);
# Weights and biases are uniformly generated between -5 and 5
bias = (0.5-rand())*10;

weights = zeros(1,numinputs);
for iinput = 1:numinputs
  weights(iinput) = (0.5-rand())*10;
end

# Assign values to neuron structure
outneuron.bias = bias;
outneuron.weights = weights;

endfunction
