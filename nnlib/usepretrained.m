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
## @deftypefn {} {@var{retval} =} usepretrained (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Colin <Colin@DESKTOP-U70NE73>
## Created: 2018-04-05

function [newnetwork] = usepretrained (oldnetwork)
  
  newdepth = size(oldnetwork,1) + 1;
  newwidth = size(oldnetwork,2);
  
  seeds = rand(newdepth, newwidth);
  newnetwork = struct('neurons',zeros(size(seeds,1),size(seeds,2)));
  
  for ilevel = 1:size(seeds,1)
    for ineuron = 1:size(seeds,2)
      if ilevel < newdepth
        newnetwork(ilevel,ineuron).neurons = oldnetwork(ilevel,ineuron).neurons;
      else
        newnetwork(ilevel,ineuron).neurons = initializeneuron(newwidth,seeds(ilevel,ineuron));
      end
    end
  end
endfunction