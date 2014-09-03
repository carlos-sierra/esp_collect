# run_esp_collect_requirements.sh
echo "Begin esp_collect_requirements."
ps -ef | grep pmo[n] | grep -v \+ASM | sed 's/.*mon_\(.*\)$/\1/' | while read INST; do
  echo "instance: $INST"

  export ORACLE_SID=$INST
  export ORAENV_ASK=NO
  . oraenv

  sqlplus -s /nolog <<EOF 
  connect / as sysdba

@sql/esp_collect_requirements.sql

EOF
done
zip -qmT esp_requirements.zip esp_requirements.csv esp_requirements.log
echo "End esp_collect_requirements. Output: esp_requirements.zip"