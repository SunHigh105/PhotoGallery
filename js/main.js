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
    $('footer').css('display', 'none');

    $('#loader-bg').delay(900).fadeOut(800);
    $('#loader').delay(600).fadeOut(800);
    $('.site-header').delay(1500).fadeIn(1500);
    $('.page-bg').delay(1500).fadeIn(1500);
    $('footer').delay(1500).fadeIn(1500);
})

$(document).ready(function(){

    var total = $('.photoframe').length;
    var index = $('.wrapper').length;
    if(index <= 1){
        $('.posts').text(total + ' posts');
    }

    var endTime = new Date();
    console.log(endTime - startTime + "ms");

    // 画像をクリックしたらポップアップ表示
    $('.photoframe').click(function(){
        // クリックした画像の番号
        var num = $('.photoframe').index(this);
        // 画像パスを取得
        var path = $('.photoframe').eq(num).find('img').attr('src');

        // $('#popup-bg').css('display', 'block');
        $('#popup-bg').fadeIn(500);
        // 画像パスをポップアップに埋め込む
        $('.popup').find('img').attr('src', path);
        // ポップアップ表示時にはスクロールを止める
        $('body').css('overflow', 'hidden');

        // キャプションを取得
        $.ajax({
            type: 'POST',
            url: 'ajax.php',
            dataType: 'json',
            data: {
                photo_id: $('.photoframe').eq(num).attr('photo-id')
            }
        }).done(function(data){
            $('.date-token').text(data.date_token);
            $('.comment').text(data.comment);

        }).fail(function(){
            alert('Data connection error occured');
        });

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
    
    // 年選択
    $('.backnumber li').click(function(){
        // クリックしたliタグの番号
        var num = $('.backnumber li').index(this);
        // スクロールの速度
        var speed = 400; // ミリ秒
        // アンカーの値取得
        var href= $('.backnumber a').eq(num).attr('href');
        // 移動先を取得
        var target = $(href == "#" || href == "" ? 'html' : href);
        // 移動先を数値で取得
        var position = target.offset().top - $('.site-header').outerHeight();
        // スムーススクロール
        $('body,html').animate({scrollTop:position}, speed, 'swing');

    });

})