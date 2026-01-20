#!/bin/bash
# test_logic.sh - Fonksiyonel Test Scripti

echo "--- [AUTO-TEST BAŞLATILIYOR] ---"

# Basit bir toplama testi (Örnek mantık testi)
EXPECTED=10
RESULT=$((5 + 5))

if [ "$RESULT" -eq "$EXPECTED" ]; then
    echo "[PASS] Hesaplama testi başarılı! ($RESULT)"
    exit 0
else
    echo "[FAIL] Hesaplama hatası! Sonuç: $RESULT"
    exit 1
fi
