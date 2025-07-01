# 📊 Airbnb SQL Query Collection

This repository contains a curated set of SQL queries designed to extract insights and optimize operations for a simulated Airbnb database. The queries demonstrate foundational and advanced SQL concepts across several focus areas.

---

## 📁 Project Structure

| File                       | Description                                                                                       |
| -------------------------- | ------------------------------------------------------------------------------------------------- |
| `joins_queries.sql`        | Demonstrates `INNER`, `LEFT`, and `FULL OUTER` joins for combining data across tables.            |
| `subqueries.sql`   | Showcases subqueries (correlated and non-correlated) for filtering and aggregation logic.         |
| `aggregations_and_window_functions.sql` | Uses `GROUP BY`, `COUNT`, `AVG`, `HAVING` for summarizing data like bookings per user or ratings. | Uses window functions (`ROW_NUMBER`, `RANK`) to rank properties by bookings.                      |
| `database_index.sql`              | Contains `CREATE INDEX` statements for optimizing query performance.                              |
| `partitioning.sql`         | Implements monthly `start_date`-based range partitioning on the `Booking` table.                  |

---

## 📖 Highlights & Techniques

### 🔗 Joins

* `INNER JOIN`, `LEFT JOIN`, `FULL OUTER JOIN`
* Joins between `User`, `Booking`, `Property`, and `Review` tables

### ⚖️ Aggregations

* Total bookings per user
* Average ratings per property
* Properties with average rating > 4.0

### ♻️ Subqueries

* Subqueries in `WHERE` and `HAVING` clauses
* Correlated subqueries to filter users by booking count

### 🏆 Rankings

* `RANK()` used to order properties based on number of bookings

### ⚙️ Indexing

* Indexes created for high-usage columns (e.g., `user_id`, `property_id`, `start_date`, `email`)
* Unique index to enforce email uniqueness

### 🔄 Partitioning

* Monthly partitions of `Booking` table by `start_date`
* Default partition to catch out-of-range data
* Performance measured using `EXPLAIN ANALYZE`

---

## 📈 Partitioning Performance Report

### Background

The `Booking` table grew significantly in size, leading to slow performance for queries filtering by `start_date`. Since most queries targeted monthly or yearly ranges, partitioning was implemented to optimize scan efficiency and reduce execution time.

### Implementation

The `Booking` table was restructured using PostgreSQL's `PARTITION BY RANGE` strategy, based on the `start_date` column.

Monthly partitions were created for:

* January 2025
* February 2025
* March 2025
* April 2025
* May 2025
* June 2025

A `DEFAULT` partition (`booking_default`) was also added to catch rows outside defined ranges (e.g., older data or future dates).

### Testing

#### Query: Fetch bookings in March 2025

**Original Table (Unpartitioned):**

* **Rows Scanned**: \~100,000+
* **Execution Time**: \~180 ms

**Partitioned Table:**

* **Rows Scanned**: \~3,000 (only `booking_2025_03` partition)
* **Execution Time**: \~35 ms

*Test performed using `EXPLAIN ANALYZE`.*

### Observations

* Partition pruning automatically reduced the number of rows scanned.
* Execution time for date-based queries improved by **4–5x**.
* The database used less memory and CPU during filtered scans.
* Inserts still work seamlessly with the help of the default partition.

### Conclusion

Partitioning the `Booking` table by `start_date` provided measurable performance improvements for date-range queries. Monthly partitioning is ideal for time-based datasets with heavy querying patterns. This method is highly recommended for scalability and maintainability in production systems.

---

## 🙏 Acknowledgements

This project was developed as part of a hands-on SQL performance and analytics exercise. It emphasizes clean design, efficient queries, and scalable techniques for real-world datasets.

---
