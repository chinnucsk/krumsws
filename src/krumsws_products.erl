%% @author Dan Cutting <daniel.cutting@bskyb.com>
%% @copyright 2010 Dan Cutting.
%% @doc Products handler for Krums web service.

-module(krumsws_products).
-export([init/1, content_types_provided/2, to_json/2]).

-include_lib("webmachine/include/webmachine.hrl").

init([]) -> {ok, undefined}.

content_types_provided(ReqData, State) ->
    {[{"application/json", to_json}], ReqData, State}.

to_json(ReqData, State) ->
    { io_lib:format("[
    {
        \"name\": \"Krums-iPhone\",
        \"product\": \"~s/products/krums-iphone\"
    },
    {
        \"name\": \"krumsws\",
        \"product\": \"~s/products/krumsws\"
    }
]", [krumsws_utility:url_prefix(), krumsws_utility:url_prefix()]), ReqData, State}.
