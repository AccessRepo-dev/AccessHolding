/*
{{ config(
    materialized='table',
    database='wagway_dev',
    schema='silver'
) }}
*/

select *
from {{ source('wagway_netsuite', 'ACCOUNT') }}