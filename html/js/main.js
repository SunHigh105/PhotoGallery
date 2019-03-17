var startTime = new Date();

// 初回読み込み時のローディング
var h = $(window).height();
var w = $(window).width();
console.log(w);
$('#loader-bg, #loader').height(h).css('display', 'block');
$(window).on('load',function(){

    // 最初はコンテンツを非表示
    $('.page-bg').css('display', 'none');
    $('.site-header').css('display', 'none');

    $('#loader-bg').delay(900).fadeOut(800);
    $('#loader').delay(600).fadeOut(800);
    $('.site-header').delay(1500).fadeIn(1500);
    $('.page-bg').delay(1500).fadeIn(1500);
})

$(document).ready(function(){
    var endTime = new Date();
    console.log(endTime - startTime + "ms");

    // 画像をクリックしたらポップアップ表示
    $('.photoframe').click(function(){
        // クリックした画像の番号
        var $num = $('.photoframe').index(this);
        // パスを取得
        var $path = $('.photoframe').eq($num).find('img').attr('src');

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