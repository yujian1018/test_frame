%%%-------------------------------------------------------------------
%%% @author yujian
%%% @doc
%%%
%%% Created : 27. 十二月 2017 下午5:10
%%%-------------------------------------------------------------------
-module(proto_dispatch).

-include("t_pub.hrl").
-export([
    init/0, init/2,
    recv_dispatch/3
]).

init() ->
    login_handler:login().

init(AccName, Pwd) ->
    login_handler:login(AccName, Pwd).


recv_dispatch(ModId, ProtoId, Data) ->
    case Data of
        [<<"err_code">> | Err] ->
            ?WARN("错误码:~p~n", [Err]),
            error;
        Data ->
            case proto_all:lookup_cmd(ModId) of
                {error, not_found} ->
                    ?WARN("proto_mod not_found:~p~n", [ModId]),
                    error;
                {Mod, _ProtoMod} ->
                    Mod:handle_info(ProtoId, Data)
            end
    end.