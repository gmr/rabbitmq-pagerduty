%%==============================================================================
%% @author Gavin M. Roy <gavinr@aweber.com>
%% @copyright 2016 AWeber Communications
%% @end
%% @doc Start the PagerDuty plugin. Since the management plugin is a dependency
%%      we don't need to inject a bootstep.
%% @end
%%==============================================================================
-module(pagerduty_app).

-behavior(application).

-export([start/2, stop/1]).

start(_Type, _StartArgs) ->
  pagerduty_sup_sup:start_link().

stop(_Args) ->
    ok.
