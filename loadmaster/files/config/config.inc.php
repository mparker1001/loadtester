{%- set nets=salt['publish.publish']('*loadworker*','network.interfaces') -%}
{%- set i = 1 -%}
{%- for n in nets %}
{%- set i = i + 1 -%}
{%- endfor %}

<?php
//Number of slave servers (ensure that all slave servers have an entry in /etc/hosts)
$servers = '{{ i }}';

//Full path to shell script that performs index - used by indexer.php
$index_bin = "{{ docroot }}/bin/indexer.sh";

//Full path to cache directory - used by indexer.php and displaylog.php
$cache_base_path = "{{ docroot }}/siege/cache/";

//Relative URL Path to cache directory - used by indexer.php
$cache_url_path = "./cache";

//Delay between requests - used by indexer.php
$delay = 0;

//Name of URL list file - used by indexer.php
$url_list = 'url.txt';

//Name of verbose log file - used by indexer.php and displaylog.php
$verbose_log = 'verbose.html';

?>
