$(function() {
  // .openedが振られたメニューはロード時に開いた状態で表示
  $('.opened').addClass('is-open');
  $('.opened .accordion_contents').show();
  
  // .accordion_title：アコーディオンのトリガー
  // .accordion_contents：アコーディオンで開閉される中身
  $('.accordion_title').on('click', function(e){
    e.preventDefault();
    var $t = $(this).closest('li');
    if ($t.hasClass('is-open')) {
      $t.removeClass('is-open');
    }else {
      $t.addClass('is-open');
    }
    $t.children('.accordion_contents').slideToggle(slideDwonSpeed);
  });
});
