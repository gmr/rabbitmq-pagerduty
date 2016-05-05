%%==============================================================================
%% @author Gavin M. Roy <gavinr@aweber.com>
%% @copyright 2016 AWeber Communications
%% @end
%% @doc Parent mirrored supervisor which allows for only a single instance of
%%      the plugin to be running in a RabbitMQ cluster. This follows the pattern
%%      outlined in the RabbitMQ management plugin.
%% @end
%%==============================================================================
-module(pagerduty_sup_sup).

-behavior(supervisor2).

-export([init/1,
         start_child/0,
         start_link/0]).

-include_lib("rabbit_common/include/rabbit.hrl").

init([]) ->
  timer:apply_after(0, ?MODULE, start_child, []),
  {ok, {{one_for_one, 0, 1}, []}}.

start_child() ->
  supervisor2:start_child(?MODULE,
                          {
                            pagerduty_sup, {pagerduty_sup, start_link, []},
                            temporary, ?MAX_WAIT, supervisor, [pagerduty_sup]
                          }).

start_link() ->
  supervisor2:start_link({local, ?MODULE}, ?MODULE, []).
