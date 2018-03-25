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
## @deftypefn {Function File} {@var{retval} =} error_mse (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: colin <colin@colin-VirtualBox>
## Created: 2017-11-29

function [errors] = error_mse (target, output)

numivalues = size(target,1);
numjvalues = size(target,2);
myerrors = zeros(numivalues, numjvalues);

for icount = 1:size(target,1);
  for jcount = 1:size(target,2);
    myerrors(icount,jcount) = 0.5 * (target(icount,jcount) - output(icount,jcount))^2;
  end
end

errors = sum(sum(myerrors));

endfunction
