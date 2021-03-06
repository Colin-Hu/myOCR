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
## @deftypefn {Function File} {@var{retval} =} applynetwork (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: colin <colin@colin-VirtualBox>
## Created: 2017-11-28

function [outputvalues] = applynetwork (inputvalues, neuralnetwork)

# Start with input layer
usevalues = inputvalues;

outputvalues = zeros(1,size(neuralnetwork,2));
outputvalues(1:length(inputvalues)) = inputvalues(:);

# Successively apply outputs of one layer as inputs of the next for each layer
for ilayer = 1:size(neuralnetwork,1);
  usevalues = applylayer(usevalues,neuralnetwork(ilayer,:));
  outputvalues = vertcat(outputvalues, usevalues);
end

endfunction
