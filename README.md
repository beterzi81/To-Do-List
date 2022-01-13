# Not-Now To-Do List

Not-now bir To-Do List uygulamasıdır. İstediğiniz şekilde kaydolabilir, mevcut hesabınızla giriş yapabilir, not ekleyip bir tarih belirleyebilir, mevcut notlarınızı görüntüleyebilir ve silebilirsiniz. Profil bilgilerinizi giriş yaptıktan sonra görüntüleyebilir, güncelleyebilir ve profilinizi silebilirsiniz.


# Kullanılan teknolojiler

Bu proje bash dili kullanılarak hazırlanmış ve zenity adlı kütüphane ile arayüzü hazırlanmış bir scripttir

## Nasıl Kullanılır?

İlk önce aşağıdaki kodları terminalden çalıştırarak gerekli kütüphaneleri ve programları kuruyoruz:
sudo apt-get update  
sudo apt-get install zenity  
Ardından main.sh dosyasını indirip bir klasörün içine koyuyoruz ve komut satırından main.sh dosyasının bulunduğu klasöre cd komutuyla geçiş yapıyoruz.
Komut satırından ./main.sh yazdığımızda scriptimiz açılacak ve aşağıdaki ekran karşımıza çıkacak:

![Giriş](https://i.hizliresim.com/tay7m1q.png)

Bu ekranda ileri butonuna tıkladığımızda liste şeklinde iki seçenekli bir menü çıkacak:

![Giriş](https://i.hizliresim.com/dnh4921.png)


Buradan ilk olarak kaydol kısmını göstereceğim. Kaydol seçeneğini seçip ileri butonuna bastığımızda aşağıdaki gibi bir form karşımıza çıkacak:

![Giriş](https://i.hizliresim.com/9tlmmvw.png)

Bu formda her alanı doldurmak zorundayız ve doğum tarihini 2000 ve 1922 yılı arasında bir tarih seçmemiz gerekiyor yoksa uyarıyı verip bizi ana menüye gönderecek:

![Giriş](https://i.hizliresim.com/7jnds2v.png)

![Giriş](https://i.hizliresim.com/1mhtvly.png)

Eğer doğru şekilde kaydolursak hesabımız artık sisteme eklenecektir. Hesaplar user.txt adlı dosyada tutuluyor ve her id için bir klasör oluşturuluyor:

![Giriş](https://i.hizliresim.com/34vgabo.png)

Ardından artık mevcut hesabımızın bilgileriyle giriş yapabiliyoruz. Giriş yaptıktan sonra karşımıza kullanıcı paneli çıkıyor:

![Giriş](https://i.hizliresim.com/r7yzf25.png)

Panelden Çıkış seçeneği bizi direkt başlangıç menüsüne atıyor. Yapılacaklar seçeneğine girersek iki farklı seçenek bizi karşılıyor:

![Giriş](https://i.hizliresim.com/tlti5sy.png)

Yeni not eklemek istersek başlık kısmını boş bırakmamamız lazım, ayrıca en sondaki tarih seçme kısmında bugünün tarihinden ileri bir tarih seçmemiz gerekiyor.

Eğer doğru bir şekilde notu oluşturursak kullanıcı adımıza sahip klasörün içinde başlığımızda verdiğimiz isimle bir txt dosyası oluşacak ve dosyanın içinde notumuz, sonunda da tarih bilgileri olacak. Eğer varolan notlarımızdan bir not açmak istersek not seç seçeneğine girip oradan kendi klasörümüzden bir txt dosyası seçmemiz gerekiyor. Farklı bir adresten bir dosya seçersek uyarı verip kullanıcı paneline geri atıyor.

Erişim iznimiz olan kendi notlarımızdan birini seçersek aşağıdaki gibi bize notumuzu görüntülüyor. Anladım butonu ile tekrar kullanıcı paneline dönebiliyoruz.

Profil bilgileri seçeneğini seçtiğimizde ise 3 farklı seçenek karşımıza çıkıyor:

![Giriş](https://i.hizliresim.com/365yap9.png)

Bilgileri görüntüle dersek aşağıdaki gibi profilimizin bütün bilgilerini görüntüleyen bir text box ile karşılaşıyoruz:

![Giriş](https://i.hizliresim.com/15rhx5r.png)

Profil bilgilerini güncelleyebiliyoruz fakat aşağıdaki ekrandaki uyarı gibi id kısmını değiştirmemeliyiz yoksa notlarımıza erişemeyiz:

![Giriş](https://i.hizliresim.com/icj1yp3.png)

Son seçenek olarak da hesabımızı silebiliyoruz:

![Giriş](https://i.hizliresim.com/17okx08.png)

Bu ekranda eminim seçeneğini seçerseniz hem user.txt veritabanımızdan kullanıcı bilgilerimiz siliniyor hem de idmizi taşıyan klasörümüz ve notlarımız siliniyor ve ana menüye geri dönüyoruz.

Scriptimiz genel ayrıntılarıyla bu şekilde çalışıyor. Mevcut hataları ve eksikleri tabiiki var.

## Kullanım Kılavuz Videosu

[![YoutubeVideo](https://img.youtube.com/vi/NROWgr0frWk/0.jpg)](https://youtu.be/NROWgr0frWk)
