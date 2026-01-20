#  CI/CD & Otonom Otomasyon Merkezi

Bu repo, **İstinye Üniversitesi - Açık Kaynak İşletim Sistemi** dersi final projesi için geliştirilmiştir. Proje, modern web uygulamaları (React, .NET 8 vb.) için **CI/CD Pipeline** mimarisini ve otonom sistem yönetimini kapsar.

## 🎯 Proje Hedefi

Tek bir "push" ile tüm sistemi ayağa kaldıran, hataları önceden sezen ve kendi sağlığını kontrol edebilen otonom bir altyapı oluşturmak.

## 🧠 Çoklu Kaynaklı Doğrulama (AI Research)

Projenin teorik altyapısı, doğruluğu artırmak adına 4 farklı dev AI modeliyle çapraz sorgulanarak oluşturulmuştur:

* **Gemini Pro:** Derin mantık ve mimari analiz.
* **Gemini Fast:** Hızlı veri doğrulama.
* **ChatGPT (OpenAI):** Teknik dokümantasyon ve best practice'ler.
* **DeepSeek:** Derin araştırma ve kod mantığı.

## 🛠️ Teknik Yetenekler (Auto-Features)

Sistem, manuel müdahaleye gerek kalmadan şu yetenekleri sergiler:

* **Auto Control:** `check_system.sh` ile sistem sağlığını (Docker, Disk vb.) izler.
* **Auto Test:** `test_logic.sh` ile kodun ve mantığın doğruluğunu denetler.
* **JSON-First Integration:** Tüm proje meta verilerini `project_info.json` üzerinden type-safe bir yaklaşımla işler.

## ⚡ Entegrasyon ve Çalıştırma

Tüm otomasyon süreçlerini tek bir komutla başlatabilirsiniz:

```bash
chmod +x src/*.sh
./src/integration_hub.sh

```

---

**Geliştirici:** Esma Tayfur
**Ders:** Açık Kaynak İşletim Sistemleri
**Durum:** Entegrasyon Tamamlandı 
