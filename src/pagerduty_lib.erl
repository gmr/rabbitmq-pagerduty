%%==============================================================================
%% @author Gavin M. Roy <gavinr@aweber.com>
%% @copyright 2016 AWeber Communications
%% @end
%%==============================================================================
-module(pagerduty_lib).

%% API
-export([settings/0]).

-include("pagerduty.hrl").

settings() ->
  ClusterChecks = #cluster_checks{
    partition = application:get_env(pagerduty, cluster_checks_partition, false),
    node_count = application:get_env(pagerduty, cluster_checks_node_count, undefined)},
  NodeChecks = #node_checks {
    connection_count = application:get_env(pagerduty, node_checks_connection_count, undefined),
    channel_count = application:get_env(pagerduty, node_checks_channel_count, undefined),
    disk_high_watermark = application:get_env(pagerduty, node_checks_disk_high_watermark, false),
    erlang_processes = application:get_env(pagerduty, node_checks_erlang_processes, undefined),
    file_descriptors = application:get_env(pagerduty, node_checks_file_descriptors, undefined),
    memory_high_watermark = application:get_env(pagerduty, node_checks_memory_high_watermark, false),
    mgmt_stats_queue_depth = application:get_env(pagerduty, node_checks_mgmt_stats_queue_depth, undefined),
    socket_descriptors = application:get_env(pagerduty, node_checks_socket_descriptors, undefined)
  },
  #worker_state{api_key = application:get_env(pagerduty, api_key, undefined),
                check_interval = application:get_env(pagerduty, check_interval, 60),
                cluster_checks = ClusterChecks,
                node_checks = NodeChecks}.
