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
## @deftypefn {} {@var{retval} =} disp7all (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Colin <Colin@DESKTOP-U70NE73>
## Created: 2018-03-24

function [retval] = disp7all (inputtable, network)

for ival = 1:size(inputtable,1)
  disp7(round(applynetwork(inputtable(ival,:),network)(size(network,1)+1,:)));
end

endfunction
