#!/bin/bash
#ls -d *.txt | cut -d "." -f 1
#touch $a.txt
#sed -i '' 's/$degistirilecek/degistirilmishali/' dosya
zenity --info --title="Not Now-Notlar Tutun"  \
--text="<span foreground='#362222' font='28'>\nNot-Now uygulamasına hoşgeldiniz!\n\nHesabınıza giriş yapabilir veya kayıt olabilirsiniz!</span>\n" \
--ok-label="İleri" --width=400 --height=250
if [ $? = 1 ]
then
    exit 0
fi

secim=`zenity  --list  --text="Yapmak istediğiniz işlemi seçip ilerleyiniz."  \
        --column="Seçim" "Giriş Yap" "Kaydol" \
        --ok-label="İleri" --cancel-label="Çıkış"`
if [ $? = 1 ]
then
    exit 0
fi
if [ "$secim" == "Giriş Yap" ] ;
then
    giris=`zenity --forms \
        --separator="," \
        --title="Giriş Yapın" --text="Giriş bilgilerinizi girin." --width=250 --height=200 \
        --add-entry="Kullanıcı Adı" \
        --add-password="Şifre" \
        --ok-label="Giriş Yap" --cancel-label="Geri dön"`
        if [ $? = 1 ]
        then             
                exec ./main.sh
        
        fi
    giris_check=$(grep -w $giris user.txt)
    isim=$(echo "$giris_check" | cut -d "," -f 1)
    soyisim=$(echo "$giris_check" | cut -d "," -f 2)
    id=$(echo "$giris_check" | cut -d "," -f 3)
    sifre=$(echo "$giris_check" | cut -d "," -f 4)
    dogumtarihi=$(echo "$giris_check" | cut -d "," -f 5)
    #echo 'giriş ekranı'
    #echo $giris
    #echo $giris_check
    if [ -z "$giris_check" ]
        then
                zenity --warning \
                --text="<span foreground='#362222' font='15'>\nGiriş bilgileriniz hatalı, lütfen kullanıcı adı ve şifrenizi büyük küçük harflere ve özel karakterlere dikkat ederek giriniz.\nEğer kaydolmadıysanız önce kaydolun...</span>\n" \
                --ok-label="Ana sayfaya dön" --no-wrap
                if [ $? = 0 ]
                then             
                        exec ./main.sh
                else
                    exit 0
                fi
        else
                zenity --info \
                --title="Giriş Yapıldı" \
                --text="<span foreground='#362222' font='15'>Hoşgeldin $isim, lütfen ilerle...</span>\n" --ok-label="İleri" --no-wrap
                if [ $? = 0 ]
                then             
                        while [ true ]
                        do
                        unset postlogin_secim kayit listele_adlari yapilacaklar baslik icerik date day mth year tarih secilen_year secilen_mth secilen_day kalan_sure kalan_mth kalan_day kalan_yil
                        postlogin_secim=`zenity  --list  --text="Yapmak istediğiniz işlemi seçip ilerleyiniz."  \
                                        --column="Seçim" "Yapılacaklar" "Profil Bilgileri" "Çıkış" \
                                        --ok-label="İleri"`
                        case "$postlogin_secim" in
                            "Profil Bilgileri")
                            profil_secim=`zenity  --list  --text="Yapmak istediğiniz işlemi seçip ilerleyiniz."  \
                                        --column="Seçim" "Bilgileri görüntüle" "Bilgileri güncelle" "Hesabı sil" \
                                        --ok-label="İleri" --cancel-label="Ana menüye dön"`
                                case "$profil_secim" in
                                "Bilgileri görüntüle")
                                kullanici_bilgi="İsim: $isim \nSoyisim: $soyisim \nID: $id \nŞifre: $sifre \nDoğum tarihi: $dogumtarihi"
                                echo -e $kullanici_bilgi >> temp.txt
                                zenity --text-info \
                                            --title="Kullanıcı bilgileri" \
                                            --filename=temp.txt --ok-label="Anladım" --cancel-label="Çok iyi anladım"
                                            rm temp.txt
                                            continue
                                            
                                ;;
                                "Bilgileri güncelle")
                            kayit=$(zenity --forms \
                                    --title="Profil Bilgileri" --text="İstediğiniz bilgileri düzelttikten sonra kaydetmeyi unutmayın.Lütfen id'nizi değiştirmeyin." --width=250 --height=400 \
                                    --forms-date-format=%d.%m.%y \
                                    --separator="," \
                                    --add-entry="Mevcut hali: $isim" \
                                    --add-entry="Mevcut hali: $soyisim" \
                                    --add-entry="Mevcut hali: $id" \
                                    --add-password="Mevcut hali: $sifre" \
                                    --add-calendar="Mevcut hali: $dogumtarihi" \
                                    --ok-label="Kaydet" --cancel-label="Geri dön")
                                if [ $? = 0 ]
                                then
                                    sed -i "" "s/$giris_check/$kayit/" user.txt

                                else
                                    exit 0
                                fi
                                ;;
                                "Hesabı sil")
                                zenity --question \
                                --text="<span foreground='#362222' font='15'>\nBu hesabı geri dönüşü olmayacak bir şekilde siliyorsunuz.\nEmin misiniz?</span>" \
                                --width=250 --height=150 --ok-label="Eminim" --cancel-label="Geri dön"
                                if [ $? = 0 ]
                                then 
                                rm -r $id
                                sed -i '' "/$giris_check/d" ./user.txt
                                exec ./main.sh
                                else
                                continue
                                fi
                                ;;
                                esac
                            ;;
                            "Yapılacaklar")
                            
                            yapilacaklar=`zenity  --list  --text="İstediğiniz liste adını seçip ilerleyiniz."  \
                                        --column="Seçim" \
                                        "Not seç" \
                                        "Yeni not oluştur" \
                                        --ok-label="İleri" --cancel-label="Ana menüye dön"`
                                if [ $? = 1 ]
                                then
                                    continue
                                else
                                    if [ "$yapilacaklar" == "Not seç" ]
                                    then
                                    
                                    
                                    secilen_not=`zenity --file-selection --file-filter='*.txt' --title="Notlarınızdan birini seçiniz."`
                                    erisim_izni=$(echo $secilen_not | cut -d "/" -f 6)
                                    dosya_adi=$(echo $secilen_not | cut -d "/" -f 7)
                                    if [ "$erisim_izni" == "$id" ]
                                    then
                                        dosya_islem=`zenity  --list  --text="Bu dosyaya ne yapmak istediğinizi seçin."  \
                                        --column="Seçim" \
                                        "Görüntüle" \
                                        "Sil" \
                                        --ok-label="İleri" --cancel-label="Menüye dön"`
                                        if [ $? = 1 ]
                                        then
                                        continue
                                        fi
                                        case $dosya_islem in
                                        "Görüntüle")
                                            zenity --text-info \
                                            --title="$dosya_adi" \
                                            --filename=$secilen_not --ok-label="Anladım" --cancel-label="Çok iyi anladım"
                                            continue
                                        ;;
                                        "Sil")
                                        rm $secilen_not
                                            zenity --info --text="<span foreground='#362222' font='15'>\n\nNotu sildiniz.Ana menüye aktarılıyorsunuz.</span>" --ok-label="Tamam" --width=250 --height=150 --no-wrap
                                            continue
                                        ;;
                                        esac
                                    else
                                        zenity --warning \
                                                --text="<span foreground='#362222' font='15'>\nBu dosyaya erişim izniniz yok.\nLütfen kendi kullanıcı adınıza sahip klasördeki notlardan birini seçin.</span>" --no-wrap \
                                                --ok-label="Ana menüye dön"
                                                if [ $? = 1 ]
                                                            then 
                                                            exit 0
                                                            else
                                                            continue
                                                            fi
                                    fi
                                    elif [ "$yapilacaklar" == "Yeni not oluştur" ]
                                    then
                                        baslik=`zenity --entry \
                                                --title="Not ekle" \
                                                --text="Notunuzun başlığını giriniz:" --ok-label="İleri" --cancel-label="Geri dön"`
                                            if [ $? = 1 ]
                                            then
                                            continue
                                            fi
                                            if [ $? = 0 ]
                                            then 
                                                if [ -z "$baslik" ]
                                                then
                                                zenity --warning \
                                                --text="<span foreground='#362222' font='15'>\nBaşlık girmek zorunludur.</span>" --no-wrap \
                                                --ok-label="Ana sayfaya dön"
                                                            if [ $? = 1 ]
                                                            then 
                                                            exit 0
                                                            else
                                                            continue
                                                            fi
                                                    
                                                else
                                                cd $id
                                                    touch $baslik.txt
                                                    cd ..
                                                icerik=`zenity --entry \
                                                        --title="Not ekle" \
                                                        --text="Notunuzu giriniz:"`
                                                        if [ $? = 1 ]
                                                        then 
                                                        cd $id
                                                        rm $baslik.txt
                                                        cd ..
                                                        continue
                                                        fi
                                                        cd $id
                                                        echo $icerik >> $baslik.txt
                                                        cd ..
                                                        date=$(date)
                                                        day=$(date +%d)
                                                        mth=$(date +%m)
                                                        year=$(date +%Y)
                                                    tarih=`zenity --calendar \
                                                            --title="Tarih seçin" \
                                                            --text="Bu görevi ne zamana kadar yapmanız gerektiğini seçin." \
                                                            --day=$day --month=$mth --year=$year`
                                                            if [ $? = 1 ]
                                                            then 
                                                            cd $id
                                                            rm $baslik.txt
                                                            cd ..
                                                            continue
                                                            fi
                                                        secilen_day=$(echo $tarih | cut -d "/" -f 1)
                                                        secilen_mth=$(echo $tarih | cut -d "/" -f 2)
                                                        secilen_year=$(echo $tarih | cut -d "/" -f 3)
                                                        if [ $secilen_year -eq $year ] 
                                                        then
                                                            if [ $secilen_mth -eq $mth ]
                                                            then
                                                                if [ $secilen_day -ge $day ]
                                                                then
                                                                date_is_ok="ok"
                                                                fi
                                                            elif [ $secilen_mth -gt $mth ]
                                                            then
                                                            date_is_ok="ok"
                                                            fi
                                                        elif [ $secilen_year -gt $year ]
                                                        then
                                                        date_is_ok="ok"
                                                        fi
                                                            
                                                        
                                                        if [ "$date_is_ok" == "ok" ]
                                                        then
                                                        kalan_yil=$(expr $secilen_year - $year)
                                                            kalan_mth=$(expr $secilen_mth - $mth)
                                                            kalan_day=$(expr $secilen_day - $day + $kalan_mth '*' 30 + $kalan_yil '*' 365)
                                                            kalan_sure="$date tarihinde başlanan, $tarih tarihine kadar taahhütü olan ve $kalan_day günlük bir görevdir."
                                                            
                                                            cd $id
                                                            echo $kalan_sure >> $baslik.txt
                                                            cd ..
                                                            zenity --info --title="Not eklendi"  \
                                                            --text="<span foreground='#362222' font='15'>\nNotunuz başarıyla eklendi.</span>\n" \
                                                            --ok-label="İleri" --no-wrap
                                                            if [ $? = 1 ]
                                                            then 
                                                            exit 0
                                                            else
                                                            continue
                                                            fi
                                                        else

                                                        cd $id
                                                            rm $baslik.txt
                                                            cd ..
                                                        zenity --warning \
                                                                --text="<span foreground='#362222' font='15'>\nHatalı bir tarih girdiniz.\nLütfen bugünden ileride bir tarih giriniz.Notu tekrar oluşturmanız gerekiyor.</span>" --no-wrap \
                                                                --ok-label="Ana sayfaya dön"

                                                                if [ $? = 1 ]
                                                            then 
                                                            exit 0
                                                            else
                                                            continue
                                                            fi
                                                        fi
                                                    
                                                fi
                                            else
                                            exit 0
                                            fi    
                                    fi

                                    fi
                            ;;
                            "Çıkış")
                            exec ./main.sh
                            ;;
                        esac
                        done
                else
                    exit 0
                fi

                                
        fi
elif [ "$secim" == "Kaydol" ] ;
then
    kayit=$(zenity --forms \
        --title="Kaydolun" --text="Kayıt olmak için formu eksiksiz bir biçimde doldurun." --width=250 --height=400 \
        --forms-date-format=%d.%m.%Y \
        --separator="," \
        --add-entry="Ad" \
        --add-entry="Soyad" \
        --add-entry="Kullanıcı adı" \
        --add-password="Şifre" \
        --add-calendar="Doğum tarihi" \
        --ok-label="Kaydol" --cancel-label="Geri dön")
        if [ $? = 1 ]
        then
            exec ./main.sh
        fi
            
        k_isim=$(echo "$kayit" | cut -d "," -f 1)
        k_soyisim=$(echo "$kayit" | cut -d "," -f 2)
        k_id=$(echo "$kayit" | cut -d "," -f 3)
        k_sifre=$(echo "$kayit" | cut -d "," -f 4)
        k_dogumtarihi=$(echo "$kayit" | cut -d "," -f 5)
        if [[ -z $k_dogumtarihi || -z $k_id || -z $k_isim || -z $k_sifre || -z $k_soyisim ]]
        then
        zenity --warning \
                --text="<span foreground='#362222' font='15'>\nHiçbir alanı boş bırakamazsınız.</span>" --width=250 --height=150 \
                --ok-label="Anladım"
                exec ./main.sh
        fi
        yil=$(echo $kayit | cut -d "," -f 5 | cut -d "." -f 3 | bc)
        max=2000
        min=1922
        if [[ "$yil" -gt "$max" || "$yil" -lt "$min" ]]
        then
        zenity --warning \
                --text="<span foreground='#362222' font='15'>\nUygulamayı kullanmak için uygun yaş aralığında değilsiniz.</span>" --width=250 --height=150 \
                --ok-label="Anladım"
                exec ./main.sh
        fi 
        
        kontrol=$(echo "$kayit" | cut -d "," -f 3)
        kayit_check=$(grep -w $kontrol user.txt)
        if [ -z "$kayit_check" ];
        then
            echo $kayit >> user.txt
            mkdir $kontrol
            zenity --info --text="<span foreground='#362222' font='15'>\n\nKaydolma işlemi başarılı.\n\nAna sayfaya yönlendiriliyorsunuz...</span>" --ok-label="Tamam" --width=250 --height=150 --no-wrap
            if [ $? = 0 ]
                then
                    exec ./main.sh
                fi
        else
            zenity --warning \
                --text="<span foreground='#362222' font='15'>\nBu kullanıcı adı zaten mevcut, lütfen giriş yapın veya farklı bir kullanıcı adı seçin.</span>" --width=250 --height=150 \
                --ok-label="Tamam" 
                if [ $? = 0 ]
                then
                    exec ./main.sh
                fi
        fi
elif [ -z "$secim" ]
then
    zenity --warning \
        --text="<span foreground='#362222' font='15'>\nLütfen bir işlem seçin.</span>" --no-wrap \
        --ok-label="Ana sayfaya dön" 
    if [ $? = 0 ]
    then
        exec ./main.sh
    fi
else
    exit 0
fi