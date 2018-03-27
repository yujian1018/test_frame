%%%-------------------------------------------------------------------
%%% @author yj
%%% @doc
%%%
%%% Created : 14. 七月 2016 下午2:31
%%%-------------------------------------------------------------------
-module(err_code_proto).

-include("t_pub.hrl").

-export([
    handle_info/3]).

handle_info(State, Proto, _Data) ->
    ?PRINT("no proto:~p~n", [[Proto, _Data]]),
    State.