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
	{ok, Pid} = riakc_pb_socket:start_link(krumsws_utility:riak_host(), krumsws_utility:riak_port()),
	{ok, [Products]} = riakc_pb_socket:mapred_bucket(Pid, <<"products">>, [{map, {modfun, riak_kv_mapreduce, map_object_value}, none, true}]),
%	{ok, Products} = riakc_pb_socket:mapred(Pid, [{<<"products">>, <<"krumsws">>}], [{map, {modfun, riak_kv_mapreduce, map_object_value}, none, true}]),
%	{iolist_to_binary(mochijson2:encode([Products])), ReqData, State}.
%	[P1|_] = Products,
	{0, [D|_]} = Products,
	X = mochijson2:decode(D),
	Y = mochijson2:encode(X),
	io:format(standard_error, "~p", [[Y]]),
	{"stuff", ReqData, State}.
