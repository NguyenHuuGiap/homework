var slideDwonSpeed = 300;
var current_scrollY;

$(function() {
  // .search_sct_btn_trigger：検索メニューの開閉トリガー
  $('.search_sct_btn_trigger').on('click', function(e){
    e.preventDefault();
    var $t = $(this).closest('.search_sct_btm');
    if ($t.hasClass('is-open')) {
      $t.removeClass('is-open');
    }else {
      $t.addClass('is-open');
    }
    $t.children('.search_lst_wrapper').slideToggle(slideDwonSpeed);
  });

  // 「全て」のチェック切り替え時
  $('.checked_all').click(function() {
    var flg = $(this).prop('checked');
    $(this).parents('ul').find('input[type="checkbox"]').each(function(){
      $(this).prop('checked', flg);
    });
  });
  $('.checked_list').click(function() {
    $(this).parents('ul').find('.checked_all').each(function(){
      $(this).prop('checked', false);
    });
  });
});


/*
 * 列の高さ調整
 */
function resizeRow() {
  $(function() {
    var auto = $("ul.auto");
    $.each( auto, function(i, val) {
      var lines = $(this).children("li:nth-child(n+2)");
      var h = 0;
      $.each( lines, function(j, line) {
//        if (j < lines.length - 1) {
//          h += $(this).height();
//        } else {
          h += $(this).outerHeight(true);
//        }
      });
      $(this).children("li:first-child").css({
        height: h + 'px',
        'line-height': h + 'px'
      });
    });
  });
}

/*
 * タイトル部のトグル
 */
function toggleTitle() {
  $(function() {
    $(".toggle_title").click(function(){
      $(this).toggleClass("active").next().toggle('blind', '', 500);
    });
  });
}


//var leftDiff, topDiff,
//  doc = $(document),
//  floatbox = $(".floating_window_background > div"),
//  handle = $(".floating_window_background > div .window_bar");
//
//// ドラッグ中
//function moving(event) {
//  floatbox.css("left", (event.pageX - leftDiff) + "px")
//    .css("top", (event.pageY - topDiff) + "px")
//    .css("opacity", 0.7);
//}
//
//// ドラッグ終了時
//function dragEnd() {
//  doc.off("mousemove mouseup");
//  floatbox.css("opacity", 1);
//}
//
//// マウスダウン時
//function mouseDown(event) {
//  leftDiff = floatbox.offset().left;
//  topDiff = floatbox.offset().top;
//  doc.on("mousemove", moving)
//    .on("mouseup", dragEnd);
//}
//
//// ハンドル部分に対するイベント設定
//handle.on("mousedown", mouseDown);


// ↓-- 日付のフォーマット変更mm/dd 本来はサーバー側で行うので、必要なし ---------------------------------------------
// 020106.jsonの日付項目を0埋めするのが大変なので作成、モックでのみ使用
// クラス選択と暮らす詳細画面で使用
function formatData(data) {
  var splitData = data.split('/');
  var m = splitData[0];
  var d = splitData[1];
  if (m < 10) {
  m = '0' + m;
  }
  if (d < 10) {
    d = '0' + d;
  }
  var result = m + '/' + d;
  return result;
}
// ↑--------------------------------------------------------------------------------------------------------------
