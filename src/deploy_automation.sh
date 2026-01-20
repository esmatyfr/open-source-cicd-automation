#!/bin/bash
# deploy_automation.sh - Docker ve Deployment Otomasyonu

APP_NAME="benim-uygulamam"

echo ">>> Docker Container Süreci Başlatılıyor..."

# Eğer eski bir container varsa durdur ve sil
docker stop $APP_NAME 2>/dev/null
docker rm $APP_NAME 2>/dev/null

# Yeni container build (Temsili)
echo ">>> Yeni Docker imajı build ediliyor: $APP_NAME"
# docker build -t $APP_NAME . 

echo ">>> Sistem başarıyla güncellendi!"
