%% A node is one piece of a graph and can have many other nodes.
-module(node).
-export([init/1, init/2]).
% -compile(export_all).

-record(node, {
    value=nil,
    children=[]
}).

init(Value) ->
    init(Value, []).
init(Value, Children) ->
    #node{value = Value, children = Children}.
