%%%-------------------------------------------------------------------
%%% @author yujian
%%% @doc
%%%
%%% Created : 15. 十二月 2017 下午5:51
%%%-------------------------------------------------------------------
-module(srv_sup).


-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).
-define(CHILD(I, Type, Arg), {I, {I, start_link, Arg}, permanent, 5000, Type, [I]}).


start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Child = [
    ],
    {ok, {{one_for_one, 5, 10}, Child}}.
