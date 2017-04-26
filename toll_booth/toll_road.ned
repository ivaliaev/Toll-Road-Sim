//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package toll_booth;

import org.omnetpp.queueing.Fork;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


network Toll_road
{
    parameters:
        int numBooths;

        @display("bgb=528,141");
    submodules:
        source: Source {
            @display("p=60,79");
        }
//        queue[numBooths]: Queue {
//            @display("p=334,79");
//        }
        queue[numBooths]: My_queue_type {
            @display("p=334,79");
        }

        sink: Sink {
            @display("p=457,79");
        }
        router: Router {
            @display("p=167,79");
        }
//        my_queue_type: My_queue_type {
//            @display("p=255.925,27.55");
//        }
    connections:
        source.out --> router.in++;
        for i=0..numBooths-1 {
            queue[i].out --> sink.in++;
            router.out++ --> queue[i].in++;
        }
}
