# Bigtable

## Usage
* Recommended for very high throughput and scalability for non-structured key/value data.
* Very easy to perform a query for the last n copies of a given row.
* Using a human-readable row key is recommended for traceability.
    * The key visualizer tool can help troubleshoot issues.

## Facts
* Sharded by row-range, which is defined through prefixes across the row key.
* Eventual consistency by default, when using multi-cluster routing.
    * Requests could be routed to the nearest cluster in an instance, where clusters in a single region are considered to be equidistant.
* Strong consistency, when using single-cluster routing.
    * Requests must only be routed to one cluster in your instance.
    * If that cluster becomes unavailable, you must manually fail over to another cluster.
* All rows are associated with a timestamp.
    * Mutations across rows are tracked according to a configurable garbage collection policy.
* Atomicity is guaranteed at the row-level, but not across rows.
* Has support for atomic execution of certain operations that might require transactions in other databases.
    * read-modify-write: increments and appends
    * check-and-mutate: conditional updates or writes
* Incurs no costs for undefined data within sparse tables.
* Backups are done through an import/export process referenced [here](https://cloud.google.com/bigtable/docs/import-export).
* Language support and client libraries:
    * C++, C#, Go, Happybase, Java, HBase, node.js, PHP, Python, Ruby
* SLA:
    * Replicated instance (2+ clusters) with multi-cluster routing policy: >= 99.99%
    * Replicated instance (2+ clusters) with single-cluster routing policy: >= 99.9%
    * Zonal instance (1 cluster): >= 99.9%

## Constraints
* Any given row should be no larger than 100 MB (recommended), with a hard limit of 256 MB.
    * The implication here is that column family qualifiers can be large but should not be unbounded.
* Any given row's column family should be no larger than 10 MB (recommended).
* An instance should contain no more than 1000 tables.

## Advantages
* Cluster resizing can be done without downtime.
* Requires very little operational maintenance.
    * Resharding is done dynamically.
* Supports garbage collection policies that can be defined per column family.
* Offers a choice between SSD and HDD storage.

## Disadvantages
* Autoscaling can not be set as a policy and must be implemented at the application level through the RPC or REST API.

## Architectural Notes
* Asynchronously manages edits to the underlying tables through compaction mechanism.
* Makes heavy use of locality for fetching data within ranges of row keys.

## Further Investigation
* How do we migrate existing data into Bigtable?
* Can we efficiently control the sort order of our results?
* How is the performance consistency?

## Whitepapers
* [Cloud Bigtable: A Distributed Storage System for Structured Data](https://storage.googleapis.com/pub-tools-public-publication-data/pdf/68a74a85e1662fe02ff3967497f31fda7f32225c.pdf)

## Other Articles
* [BigTable: storing Protobuf bytes in one column vs splitting the content into column families/qualifiers](https://tech.travelaudience.com/bigtable-storing-protobuf-bytes-in-one-column-vs-splitting-the-content-into-column-families-c231bdff8db7)
* [Financial services firm processes 25 billion stock market events per hour with Google Cloud Bigtable](https://cloud.google.com/blog/products/gcp/financial-services-firm-processes-25-billion-stock-market-events-per-hour-with-google-cloud-bigtable)

