package toll_booth;

//
// TODO auto-generated module
//
import org.omnetpp.queueing.Queue;

simple My_queue_type extends Queue
{
    parameters:
        @statistic[jobsProcessed](title="jobs processed"; source=queueingTime; record=vector,count; interpolationmode=none);
        @statistic[queueLength](title="queue length";record=vector?,timeavg,mean,max;interpolationmode=sample-hold);
}
