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
## @deftypefn {Function File} {@var{retval} =} downscale (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: colin <colin@colin-VirtualBox>
## Created: 2017-11-22

function [downimg] = downscale (origimg, downsize)

switch nargin
  case 1
    downsize = 32;
end

downimg = zeros(downsize,downsize);

rowratio = size(origimg,1)/downsize;
colratio = size(origimg,2)/downsize;

for row = 1:downsize
  for col = 1:downsize
    printf("Test %d %d %d %d\n", round((row-1)*rowratio+1), round(row*rowratio),round((col-1)*colratio+1), round(col*colratio));
    val = sum(sum(origimg(round((row-1)*rowratio+1):round(row*rowratio),round((col-1)*colratio+1):round(col*colratio))));
    downimg(row,col) = val/(size(round((row-1)*rowratio+1):round(row*rowratio),2)*size(round((col-1)*colratio+1):round(col*colratio),2));
  end
end

endfunction
