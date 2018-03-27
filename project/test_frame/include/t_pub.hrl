%%%-------------------------------------------------------------------
%%% @author yujian
%%% @doc
%%%
%%% Created : 17. 一月 2017 下午6:10
%%%-------------------------------------------------------------------

-include_lib("network/include/network_pub.hrl").
-include("../src/auto/proto/proto_all.hrl").      %协议宏


-define(HTTP_ADDR, <<"http://192.168.2.19:8085">>).
-define(GAME_ADDR, <<"ws://127.0.0.1:26202/">>).

%%-define(HTTP_ADDR, <<"http://115.159.70.142:8080">>).
%%-define(GAME_ADDR, <<"ws://115.159.70.142:8081/">>).

-define(login_state, login_state).  % 0:初始化 1:接收到随机数种子，可以正常通讯
-define(uin, uin).
-define(token, token).
-define(tick, tick).