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
## @deftypefn {Function File} {@var{retval} =} applylayer (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: colin <colin@colin-VirtualBox>
## Created: 2017-11-28

function [outarray] = applylayer (inputarray, layerneurons)

maxneurons = length(layerneurons);
numneurons = 0;

for ineuron = 1:maxneurons
  if (length(layerneurons(ineuron).neurons) > 0)
    numneurons = numneurons + 1;
end

outarray = zeros(1,numneurons);

for ineuron = 1:numneurons
  outarray(ineuron) = applyneuron(inputarray, layerneurons(ineuron).neurons);
end

endfunction
