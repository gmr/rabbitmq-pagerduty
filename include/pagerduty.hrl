%%==============================================================================
%% @author Gavin M. Roy <gavinr@aweber.com>
%% @copyright 2016 AWeber Communications
%% @end
%%==============================================================================

%% URILib Types
-type scheme() :: atom().
-type username() :: string().
-type password() :: string().
-type host() :: string().
-type tcp_port() :: integer().
-type path() :: string().
-type query_args() :: [tuple() | string()].
-type fragment() :: string().
-type userinfo() :: {undefined | username(),
                     undefined | password()}.
-type authority() :: {undefined | userinfo(),
                      host(),
                      undefined | tcp_port()}.
-record(uri, {scheme :: undefined | scheme(),
              authority :: authority(),
              path :: undefined | path(),
              query :: undefined | query_args(),
              fragment :: undefined | fragment()}).

-record(worker_state, {api_key, check_interval, cluster_checks, node_checks}).
-record(cluster_checks, {partition, node_count}).
-record(node_checks,
        {
          connection_count,
          channel_count,
          disk_high_watermark,
          erlang_processes,
          file_descriptors,
          memory_high_watermark,
          mgmt_stats_queue_depth,
          socket_descriptors
        }).
