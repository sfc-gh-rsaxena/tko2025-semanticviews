# tko2025-semanticviews

An end-to-end example for building and using a Snowflake Semantic View over TPC-DS sample data. The project demonstrates how to define the model in YAML and SQL, convert between formats, query via the Semantic View syntax, and integrate with Snowflake AI (Cortex Analyst and Cortex Search).

## Repository Structure

- `setup.sql`: One-time setup to create database/schema, stage, and download YAML to a stage.
- `TKO_APJ_SEMANTIC_VIEW_NOTEBOOK.ipynb`: Guided notebook to create and explore the Semantic View.
- `yaml/TPCDS_SEMANTIC_VIEW.yaml`: YAML model for the Semantic View.

## Prerequisites

- A Snowflake account and a running warehouse.
- Privileges to create databases, schemas, stages, and semantic views.
- Access to `SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL` (public share).

## Quick Start

1. **Run setup.sql**
   - Open Snowflake Snowsight SQL worksheet.
   - Copy-paste the contents of `setup.sql` and execute.

2. **Open the Notebook**
   - In Snowflake Notebooks, open `TKO_APJ_SEMANTIC_VIEW_NOTEBOOK.ipynb`.
   - Run cells from top to bottom. This will:
     - Create helper views over TPC-DS tables.
     - Validate and (optionally) create the Semantic View from YAML.
     - Demonstrate converting a Semantic View to/from YAML.
     - Run example Semantic View queries.
     - Optionally create a Cortex Agent and integrate Cortex Search.

## Usage Highlights

- Define and manage the semantic model in YAML or SQL.
- Convert between YAML and a Semantic View using built-in Snowflake functions.
- Query business-friendly dimensions and metrics via the `SEMANTIC_VIEW` clause.
- Improve natural language understanding by adding synonyms and Cortex Search to high-cardinality dimensions.

## Notes

- The notebook assumes schema `TKO_APJ_SEMANTIC_VIEW.TPCDS_SF10TCL` and creates `TPCDS_SEMANTIC_VIEW_SM`.
- Adjust warehouse and role according to your environment.

---

If you encounter issues, re-run `setup.sql` and verify the YAML stage contents, or inspect the semantic view with `DESC SEMANTIC VIEW <FQN>`.
