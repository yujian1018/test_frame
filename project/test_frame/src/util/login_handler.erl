%%%-------------------------------------------------------------------
%%% @author yj
%%% @doc
%%%
%%% Created : 02. 八月 2016 上午10:48
%%%-------------------------------------------------------------------
-module(login_handler).

-include("t_pub.hrl").

-export([
    login/0,
    login/2
]).


login() ->
    Time = integer_to_binary(erl_time:now()),
    Sign = list_to_binary(erl_hash:md5(<<"date=", Time/binary, "&key=2b9eb9e4f0211582e4cf056af5f60289">>)),
    
    Url = binary_to_list(<<?HTTP_ADDR/binary, "/login/guest/?date=", Time/binary, "&sign=", Sign/binary,
        "&channel_id=-2&udid=win32&device_pf=test_frame">>),
    ?INFO("reg url:~p~n", [Url]),
    {ok, Response} = erl_httpc:get(Url, []),
    Data = ?decode(Response),
    case proplists:get_value(<<"code">>, Data) of
        200 ->
            Uid = proplists:get_value(<<"uid">>, Data),
            Token = proplists:get_value(<<"token">>, Data),
            {Uid, Token};
        _ ->
            io:format("login error:~p~n", [[Data]])
    end.


login(AccName, Pwd) ->
    NewAccName =
        if
            AccName =:= <<>> -> erl_string:uuid_bin();
            true -> AccName
        end,
    
    Time = integer_to_binary(erl_time:now()),
    Sign = list_to_binary(erl_hash:md5(<<"date=", Time/binary, "&key=2b9eb9e4f0211582e4cf056af5f60289">>)),
    
    Url = binary_to_list(<<?HTTP_ADDR/binary, "/login/account/?date=", Time/binary, "&sign=", Sign/binary,
        "&account_name=", NewAccName/binary, "&account_pwd=", Pwd/binary, "&channel_id=-2&udid=win32&device_pf=test_frame">>),
    ?INFO("reg url:~p~n", [Url]),
    {ok, Response} = erl_httpc:get(Url, []),
    Data = ?decode(Response),
    case proplists:get_value(<<"code">>, Data) of
        200 ->
            Uid = proplists:get_value(<<"uid">>, Data),
            Token = proplists:get_value(<<"token">>, Data),
            {Uid, Token};
        _ ->
            io:format("login error:~p~n", [[Data]])
    end.
