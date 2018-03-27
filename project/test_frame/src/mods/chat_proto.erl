%%%-------------------------------------------------------------------
%%% @author yj
%%% @doc
%%%
%%% Created : 02. 八月 2016 上午10:48
%%%-------------------------------------------------------------------
-module(chat_proto).

-include("t_pub.hrl").

-export([handle_info/3]).

handle_info(State, Proto, _Data) ->
    ?PRINT("no proto:~p~n", [[Proto, _Data]]),
    State.
