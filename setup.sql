// Step1: Create Table //

-- Specify Role
USE ROLE SYSADMIN;

// Step2: Create Various Objects //

-- Create Database/Schema
CREATE DATABASE IF NOT EXISTS TKO_APJ_SEMANTIC_VIEW;
CREATE SCHEMA IF NOT EXISTS TKO_APJ_SEMANTIC_VIEW.TPCDS_SF10TCL;
-- Specify Schema
USE SCHEMA TKO_APJ_SEMANTIC_VIEW.TPCDS_SF10TCL;
-- Create Warehouse
CREATE OR REPLACE WAREHOUSE TKP_APJ_SEMANTIC_VIEW_WH;
-- Specify Warehouse
USE WAREHOUSE TKP_APJ_SEMANTIC_VIEW_WH;
-- Create Stage for YAML Files
CREATE OR REPLACE STAGE TKO_APJ_SEMANTIC_VIEW.TPCDS_SF10TCL.YAML encryption = (type = 'snowflake_sse') DIRECTORY = (ENABLE = TRUE);


// Step3: Retrieve Data and Scripts from Public Git //
-- Create API Integration for Git Connection
CREATE OR REPLACE API INTEGRATION tko_apj_git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/sfc-gh-rsaxena/')
  ENABLED = TRUE;

-- Create GIT Integration
CREATE OR REPLACE GIT REPOSITORY TKO_APJ_GIT_INTEGRATION_FOR_HANDSON
  API_INTEGRATION = tko_apj_git_api_integration
  ORIGIN = 'https://github.com/sfc-gh-rsaxena/tko2025-semanticviews.git';

-- Check
ls @TKO_APJ_GIT_INTEGRATION_FOR_HANDSON/branches/main;

-- Retrieve Files from Github
COPY FILES INTO @TKO_APJ_SEMANTIC_VIEW.TPCDS_SF10TCL.YAML FROM @TKO_APJ_GIT_INTEGRATION_FOR_HANDSON/branches/main/yaml/ PATTERN ='.*\\.yaml$';

-- Create Notebook
CREATE OR REPLACE NOTEBOOK cortex_handson_part1
    FROM @TKO_APJ_GIT_INTEGRATION_FOR_HANDSON/branches/main/
    MAIN_FILE = 'semantic_view_notebook.ipynb'
    QUERY_WAREHOUSE = TKP_APJ_SEMANTIC_VIEW_WH
    WAREHOUSE = TKP_APJ_SEMANTIC_VIEW_WH;