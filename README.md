
# Hospital Management – Task 6 (Subqueries & Nested Queries)


## Overview
This task demonstrates the use of **subqueries** (nested queries) in different parts of SQL statements using the hospital database schema.
---
## Types of Subqueries
1. **Scalar Subquery** → Returns a single value
2. **Table Subquery (Derived Table)** → Returns a set of rows and columns, used like a table in FROM
3. **Correlated Subquery** → Uses values from the outer query inside the subquery
4. **Subquery with IN/NOT IN/EXISTS** → Filters based on results of another query
---
## How to Run
1. Ensure your hospital database schema from Task 1 is available.
2. Open MySQL Workbench or DB Fiddle.
3. Copy and execute the queries in `Hospita_task_6.sql`.
---
## Files
- `Hospita_task_6.sql` – Contains 7 subquery-based queries.
- `README.md` – Explains the concepts, usage, and examples.
---
## 📚 Key Concepts
- **Difference from JOINs** → JOINs combine data directly, subqueries run as a separate query inside another query.
- **Performance** → In large datasets, JOINs can be faster, but subqueries can improve readability.
- **Correlated vs Non-Correlated**:
  - **Correlated** → Runs for each row in the outer query
  - **Non-Correlated** → Runs once and reuses results
---
## Author
- **Name:** Laki Gupta
- **GitHub:** https://github.com/LAKI-GUPTA-888
"""
