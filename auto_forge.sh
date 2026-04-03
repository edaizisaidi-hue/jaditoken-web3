#!/bin/bash
# OMEGA: AUTONOMOUS FORGE VECTOR

echo "[STATUS: AUTO-FORGE AKTIF]"
while true; do
  # Jana jumlah rawak antara 10 hingga 999
  AMOUNT=$(( ( RANDOM % 990 )  + 10 ))
  
  echo "$(date) - Menghantar isyarat tempaan: $AMOUNT unit..."
  curl -s -X POST http://localhost:5000/forge/token \
       -H "X-API-KEY: OmegaMatrix77" \
       -H "Content-Type: application/json" \
       -d "{\"amount\": $AMOUNT}" > /dev/null

  # Sela masa rawak antara 30 saat ke 5 minit (30 - 300 saat) untuk 'stealth'
  DELAY=$(( ( RANDOM % 270 )  + 30 ))
  echo "Menunggu $DELAY saat untuk kitaran seterusnya..."
  sleep $DELAY
done
