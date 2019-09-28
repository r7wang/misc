# Bigtable

## Analysis
* Design of row key is very important.
    * Using a human-readable row key is recommended as they are easier to reason about and easier to trace.
    * The key visualizer tool can help troubleshoot issues.
* Makes heavy use of locality for fetching data within ranges of sorted string row keys.
* Tracks mutations across rows.
* All rows are associated with a timestamp.
* Requires application-level auto-scaling.
* Asynchronously manages edits to the underlying tables through compaction mechanism.
* Incurs less cost than traditional RDBMS for sparse tables.
* Atomicity is guaranteed at the row-level, but not across rows.
* Has support for atomic execution of certain operations that might require transactions in other databases.
    * read-modify-write: increments and appends
    * check-and-mutate: conditional updates or writes
* Eventual consistency by default, when using multi-cluster routing.
    * Requests could be routed to the nearest cluster in an instance, where clusters in a single region are considered to be equidistant.
* Strong consistency, when using single-cluster routing.
    * Requests must only be routed to one cluster in your instance.
    * If that cluster becomes unavailable, you must manually fail over to another cluster.
* Garbage collection policies can be defined per column family.

## Constraints
* Any given row should be no larger than 100 MB (recommended), with a hard limit of 256 MB.
    * The implication here is that column family qualifiers can be large but should not be unbounded.
* Any given row's column family should be no larger than 10 MB (recommended).
* An instance should contain no more than 1000 tables.

## Advantageous Queries
* What were the last ten values of a given column family qualifier for a localized set of row keys?

## Codelab Setup

gcloud beta dataflow jobs run import-bus-data-$(date +%s) --gcs-location gs://dataflow-templates/latest/GCS_SequenceFile_to_Cloud_Bigtable --num-workers=$NUM_WORKERS --max-workers=$NUM_WORKERS --parameters "bigtableProject=bigtable-test-254214,bigtableInstanceId=$INSTANCE_ID,bigtableTableId=$TABLE_ID,sourcePattern=gs://cloud-bigtable-public-datasets/bus-data/*" --region us-east1
