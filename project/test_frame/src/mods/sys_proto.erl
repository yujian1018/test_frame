%%%-------------------------------------------------------------------
%%% @author yujian
%%% @doc
%%%
%%% Created : 21. 二月 2017 下午4:26
%%%-------------------------------------------------------------------
-module(sys_proto).

-include("t_pub.hrl").

-export([handle_info/3]).


handle_info(State, Proto, _Data) ->
    ?PRINT("no proto:~p~n", [[Proto, _Data]]),
    State.