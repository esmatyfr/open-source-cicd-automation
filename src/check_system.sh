#!/bin/bash
# check_system.sh - Sistem Sağlık Kontrolü

echo "--- [OTOMATİK KONTROL BAŞLADI] ---"

# 1. Docker yüklü mü?
if command -v docker &> /dev/null; then
    echo "[TAMAM] Docker yüklü: $(docker --version)"
else
    echo "[HATA] Docker bulunamadı!"
fi

# 2. Disk alanı yeterli mi? (Örnek kontrol)
DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
if [ "$DISK_USAGE" -lt 90 ]; then
    echo "[TAMAM] Disk kullanımı güvenli seviyede: %$DISK_USAGE"
else
    echo "[UYARI] Disk alanı dolmak üzere!"
fi

echo "--- [KONTROL TAMAMLANDI] ---"
