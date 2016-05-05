rabbitmq-pagerduty
==================
A RabbitMQ plugin that monitors RabbitMQ and triggers `PagerDuty <http://pagerduty.com>`_
alerts when policy-configured thresholds are exceeded.

The plugin requires the RabbitMQ Management plugin.

Plugin Configuration
--------------------

- api_key
- check_interval (default 60 seconds)
- cluster_checks
- node_checks
    - file_descriptors
    - socket_descriptors
    - erlang_processes
    - connection_count
    - channel_count
    - memory_high_watermark
    - disk_high_watermark
    - management_stats_queue_depth

Queue Monitoring Configuration
------------------------------
The following parameters can be used in a policy to configure the monitoring and
alerting behavior for the queue or queues.

+---------------------------+----------------------------------------------------+
| Parameter                 | Description                                        |
+===========================+====================================================+
| ``pd-service-key``        | The service integration key to use                 |
+---------------------------+----------------------------------------------------+
| ``pd-consumer-threshold`` | Minimum number of consumers that trigger an alert  |
+---------------------------+----------------------------------------------------+
| ``pd-message-threshold``  | Maximum number of messages that trigger an alert   |
+---------------------------+----------------------------------------------------+
| ``pd-size-threshold``     | Size in bytes for a queue that triggers an alert   |
+---------------------------+----------------------------------------------------+
| ``pd-rate-threshold``     | Ingress - Egress rate for triggering an alert      |
+---------------------------+----------------------------------------------------+
| ``pd-doc-link``           | A documentation link that is included in the alert |
+---------------------------+----------------------------------------------------+
| ``pd-graph-link``         | A graph link that is included in the alert context |
+---------------------------+----------------------------------------------------+
| ``pd-unsynchronized-ha``  | When enabled, alert when a HA queue is not fully   |
|                           | synchronized.                                      |
+---------------------------+----------------------------------------------------+
