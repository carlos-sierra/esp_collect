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
mv -bf esp_requirements.csv backup
mv -bf esp_requirements.log backup
mv esp_requirements.zip esp_requirements_$(date +"%Y%m%d_%H%M%S").zip
echo "End esp_collect_requirements."