%% A node is one piece of a graph and can have many other nodes.
-module(node).
-export([new/1, new/2, append_children/2]).

-record(node, {
    value = nil,
    children = []
}).

new(Value) ->
    new(Value, []).
new(Value, Children) when is_list(Children) ->
    #node{value = Value, children = Children}.

append_children(Node, Child) when is_record(Child, node) ->
    append_children(Node, [Child]);
append_children(Node, [Child] = Children) ->
    case lists:member(Child, Node#node.children) of
        true ->
            Node;
        false ->
            Node#node{children = lists:append(Children, Node#node.children)}
    end;
append_children(Node, Children) when is_list(Children) ->
    Node#node{children = [child_appender(Node#node.children, C) || C <- Children ]}.

child_appender(Children, Child) when is_list(Children), is_record(Child, node) ->
    case lists:member(Child, Children) of
        true ->
            Children;
        false ->
            lists:append(Children, Child)
    end.
