%% @author Dan Cutting <daniel.cutting@bskyb.com>
%% @copyright 2010 Dan Cutting.
%% @doc Products handler for Krums web service.

-module(krumsws_product).
-export([init/1, content_types_provided/2, to_json/2]).

-include_lib("webmachine/include/webmachine.hrl").

init([]) -> {ok, undefined}.

content_types_provided(ReqData, State) ->
    {[{"application/json", to_json}], ReqData, State}.

to_json(ReqData, State) ->
    {"{\"name\":\"Krums-iPhone\",\"productDescription\":\"An iPhone client for a crummy Scrum tool.\",\"defaultSprintWeeks\":2}", ReqData, State}.
