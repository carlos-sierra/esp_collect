ESP_COLLECT v1505 (2015-05-28) by Carlos Sierra and Rodrigo Righetti

ESP_COLLECT is a "free to use" script that collects Oracle Database(s) Requirements
from a Host. Since most of the metadata collected comes from DBA_HIST and ASH Views,
the system where it runs must have a valid Oracle Diagnostics Pack License.

Steps
~~~~~
1. Connect to the Host as Oracle. Unzip esp_collect.zip, navigate to the root esp_collect 
   directory, and execute shell script provided:

   $ unzip esp_collect.zip
   $ cd esp_collect
   $ sh run_esp_master_linux.sh

Notes:
1. To collect requirements from just one database execute then 
   sql/esp_master.sql connecting as SYS