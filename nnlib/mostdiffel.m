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
## @deftypefn {} {@var{retval} =} mostdifel (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Colin <Colin@DESKTOP-U70NE73>
## Created: 2018-03-26

function [diffel] = mostdiffel (subtable, totaltable)

eldiffs = zeros(size(totaltable,1),1);
for iel = 1:size(eldiffs,1)
  for itab = 1:size(subtable)
    if (subtable(itab,:) == totaltable(iel,:))
      eldiffs(iel,1) = 0;
      break;
    else
      eldiffs(iel,1) = eldiffs(iel,1) + sum((totaltable(iel,:)-subtable(itab,:)).^2);
    end
  end
end

[maxval, maxloc] = max(eldiffs);
diffel = maxloc;
endfunction
