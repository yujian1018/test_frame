%%%-------------------------------------------------------------------
%%% @author yujian
%%% @doc
%%%
%%% Created : 15. 十二月 2017 下午5:51
%%%-------------------------------------------------------------------
-module(player_mgr).

-behaviour(gen_server).

-include("t_pub.hrl").

-export([
    add/2,
    del/2,
    get/1,
    total_player/0
]).

-export([start_link/0, init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(ETS_MGR_PLAYER, ets_mgr_player).


start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).


%% 添加一个玩家
add(Pid, Uid) ->
    true = ets:insert(?ETS_MGR_PLAYER, {Pid, Uid}),
    true = ets:insert(?ETS_MGR_PLAYER, {Uid, Pid}).

%% 删除一个玩家
del(Pid, Uid) ->
    ets:delete(?ETS_MGR_PLAYER, Uid),
    ets:delete(?ETS_MGR_PLAYER, Pid).

get(Uid) ->
    case ets:lookup(?ETS_MGR_PLAYER, Uid) of
        [{Uid, Pid}] -> Pid;
        _ -> false
    end.

%% 获得当前玩家总数
total_player() ->
    case ets:info(?ETS_MGR_PLAYER, size) of
        0 -> 0;
        Size -> round((Size - 1) / 2)
    end.


init([]) ->
    ?ets_new(?ETS_MGR_PLAYER, 1),
    ?INFO("~p init done~n", [?MODULE]),
    {ok, {state}}.


handle_call(_Msg, _From, State) -> {reply, ok, State}.
handle_cast(_Msg, State) -> {noreply, State}.
handle_info(_Error, State) -> {noreply, State}.
terminate(_Reason, _State) -> ok.
code_change(_OldVsn, State, _Extra) -> {ok, State}.


