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

        @display("bgb=529.975,104.4");
    submodules:
        source: Source {
            @display("p=54.375,45.675");
        }

        queue[numBooths]: My_queue_type {
            @display("p=328.425,45.675");
        }

        sink: Sink {
            @display("p=451.675,45.675");
        }
        router: Router {
            @display("p=161.675,45.675");
        }
    
    connections:
        source.out --> router.in++;
        for i=0..numBooths-1 {
            queue[i].out --> sink.in++;
            router.out++ --> queue[i].in++;
        }
}
