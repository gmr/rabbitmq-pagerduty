%%==============================================================================
%% @author Gavin M. Roy <gavinr@aweber.com>
%% @copyright 2016 AWeber Communications
%% @end
%%==============================================================================
-module(pagerduty_extension).

-behaviour(rabbit_mgmt_extension).

-export([dispatcher/0, web_ui/0]).

dispatcher() ->
  [{"/pagerduty", pagerduty_mgmt, []}].

web_ui()     ->
  [{javascript, <<"pagerduty.js">>}].
