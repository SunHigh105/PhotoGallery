$(document).ready(function(){
    // 画像をクリックしたらポップアップ表示
    $('.photo-entry').click(function(){
        // クリックした画像の番号
        var $num = $('.photo-entry').index(this);
        // パスを取得
        var $path = $('.photo-entry').eq($num).find('img').attr('src');

        $('#popup-bg').css('display', 'block');
        // 画像パスをポップアップに埋め込む
        $('.popup').find('img').attr('src', $path);
        // ポップアップ表示時にはスクロールを止める
        $('body').css('overflow', 'hidden');
    });

    // 閉じるボタンor背景クリックでポップアップ閉じる
    function closePopup(){
        $('#popup-bg').css('display', 'none');
        // スクロール再開
        $('body').removeAttr('style');
    }

    $('#close-popup').click(function(){
        closePopup();
    });

    $('#popup-bg').click(function(){
        closePopup();
    })

})