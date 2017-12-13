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
## @deftypefn {Function File} {@var{retval} =} createnn (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: colin <colin@colin-VirtualBox>
## Created: 2017-12-13

function [neuralnetwork] = createnn (nndims)

% First denotes number of inputs, then neurons at each layer
nlayers = length(nndims)-1;

seedsneeded = sum(nndims)-nndims(1);

seeds = zeros(1,seedsneeded);

for iseed = 1:seedsneeded
  seeds(iseed) = rand();
end

neuralnetwork = struct('neurons',{nlayers,max(nndims(2:length(nndims)))});
% Maybe return the seeds later

iseed = 1;
for ilayer = 2:length(nndims)
  for ineuron = 1:nndims(ilayer)
    neuralnetwork(ilayer-1,ineuron).neurons = initializeneuron(nndims(ilayer-1),seeds(iseed));
    iseed++;
  end
end

endfunction
