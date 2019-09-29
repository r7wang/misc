# Spanner

## Facts & Analysis
* Widely used by Google for many aspects of their business as referenced [here](https://www.nextplatform.com/2019/01/15/spanning-the-database-world-with-google/).
    * Recommended for OLTP applications requiring a strong schema system, cross-row transactions, consistent replication, and a powerful query language.
    * Used as a source of truth for a variety of mission-critical Google databases.
    * Google Play is a large customer, using it to manage customer purchases and accounts, serving 10mil+ QPS, 100+ PB of data.
* Claims to be differentiated through implementation of the following techniques:
    * Distributed query execution, including compilation and execution of joins, consuming query results from parallel workers.
    * Range extraction, deciding which servers should process a query, and how to minimize the row ranges scanned and locked by each server.
    * Handling server-side failures with query restarts, hiding transient failures during execution to simplify applications.
    * SQL dialect used across multiple query systems at Google including F1 and BigQuery.
    * Replacing Bigtable SSTable stack with a blockwise-columnar store (Ressi) better optimized for hybrid OLTP/OLAP workloads, since 1H 2017.
* Strong consistency often touted as a key defining feature.
* Sharded by row-range, bounded by key prefixes.
    * Resharding is done dynamically.
* Secondary indices implemented like tables.
    * What's the implication here?
* Schema allows specifying parent-child relationships between tables.
    * Child table is co-located with the parent table.
* No need for retry loops.
* Support for efficient streaming pagination through query results.
* SQL dialect makes Protocol Buffer message and enum types first class types, implying that it should be painless to store and interact with these types of messages.
* Time-versioned database.
* Values are divided into active and inactive files.
* Large (multi-page) values are segregated into separate files, allowing for rapid scans of tables without paying I/O cost of reading large values until they are needed.
* Supports NoSQL methods for lookups and range scans of individual tables.
* Has client libraries in the following languages:
    * C#, Go, Java, node.js, PHP, Python, and Ruby
* Some performance benchmarking can be found [here](https://www.lightspeedhq.com/blog/google-cloud-spanner-good-bad-ugly/).
    * Author makes the conclusion that Spanner does not perform well for OLAP use cases; this is something we may have to spend more time prototyping.
* Support for backups did not exist, but this can now be done through an import/export process referenced [here](https://cloud.google.com/blog/products/gcp/cloud-spanner-adds-import-export-functionality-to-ease-data-movement).
    * Without backups, certain types of application defects and human error can be extremely expensive.
* Requires 1 node for every 2 TB of data in the database.
    * Must be manually provisioned.
* SLA:
    * Multi-regional instance: >= 99.999%
    * Regional instance: >= 99.99%

## Disadvantages
* Other platforms have no comparable alternatives; this ties implementation to GCP.
* Does not yet have the maturity of significant ORM tooling that exists for traditional RDBMS like MySQL.
* Development requires spinning up a full instance, which can be expensive.

## Further Investigation
* How do we migrate existing data into Cloud Spanner?
* What is the process of schema migration?
* Get a better understanding of Paxos consensus algorithm.
* How is the performance consistency?
* When to use single-consumer vs. parallel-consumer API?
* Can we query older versions of values?

## Whitepapers
* [Spanner: Becoming a SQL System](https://storage.googleapis.com/pub-tools-public-publication-data/pdf/acac3b090a577348a7106d09c051c493298ccb1d.pdf)
* [Spanner, TrueTime & The CAP Theorem](https://storage.googleapis.com/pub-tools-public-publication-data/pdf/45855.pdf)
* [Spanner: Google's Globally Distributed Database](https://storage.googleapis.com/pub-tools-public-publication-data/pdf/65b514eda12d025585183a641b5a9e096a3c4be5.pdf)

## Other Articles
* [Life of Cloud Spanner Reads & Writes](https://cloud.google.com/spanner/docs/whitepapers/life-of-reads-and-writes)
* [Life of a Cloud Spanner Query](https://cloud.google.com/spanner/docs/whitepapers/life-of-query)
* [How Google Cloud Storage offers strongly consistent object listing thanks to Spanner](https://cloud.google.com/blog/products/gcp/how-google-cloud-storage-offers-strongly-consistent-object-listing-thanks-to-spanner)
* [Best Practices on Migrating to Cloud Spanner (Cloud Next '19)](https://www.youtube.com/watch?v=FNeGQUqMa_c&autoplay=1)
* [Spanner Internals Part 1: What Makes Spanner Tick?](https://www.youtube.com/watch?v=nvlt0dA7rsQ&autoplay=1)
* [Spanner Internals Part 2: Global Meta-Data and Scalable Data Backend](https://www.youtube.com/watch?v=zy-rcR4MoN4&autoplay=1)
* [Bringing Retail Trading to 34 Million Cryptocurrency Wallets](https://www.youtube.com/watch?v=MZWdlqagupI&autoplay=1)
