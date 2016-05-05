rabbitmq-pagerduty
==================

A RabbitMQ plugin that monitors RabbitMQ and triggers `PagerDuty <http://pagerduty.com>`_
alerts when policy-configured thresholds are exceeded.

The plugin requires the RabbitMQ Management plugin.

Plugin Configuration
--------------------

The following top-level configuration parameters are used to configure the plugin.

+--------------------+-------------+--------------------------------------------+
| Parameter          | Data Type   | Description                                |
+====================+=============+============================================+
| ``api_key``        | ``string``  | The PagerDuty API key to use.              |
+--------------------+-------------+--------------------------------------------+
| ``check_interval`` | ``integer`` | The interval to pause between checks in    |
|                    |             | seconds. Default: ``60``                   |
+--------------------+-------------+--------------------------------------------+
| ``cluster_checks`` | ``list``    | A list of cluster checks to perform in     |
|                    |             | key/value pairs. Default: ``undefined``    |
+--------------------+-------------+--------------------------------------------+
| ``node_checks``    | ``list``    | A list of cluster checks to perform in     |
|                    |             | key/value pairs. Default: ``undefined``    |
+--------------------+-------------+--------------------------------------------+

Cluster Checks
^^^^^^^^^^^^^^

The following configuration parameters can be used to monitor cluster state:

+----------------+-------------+---------------------------------------------+
| Parameter      | Data Type   | Description                                 |
+================+=============+=============================================+
| ``partition``  | ``bool``    | Alert when there is a cluster partition.    |
+----------------+-------------+---------------------------------------------+
| ``node_count`` | ``integer`` | Alert if the quantity of nodes in the       |
|                |             | cluster falls below the specified value.    |
+----------------+-------------+---------------------------------------------+

Node Checks
^^^^^^^^^^^

The following configuration parameters are used to specify node specific monitoring:

+----------------------------------+-------------+---------------------------------------------+
| Description                      | Data Type   | Description                                 |
+==================================+=============+=============================================+
| ``connection_count``             | ``integer`` | Alert when the quantity of connections      |
|                                  |             | exceeds the specified value.                |
+----------------------------------+-------------+---------------------------------------------+
| ``channel_count``                | ``integer`` | Alert when the quantity of channels exceeds |
|                                  |             | the specified values.                       |
+----------------------------------+-------------+---------------------------------------------+
| ``disk_high_watermark``          | ``bool``    | Alert when the disk utilization high        |
|                                  |             | watermark is triggered.                     |
+----------------------------------+-------------+---------------------------------------------+
| ``erlang_processes``             | ``integer`` | Alert when the quantity of erlang processes |
|                                  |             | exceed the specified value.                 |
+----------------------------------+-------------+---------------------------------------------+
| ``file_descriptors``             | ``integer`` | Alert when the quantity of open file        |
|                                  |             | descriptors exceed the specified value.     |
+----------------------------------+-------------+---------------------------------------------+
| ``memory_high_watermark``        | ``bool``    | Alert when the memory high watermark is     |
|                                  |             | triggered.                                  |
+----------------------------------+-------------+---------------------------------------------+
| ``management_stats_queue_depth`` | ``integer`` | Alert when the management stats collector   |
|                                  |             | queue depth exceeds the specified value.    |
+----------------------------------+-------------+---------------------------------------------+
| ``socket_descriptors``           | ``integer`` | Alert when the number of socket descriptors |
|                                  |             | exceed the specified value.                 |
+----------------------------------+-------------+---------------------------------------------+

Example Configuration
^^^^^^^^^^^^^^^^^^^^^

The following block illustrates how to specify the configuration values.

.. code:: javascript

    pagerduty.api_key = example
    pagerduty.check_interval = 30
    pagerduty.cluster_checks.partition = true
    pagerduty.node_checks.connection_count = 1000000
    pagerduty.node_checks.erlang_processes = 2000000

Queue Monitoring Configuration
------------------------------

The following parameters can be used in a policy to configure the monitoring and
alerting behavior for the queue or queues. When more than one threshold parameter
is specified, they act in combination with each other.

For example, if you specify the ``pd-consumer-threshold`` parameter with a value
of ``5`` and the ``pd-message-threshold`` parameter with a value of ``10000``, the
queue will only alert if the number of consumers drop below ``5`` and the quantity
of un-acknowledged messages exceeds ``10000``.

If no policy is defined setting a threshold, queues are not monitored.

+---------------------------+-------------+-----------------------------------------------------+
| Parameter                 | Data Type   | Description                                         |
+===========================+===================================================================+
| ``pd-service-key``        | ``string``  | The service integration key to use                  |
+---------------------------+-------------+-----------------------------------------------------+
| ``pd-consumer-threshold`` | ``integer`` | Minimum number of consumers that trigger an alert   |
+---------------------------+-------------+-----------------------------------------------------+
| ``pd-message-threshold``  | ``integer`` |  Maximum number of messages that trigger an alert   |
+---------------------------+-------------+-----------------------------------------------------+
| ``pd-size-threshold``     | ``integer`` |  Size in bytes for a queue that triggers an alert   |
+---------------------------+-------------+-----------------------------------------------------+
| ``pd-rate-threshold``     | ``float``   |  Ingress - Egress rate for triggering an alert      |
+---------------------------+-------------+-----------------------------------------------------+
| ``pd-doc-link``           | ``string``  | A documentation link that is included in the alert  |
+---------------------------+-------------+-----------------------------------------------------+
| ``pd-graph-link``         | ``string``  | A graph link that is included in the alert context  |
+---------------------------+-------------+-----------------------------------------------------+
| ``pd-unsynchronized-ha``  | ``bool``    |  When enabled, alert when a HA queue is not fully   |
|                           |             | synchronized.                                       |
+---------------------------+-------------+-----------------------------------------------------+
