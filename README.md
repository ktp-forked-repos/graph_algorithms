# graph_algorithms
Various graph algorithms written in SWI Prolog.

mst.pl finds the minimum spanning tree of a graph using DFS. The graph is unweighted, and the graph must be connected. 

The graph needs to provided in the form of an adjacency list. The name of the graph should be used as the predicate whose arguments give the adjacency lists. For example:

graph_name(a,[b,c,d]).
graph_name(b,[a,c,d]).
graph_name(c,[a,b,d]).
graph_name(d,[a,b,c]).


The call will be mst(graph_name,X). where the MST is returned in the variable X. The format of X is a nested list of lists. The first element in every list is a parent vertex, and the other list elements are the subtrees of that parent vertex. The above graph would yield:

X = [a, [b, [d]], [c]].


The program uses two different accumulators: one to accumulate the mst as it is built, and the other to accumulate a list of previously visited nodes.

