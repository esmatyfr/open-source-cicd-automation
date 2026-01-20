#!/bin/bash
# integration_hub.sh - Tüm Süreçleri Bağlayan Entegrasyon Merkezi

echo "--- [PROJE ENTEGRASYONU BAŞLATILDI] ---"

# 1. JSON-First Yaklaşımı: Proje bilgilerini specs'den çek
# (jq aracı ile JSON verisini 'type-safe' gibi güvenli okuyoruz)
PROJE_ADI=$(cat specs/project_info.json | grep -oP '(?<="projectName": ")[^"]*')
VERSIYON=$(cat specs/project_info.json | grep -oP '(?<="version": ")[^"]*')

echo ">>> Calisan Proje: $PROJE_ADI (v$VERSIYON)"

# 2. Terminal Otomasyonu ile Testleri Tetikle
echo ">>> Adim 1: Sistem Kontrolü..."
./src/check_system.sh

echo ">>> Adim 2: Mantiksal Testler (Auto-Test)..."
./src/test_logic.sh
if [ $? -eq 0 ]; then
    echo "[BASARILI] Testler gecti, Deployment baslatiliyor."
else
    echo "[HATA] Testler basarisiz! Deployment durduruldu."
    exit 1
fi

# 3. Deployment Otomasyonu
echo ">>> Adim 3: Otonom Deployment..."
./src/deploy_automation.sh

echo "--- [ENTEGRASYON TAMAMLANDI] ---"
