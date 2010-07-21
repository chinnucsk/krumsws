-module(krumsws_utility).

-export([url_prefix/0, riak_host/0, riak_port/0]).

url_prefix() ->
	"http://10.65.87.46:8000/krumsws".

riak_host() ->
	"127.0.0.1".
	
riak_port() ->
	8081.
