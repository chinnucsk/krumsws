%% @author Dan Cutting <daniel.cutting@bskyb.com>
%% @copyright 2010 Dan Cutting.
%% @doc Products handler for Krums web service.

-module(krumsws_product).
-export([init/1, content_types_provided/2, to_json/2]).

-include_lib("webmachine/include/webmachine.hrl").

init([]) -> {{trace, "/tmp"}, undefined}.

content_types_provided(ReqData, State) ->
    {[{"application/json", to_json}], ReqData, State}.

to_json(ReqData, State) ->
	ProductId = wrq:path_info(product, ReqData),
	{ok, Pid} = riakc_pb_socket:start_link(krumsws_utility:riak_host(), krumsws_utility:riak_port()),
	case riakc_pb_socket:get(Pid, <<"products">>, ProductId) of
		{ok, Obj} ->
			{riakc_obj:get_value(Obj), ReqData, State};
		{error, notfound} ->
			{{halt, 404}, ReqData, State}
	end.
