## Copyright (C) 2018 Colin
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
## @deftypefn {} {@var{retval} =} nn2mat (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Colin <Colin@DESKTOP-U70NE73>
## Created: 2018-05-19

function [outmat] = nn2mat (network)

outmat = zeros(size(network,2),size(network,2)+1);

ilevel = size(network,1);
for ineuron = 1:size(network,2)
  for iinput = 1:size(network,2)
    outmat(ineuron, iinput) = network(ilevel, ineuron).neurons.weights(iinput);
  end
  outmat(ineuron, size(network,2)+1) = network(ilevel,ineuron).neurons.bias;
end

endfunction
