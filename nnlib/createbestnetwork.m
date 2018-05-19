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
## @deftypefn {} {@var{retval} =} createbestnetwork (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Colin <Colin@DESKTOP-U70NE73>
## Created: 2018-04-14

function [outnetwork] = createbestnetwork (inputtable, outputtable, numtries, numgen, learningrate, inputnetwork)

lasterror = 999999999;
bestnetwork = "null";

for iseed = 1:numtries
  printf("Finding network %d\n",iseed);
  if (nargin == 5) % Create new network
    seeds = rand(1,size(outputtable,2));
    clear testnetwork;
    testnetwork = struct('neurons',zeros(size(seeds,1),size(seeds,2)));
    for ilevel = 1:size(seeds,1)
      for ineuron = 1:size(seeds,2)
        testnetwork(ilevel,ineuron).neurons = initializeneuron(size(inputtable,2),seeds(ilevel,ineuron));
      end
    end
  elseif (nargin == 6) % Append to existing network
    testnetwork = usepretrained(inputnetwork);
  end
  previouserror = 99999;
  for itry = 1:20
      testnetwork = trainnetwork(testnetwork,inputtable,outputtable,numgen,learningrate);
      nnout = getnnout(inputtable, testnetwork, outputtable);
      nnerror = error_mse(outputtable, nnout);
      totalerror = nnerror;
      fflush(stdout);
      if (totalerror > previouserror)
        break;
      end
      if (previouserror-totalerror < 0.01)
        printf("Found good network %f\n",totalerror);
        if (previouserror < lasterror)
          printf("Found best network %f %f\n",lasterror,totalerror);
          bestnetwork = testnetwork;
          lasterror = previouserror;
        end
        break;
      end
      previouserror = totalerror;
    end
end

outnetwork = bestnetwork;

endfunction
