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
## @deftypefn {Function File} {@var{retval} =} trainnetwork (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: colin <colin@colin-VirtualBox>
## Created: 2017-12-05

function [outnetwork] = trainnetwork (neuralnetwork, inputtable, outputtable, generations, learningrate)

outnetwork = neuralnetwork;

ninputs = size(inputtable,1);

for itrial = 1:generations
  for ivalue = 1:ninputs
    jvalue = floor(rand()*ninputs)+1;
    outvalues = applynetwork(inputtable(jvalue,:),outnetwork);
    outlayer = size(outvalues,1);
    % The way the backpropagation is currently coded with delta calculation
    % taking into account the product of the output, adjustments cannot be made 
    % on the actual output, elso no learning will take place
%    for iout = 1:length(outvalues(outlayer,:))
%      if (outvalues(outlayer,iout) < 0.1)
%        outvalues(outlayer,iout) = 0.0;
%      elseif (outvalues(outlayer,iout) > 0.9)
%        outvalues(outlayer,iout) = 1.0;
%      end
%    end
    outnetwork = backpropagate(outnetwork,outvalues,outputtable(jvalue,:),learningrate);
  end
end

endfunction
