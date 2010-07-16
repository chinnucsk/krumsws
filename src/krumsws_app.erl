%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc Callbacks for the krumsws application.

-module(krumsws_app).
-author('author <author@example.com>').

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for krumsws.
start(_Type, _StartArgs) ->
    krumsws_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for krumsws.
stop(_State) ->
    ok.
