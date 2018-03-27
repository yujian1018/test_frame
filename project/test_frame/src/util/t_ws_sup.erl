-module(t_ws_sup).

-behaviour(supervisor).

-export([start_link/0, init/1]).

-export([
    start_child/0,
    start_child/2
]).


-define(CHILD(I, Type, Arg), {I, {I, start_link, Arg}, temporary, 5000, Type, [I]}).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).


init([]) ->
    Child = [
        ?CHILD(t_ws, supervisor, [])
    ],
    {ok, {{simple_one_for_one, 0, 1}, Child}}.


start_child() -> supervisor:start_child(?MODULE, [[]]).

start_child(AccName, Pwd) -> supervisor:start_child(?MODULE, [[AccName, Pwd]]).
