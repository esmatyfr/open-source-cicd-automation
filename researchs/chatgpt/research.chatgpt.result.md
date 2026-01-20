# Research Result for chatgpt
CI/CD Boru Hatları (DevOps ve Otomasyon)
Sürekli Entegrasyon (CI), geliştiricilerin kodu sık sık ortak bir depoya (örneğin main branch) entegre etmesi, her entegrasyonun otomatik olarak derlenmesi ve test edilmesi demektir
. Bu sayede hatalar entegrasyon sırasında erkenden yakalanır. Bir CI sistemi, koda yapılan push veya pull request olaylarına tepki vererek projeyi derler, birim testlerini çalıştırır ve entegrasyonun sorunsuz olduğunu kontrol eder
. CI/CD uygulayan takımlar, böylece üretime kod dağıtım hızını katbekat artırmakta ve hata oranını düşürmektedir
. Sürekli Teslimat/Sürekli Dağıtım (CD), CI aşamasında onaylanmış yazılım paketinin otomatik ve tekrarlanabilir bir şekilde test, staging veya prod ortamlarına dağıtılmasıdır
. CD, kodun her değişiklik sonrası üretim benzeri bir ortama güvenli şekilde teslim edilmesini sağlar. Böylece yeni özellikler hızlıca kullanıcıya ulaştırılabilir. Modern CI/CD uygulamalarında otomasyon merkezidir – elle yapılan tekrarlayan işlerin tümü pipeline’lar ile otomatikleştirilir; bu sayede ekipler çok daha hızlı iterasyon yapabilmekte ve sık aralıklarla güvenli teslimat sağlamaktadır
. Genel olarak CI/CD, geliştirme ile operasyon ekiplerini yakınlaştırıp (“DevOps”), yüksek kaliteyi koruyarak dağıtım döngüsünü hızlandırır
.
En İyi Uygulamalar
Küçük ve sık entegrasyonlar: Kod değişikliklerini küçük parçalara bölün ve sık sık (örneğin günlük) ana dala gönderin. Bu sayede hataları erken yakalarsınız
. Takım olarak trunk-based development benimsemek test ve entegrasyonu daha verimli kılar.
Otomatik testlerin erken entegrasyonu: Pipeline’a birim testi, entegrasyon testi ve statik analiz (SAST/SCA) gibi kontrolleri ekleyin. Kritik testleri (birim testleri, lint vb.) derleme aşamasının hemen ardından “fail-fast” şeklinde koşturun; hatalı değişiklikler erkenden durdurulsun
. Her pull request’te veya kod gönderildiğinde güvenlik taramalarının (kod analizi, bağımlılık taramaları) otomatik çalışması hatalı kodun geçişini engeller
.
Tek derleme, çok ortam: Yazılımı yalnızca bir kez derleyip/ambalajlayın ve ortaya çıkan tek artefaktı (örneğin Docker imajı, .zip vs.) test, staging ve prod ortamlarında kullanın. Böylece her ortamda aynı koşullar geçerli olur (aynı kod/doğrulama)
. Docker imajları için multi-stage build kullanın; bu yöntem, final imajın boyutunu azaltır ve güvenlik yüzeyini daraltır
. CI pipeline’ında mümkünse Docker-in-Docker yerine Kaniko veya Docker BuildKit gibi daha güvenli yöntemleri tercih edin
.
Şube yönetimi ve sürümleme: Kritik şubeler (örn. main, release şubeleri) üzerinde koruma kuralları uygulayın, doğrudan merge yerine pull request’lerle kod gözden geçirme zorunlu tutun. Sürüm yönetimi için etiket (tag) kullanın ve her dağıtımdan sonra imajları/tag’ları arşivleyin. GitLab örneğinde önerildiği gibi, release etiketlerini ana daldan koruyun ve projeleri semver ile işaretleyin
.
Pipeline şablonları ve tekrar kullanım: Organizasyonda birden fazla proje varsa ortak bir pipeline şablonu veya template oluşturun. Her proje bu şablonu import ederek benzer adımları (ör. derleme, test, dağıtım) tutarlı bir şekilde yürütür. GitLab’ın önerdiği gibi, pipeline kopyası yerine modüler yapı (örneğin reusable workflows veya include dosyaları) kullanarak tek noktadan güncelleme imkânı sağlayın
.
Esnek tetiklemeler ve kısmi koşullar: Pipeline’ın gereksiz çalışmasını önlemek için yalnızca ilgili durumlarda tetikleyin. Örneğin paths: özelliği ile sadece belirli klasörlerde değişiklik olunca pipeline koşturun. Zamanlanmış iş (cron) kullanarak düzenli taramalar yapabilirsiniz. GitLab’ın rules veya GitHub’ın if: şartları ile iş akışını dallara ve etiketlere göre yönetin
.
Paralelleştirme ve hızlı geri bildirim: Pipeline adımlarını paralel çalıştırarak toplam süreyi kısaltın. Örneğin birden fazla .NET veya Node versiyonunda derleme yapmak için matrix kullanın
. Kritik bağımlılık kontrollerini (linting, birim testleri) önce çalıştırıp başarısız olursa pipeline’ı durdurun (fail-fast). Bu sayede kaynak israfını önler ve geliştirici hızlıca aksiyon alır
.
Gözlemleme ve hata kurtarma: Pipeline günlükleri, hataların nedenini göstermek için kapsamlı olsun. İzleme, uyarı ve metriklerle pipeline sağlığını takip edin. Önemli kod havuzları ve konfigürasyonların yedeğini alın. Bir sorun durumunda otomatik olarak rollback veya yeni bir derleme (örneğin master yeniden tetikleme) yapabilecek mekanizmalar kurun. GitProtect’ın önerdiği gibi, acil durum kurtarma planları ve konfigürasyon yönetimi kritik bir safhadır
.
Güvenlik entegre edilmesi: Pipeline’ınızı bir güvenlik hattı olarak düşünün. Kod ve bağımlılık taramalarını entegre edin
. Altyapı kodu (IaC) şablonlarını dağıtmadan önce güvenlik taramasından geçirin. CI sürecinde ekipman izolasyonu (container, VM, ağ segmentasyonu) kullanın. Örneğin Codacy’nin önerisiyle yapı ortamını konteyner içine alarak yetkisiz erişimi azaltın
.
Araçların Karşılaştırması (Rakipler)
Jenkins: Açık kaynaklı, yıllardır kullanılan bir otomasyon sunucusudur. Esneklik ve geniş bir eklenti ekosistemi ile (1.800’den fazla eklenti
) neredeyse her iş akışını destekler. Özellikle özelleştirilmiş ve karmaşık CI senaryolarında tercih edilir
. Ancak Jenkins’i çalıştırmak için sunucu kurulum ve bakım yükümlülüğü vardır; bir “Jenkinsfile” (Groovy DSL) ile pipeline tanımlanır ve bu öğrenilmesi zaman alabilir
. Büyük ve izole ortamlarda (air-gapped veya on-prem) güvenlik ve uyum gereksinimleri yüksek projelerde hâlâ popülerdir
.
GitHub Actions: GitHub’a entegre modern bir CI/CD hizmetidir. Herhangi ek kurulum gerektirmez; .github/workflows/ altına koyduğunuz YAML dosyası pipeline’ı oluşturur
. Workflow’lar doğrudan GitHub arayüzünden tanımlanır ve GitHub kaynak kontrolü ile sıkı entegrasyonu sayesinde sürüm kontrolü, pull request ve aksiyonlar (Marketplace) arasında sorunsuz geçiş sağlar
. Konfigürasyon YAML ile kolay okunur (örneğin actions/checkout, actions/setup-node/dotnet gibi hazır aksiyonlar kullanılır)
. Barındırmalı koşucular veya kendi kendine barındırılan (self-hosted) runner’lar (örneğin Ubuntu 22.04 üzerine kurulmuş) kullanabilirsiniz. GitHub Actions, GitHub reposunu kullanmaya odaklı ekipler için idealdir ve küçük/orta ölçekli projelerde hız avantajı sağlar
.
GitLab CI/CD: GitLab platformunun içine gömülü bir CI/CD aracıdır. Kod deposu, sorun takip, Container Registry gibi işlevlerle uçtan uca entegre bir deneyim sunar. Pipelinelar .gitlab-ci.yml dosyasıyla YAML tabanlı tanımlanır. Çalışma şekli olarak GitHub Actions’a benzer ama daha çok hibrit (hem GitLab sunuculu hem self-hosted) kullanım öngörülmüştür
. GitLab CI, varsayılan olarak gelişmiş güvenlik tarama (SAST, DAST, SCA) ve gereksinimlerle gelir
. Büyük takım ve projelerde, hem açık kaynak kodlu (GitLab Community Edition) hem de kurumsal özellikler (Enterprise Edition) desteğiyle tercih edilir. Kurulumu Jenkins kadar zahmetli değildir ve GitLab ekosistemine dahil projelerde tercihtir
.
Bu üç araç arasında özetle; GitHub Actions GitHub projeleri için kolay başlangıç ve geniş eylem kitaplığı, GitLab CI entegre güvenlik ve özelleştirilebilirlik, Jenkins ise tam kontrol ve devasa eklenti desteği sunar
.
GitHub Actions Yapılandırması (YAML)
GitHub Actions iş akışları bir veya daha fazla YAML dosyası ile tanımlanır (örneğin .github/workflows/ci.yml). Temel parametreler şunlardır:
on: Pipeline’ı tetikleyen olay(lar). Örneğin on: push ile kod pushlandığında, on: pull_request ile PR açıldığında çalışır. Branş ve etiket filtreleri de ekleyebilirsiniz.
jobs: İş akışı içindeki bağımsız iş kümeleri. Her iş (<job_id>) kendi runs-on ortamında koşar (örneğin ubuntu-22.04 ya da self-hosted Runner)
.
steps: Her iş içinde adım adım yapılacaklar listesi
. Adımlar ya bir action kullanır (uses: actions/checkout@v5 gibi) ya da kabuk komutu çalıştırır (run: npm test). Adım ortam değişkenleri, adım içinde env: ile veya iş seviyesinde jobs.<job_id>.env: altında tanımlanır
. Örneğin:
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v5
      - name: Build App
        run: dotnet build MyApp.sln
Burada ilk adım repoyu çeker, ikinci adım .NET derler (konteyner içinde ubuntu-latest ile). Her adım kendi sürecinde (run komutunda) çalışır
.
env: Çevre değişkenleri. Hem tüm iş için (jobs.<job_id>.env) hem de adım bazında (steps[*].env) tanımlanabilir. Daha üstte tanımlanan değişken, aşağıdaki adımları etkiler. Örneğin, [18†L2548-L2556]’daki örnekte bir adımda FIRST_NAME: Mona gibi değişkenler çalıştırılırken kullanılmıştır.
secrets: Hassas bilgiler GitHub özel Secrets depo’sunda saklanır ve adımlara $ {{ secrets.SECRET_NAME }} ile eklenir. Örneğin AWS veya Docker şifreleri repository > Settings > Secrets altında tanımlanır. GitHub’da üç seviye secret vardır: Repository Secrets (tek depo), Environment Secrets (örn. staging/prod ortamları için onaylı) ve Organization Secrets (birden çok repo ortak)
. Secret’lar şifreli olarak depolanır ve çalışma zamanında ortam değişkeni olarak çözülür. Adım içinde yanlışlıkla yazdırılırsa GitHub otomatik olarak maskeleme yapar.
Diğer önemli parametreler: uses (başka bir action’ı belirtir), with (action’a parametre geçirilir), needs (bir işin başka bir işten sonra başlamasını sağlar), strategy.matrix (aynı işin farklı varyasyonlarını paralel çalıştırır) gibi ayarlar. Ayrıca permissions ile GITHUB_TOKEN izinlerini kısıtlayabilir, defaults ile tüm adımlar için ortak özellikler (shell, çalışma dizini vb.) tanımlayabilirsiniz. Özetle, iş akışını .yml ile kod olarak versiyonlayabilir, her adımı açıkça steps içinde belirterek otomasyonu tam kontrol altına alabilirsiniz
.
Güvenlik ve Gizli Bilgi Yönetimi (SecOps)
Secret Yönetimi: GitHub Actions’ta token ve anahtarlar gizli tutulmalıdır. Ayrı bir dosyaya (kod içinde) sabit yazmayın. Bunun yerine GitHub Secrets kullanın ve değerleri $ {{ secrets.NAME }} ile çekin
. Secret’lar şifrelidir ve yalnızca erişim izni olan iş akışları tarafından görülebilir
. Örneğin environment secrets ile production için ek onay mekanizması ekleyebilirsiniz. Secret’ları düzenli olarak (30–90 günde) yenilemek, uzun ömürlü erişim anahtarları yerine kısa süreli OIDC token’ları kullanmak Tavsiye edilir
. Hard-coded (sabit) anahtar taraması yapın; Pipeline’da gizli bilgi sızıntısı olması en sık rastlanan saldırı vektörlerinden biridir
.
Token İzinleri: GITHUB_TOKEN ve diğer erişim token’larının yetkilerini minimum düzeyde tutun
. Örneğin kod okuma dışında write izni gerekli olmayan işlemlerde permissions: read-all gibi kısıtlamalar getirin. Böylece sızma durumunda hasarı azaltabilirsiniz.
Kod Tarama ve Güncelleme: Pipeline başında CodeQL, SAST/SCA gibi otomatik güvenlik taramaları ekleyin. GitHub’un sağladığı kod tarama şablonları ve Dependabot ile bağımlılıklarınızı güncel tutun
. Dependabot, kullandığınız aksiyon ve kütüphanelerin güncel tutulmasına yardımcı olur. Güvenlik açıklarını erkenden tespit eden bu araçlar, geliştirme sırasında müdahale imkânı verir.
Üçüncü Taraf Aksiyon Güvenliği: Harici action kullanacaksanız dikkatli olun. Action’ları sürüm/commit bazında kilitleyin (tam SHA ile)
. Böylece kötü niyetli bir güncelleme riskini azaltırsınız. Action’ın sahibi güvenilir değilse kaynak kodunu inceleyin. GitHub’ın önerdiği gibi “Verified Creator” ibaresi olan aksiyonları tercih edebilirsiniz. Ayrıca bir aksiyonun tüm repository ve secret’lara erişimi olabileceğini unutmayın
.
Self-Hosted Runner Güvenliği: Kendi sunucunuzdaki runner’ları kullanırken ortamı koruyun. GitHub dokümanları, self-hosted runner’ların tek seferlik olması gerektiğini, yani her işten sonra yok edilebilen ephemeral yapı kullanmayı önerir
. Public depolarda self-hosted runner kullanılmamalıdır, çünkü bir pull-request ile kötü niyetli kod çalıştırılabilir ve ortamınız ele geçirilebilir
. Özel projelerde bile, runner’ı izole ağda çalıştırın, gereksiz erişimleri kapatın ve düzenli yamalayın. Runner’lar için organizasyon seviyesinde gruplar kullanıp sadece yetkili depolardan iş alacak şekilde sınırlandırma yapın
.
Çalışma Dosyası Koruması: Workflow dosyalarınıza yapılan değişiklikleri denetim altında tutun. GitHub’ın CODEOWNERS özelliği ile .github/workflows klasörünü bir güvenilirine atayarak, her değişikliği incelemeye zorlayabilirsiniz
. Böylece workflow’a kimliksiz kod eklenmesinin önüne geçersiniz.
Pipeline Güvenliği: Pipeline’ınız bir saldırı yüzeyidir. Adım başına konteyner izolasyonu ve minimal izinlerle çalıştırın. OWASP’ın CI/CD risklerine göre sürekli olarak pipeline’ı zorlayın. Örneğin SolarWinds saldırısı gibi tedarik zinciri ataklarını engellemek için imza doğrulama ve SBOM uygulayın
. Bağımlılık yönetimi için Dependency graph ve SBOM (yazılım bileşen listesi) kullanarak açık kütüphaneleri belirleyin
.
Scan ve İnceleme: Pipeline’da kod otomatik olarak analiz edilmelidir. Secrets sızıntısı için tarayıcılar (ör. truffleHog, GitGuardian) kullanın
. Yeni kod her PR’da SAST ile taranarak güvenlik açığı hızlıca tespit edilebilir
. Açık kaynak bağımlılıkları güncel tutmak için npm audit, dotnet outdated, VS Code Extensions veya Dependabot’u kullanın. Tüm bu önlemler, CI/CD sürecinizin güvenlik seviyesini artıracak ve üretim hattınızı dış tehditlere karşı sağlamlaştıracaktır.
