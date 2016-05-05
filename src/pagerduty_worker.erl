%%==============================================================================
%% @author Gavin M. Roy <gavinr@aweber.com>
%% @copyright 2016 AWeber Communications
%% @end
%%==============================================================================
-module(pagerduty_worker).

-behaviour(gen_server2).

-export([start_link/0,
         init/1,
         code_change/3,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2]).

start_link() ->
  case gen_server2:start_link({global, ?MODULE}, ?MODULE, [], []) of
    {ok, Pid} -> register(?MODULE, Pid), {ok, Pid};
    Error     -> Error
  end.


init([]) ->
  {ok, {}}.

code_change(_, State, _) ->
  {ok, State}.

handle_call(_Msg, _From, State) ->
  {noreply, unknown_command, State}.

handle_cast(_Cast, State) ->
  {noreply, State}.

handle_info(_Message, State) ->
  {noreply, State}.

terminate(shutdown, _State) ->
  ok.
