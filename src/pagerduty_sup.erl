%%==============================================================================
%% @author Gavin M. Roy <gavinr@aweber.com>
%% @copyright 2016 AWeber Communications
%% @end
%%==============================================================================
-module(pagerduty_sup).

-behavior(mirrored_supervisor).

-export([init/1,
         start_link/0]).

-include_lib("rabbit_common/include/rabbit.hrl").

init([]) ->
  rabbit_log:info("pagerduty_sup init/1"),
  {
    ok,
    {
      {one_for_one, 10, 10},
      [{
        pagerduty_worker,
        {pagerduty_worker, start_link, []},
        permanent, ?MAX_WAIT, worker, [pagerduty_worker]
      }]
    }
  }.

start_link() ->
  rabbit_log:info("pagerduty_sup start_link/0", []),
  mirrored_supervisor:start_link({local, ?MODULE}, ?MODULE,
                                 fun rabbit_misc:execute_mnesia_transaction/1,
                                 ?MODULE, []).
