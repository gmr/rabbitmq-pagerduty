-module(pagerduty_all_tests).

-export([run/0]).

-include_lib("eunit/include/eunit.hrl").

run() ->
  Result = {eunit:test(pagerduty_urilib_tests, [verbose])},
  ?assertEqual({ok}, Result).
