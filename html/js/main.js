$(document).ready(function(){
    // 画像をクリックしたらポップアップ表示
    $('.photo-entry').click(function(){
        $('#popup-bg').css('display', 'block');
        // ポップアップ表示時にはスクロールを止める
        $('body').css('overflow', 'hidden');
    })

    // 閉じるボタンor背景クリックでポップアップ閉じる
    $('#close-popup').click(function(){
        $('#popup-bg').css('display', 'none');
        // スクロール再開
        $('body').removeAttr('style');
    })
})