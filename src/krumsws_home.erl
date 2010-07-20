%% @author Dan Cutting <daniel.cutting@bskyb.com>
%% @copyright 2010 Dan Cutting.
%% @doc Products handler for Krums web service.

-module(krumsws_home).
-export([init/1, content_types_provided/2, to_json/2]).

-include_lib("webmachine/include/webmachine.hrl").

init([]) -> {ok, undefined}.

content_types_provided(ReqData, State) ->
    {[{"application/json", to_json}], ReqData, State}.

to_json(ReqData, State) ->
	{ string:join( ["{\"products\": \"", krumsws_utility:url_prefix(), "/products\"}"], []), ReqData, State}.
