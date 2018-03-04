## Copyright (C) 2018 colin
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
## @deftypefn {Function File} {@var{retval} =} disp7 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: colin <colin@colin-VirtualBox>
## Created: 2018-02-20

function [myplot] = disp7 (inputarray)

linethickness = 8;
figure;
hold on;

if inputarray(1) ~= 0
  aseg = plot([-1 1],[2 2]);
  set(aseg,'LineWidth',linethickness);
end

if inputarray(2) ~= 0
  bseg = plot([1 1],[2 0]);
  set(bseg,'LineWidth',linethickness);
end

if inputarray(3) ~= 0
  cseg = plot([1 1],[0 -2]);
  set(cseg,'LineWidth',linethickness);
end

if inputarray(4) ~= 0
  dseg = plot([-1 1],[-2 -2]);
  set(dseg,'LineWidth',linethickness);
end

if inputarray(5) ~= 0
  eseg = plot([-1 -1],[0 -2]);
  set(eseg,'LineWidth',linethickness);
end

if inputarray(6) ~= 0
  fseg = plot([-1 -1],[2 0]);
  set(fseg,'LineWidth',linethickness);
end

if inputarray(7) ~= 0
  gseg = plot([-1 1],[0 0]);
  set(gseg,'LineWidth',linethickness);
end

axis([-3 3 -3 3]);

endfunction
