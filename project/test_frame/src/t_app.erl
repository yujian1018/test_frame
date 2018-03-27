-module(t_app).

-behaviour(application).

-export([start/2, stop/1, stop/0, start/0]).


start(_StartType, _StartArgs) ->
    crypto:start(),
    inets:start(),
    ssl:start(),
    t_sup:start_link().

stop(_State) ->
    ok.


start() ->
    application:start(test_frame).

stop() ->
    application:stop(test_frame).
