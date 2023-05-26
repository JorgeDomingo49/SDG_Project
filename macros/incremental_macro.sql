{% macro incremental_macro(new_data_date_column) %}

	    {{ new_data_date_column }} > nvl((select max({{ new_data_date_column }}) from {{ this }}), to_timestamp({{ var('default_min_date') }}))
    

{% endmacro %}