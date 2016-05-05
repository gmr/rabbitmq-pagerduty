%%==============================================================================
%% @author Gavin M. Roy <gavinr@aweber.com>
%% @copyright 2016 AWeber Communications
%% @end
%%==============================================================================
-module(pagerduty_mgmt).

-export([init/3,
         rest_init/2,
         resource_exists/2,
         content_types_provided/2,
         is_authorized/2,
         to_json/2]).

-include_lib("rabbitmq_management/include/rabbit_mgmt.hrl").

%%--------------------------------------------------------------------

init(_, _, _) ->
  {upgrade, protocol, cowboy_rest}.

rest_init(Req, _Opts) ->
  {ok, Req, #context{}}.

resource_exists(ReqData, Context) ->
  {true, ReqData, Context}.

content_types_provided(ReqData, Context) ->
  {[{<<"application/json">>, to_json}], ReqData, Context}.

is_authorized(ReqData, Context) ->
  rabbit_mgmt_util:is_authorized_monitor(ReqData, Context).

to_json(ReqData, Context) ->
  rabbit_mgmt_util:reply_list([], ReqData, Context).
