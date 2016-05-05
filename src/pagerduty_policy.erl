%%==============================================================================
%% @author Gavin M. Roy <gavinr@aweber.com>
%% @copyright 2016 AWeber Communications
%% @end
%%==============================================================================
-module(pagerduty_policy).

-behaviour(rabbit_policy_validator).

-export([register_keys/0,
         deregister_keys/0,
         validate_policy/1]).


-define(POLICY_KEYS,
        [
          <<"pd-service-key">>,
          <<"pd-consumer-threshold">>,
          <<"pd-message-threshold">>,
          <<"pd-size-threshold">>,
          <<"pd-rate-threshold">>,
          <<"pd-doc-link">>,
          <<"pd-graph-link">>
        ]).


-rabbit_boot_step({?MODULE,
                   [{description, "PagerDuty Policy Validation"},
                    {mfa, {?MODULE, register_keys, []}},
                    {requires, rabbit_registry},
                    {cleanup, {?MODULE, deregister_keys, []}}]}).

-ifdef(use_specs).

-spec(register_keys/0 :: () -> ok).
-spec(register_keys/1 :: ([binary()]) -> ok).
-spec(deregister_keys/0 :: () -> ok).
-spec(deregister_keys/1 :: ([binary()]) -> ok).
-spec(validate_policy/1 :: ([property()])
      -> ok | {error, Message :: string(), Args :: list()}).

-endif.

%% @doc Register each policy key with RabbitMQ
%% @end
register_keys() ->
  register_keys(?POLICY_KEYS).

register_keys([]) -> ok;
register_keys([Key|Tail]) ->
  rabbit_registry:register(policy_validator, Key, ?MODULE),
  register_keys(Tail).

%% @doc When shutting down, deregister the keys with RabbitMQ
%% @end
deregister_keys() ->
  deregister_keys(?POLICY_KEYS).

deregister_keys([]) -> ok;
deregister_keys([Key|Tail]) ->
  rabbit_registry:unregister(policy_validator, Key),
  deregister_keys(Tail).

%% @doc Validate that the key/value
validate_policy(_KeyList) ->
  ok.
