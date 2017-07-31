/* クラス詳細画面 フローティングを開く */
function openFloatingClassInfo(order) {
  $("#fw080101 .period").text("2016年10月期");
  $("#fw080101 .dayofweek").text(order.dayofweek + "　" + order.timesofday);
  $("#fw080101 .school").text(order.school);
  $("#fw080101 .program").text(order.subject);
  $("#fw080101 .class").text(order.class);
  $("#fw080101 .teacher").text(order.teacher);
  $("#fw080101 .schedules").html("");
  $("#fw080101 .remarks").html("");
  if (order.remarks != "") {
    $('#fw080101 .remarks_area').html('<ul class="auto clearfix"><li class="remarks">備考</li><li class="remarks">' + order.remarks + '</li></ul>');
    $('#fw080101 .remarks_area').show();
  } else {
    $('#fw080101 .remarks_area').hide();
  }
  for (var sind in order.schedule) {
    $('<ul>'
      +'<li>第'+ (parseInt(sind) + 1) +'回</li>'
      +'<li>'+ formatData(order.schedule[sind].date) + '　(' + order.dayofweek+ '）　' + order.timesofday + '</li>'
      +'</ul>').appendTo('#fw080101 .schedules');
  }

  // フローティングでクラス詳細画面を表示する
  var floatingWindow = $('#fw080101');

  showFloatingWindow(floatingWindow);
  resizeFloatingWindow(floatingWindow);
}

/* 派遣区分情報画面 フローティングを開く */
function openFloatingStudent(record) {
    // TODO データの展開

    var floatingWindow = $('#080103');

    showFloatingWindow(floatingWindow);
    resizeFloatingWindow(floatingWindow);
}

/* 派遣区分入力画面 フローティングを開く */
function openFloatingHekenkubunEdit(record) {
    var responsible_part = record.responsible_party;
    var billing = record.billing;

    $(".floating_window_background #haken_kubun_name").val(record.haken_kubun_name);
    // 派遣責任者情報
    $(".floating_window_background #responsible_party .company_name").val(responsible_part.company_name);
    $(".floating_window_background #responsible_party .zipcode").val(responsible_part.zipcode);
    $(".floating_window_background #responsible_party .todofuken").val(responsible_part.todofuken);
    $(".floating_window_background #responsible_party .address1").val(responsible_part.address);
    $(".floating_window_background #responsible_party .tel").val(responsible_part.tel);
    $(".floating_window_background #responsible_party .last_name").val(responsible_part.last_name);
    $(".floating_window_background #responsible_party .first_name").val(responsible_part.first_name);
    $(".floating_window_background #responsible_party .email").val(responsible_part.email);
    $(".floating_window_background #responsible_party .department").val(responsible_part.department);
    $(".floating_window_background #responsible_party .position").val(responsible_part.position);
    // 請求先情報
    $(".floating_window_background #billing .billing_name").val(billing.billing_name);
    $(".floating_window_background #billing .zipcode").val(billing.zipcode);
    $(".floating_window_background #billing .address1").val(billing.address1);
    $(".floating_window_background #billing .address2").val(billing.address2);
    $(".floating_window_background #billing .company_name").val(billing.company_name);
    $(".floating_window_background #billing .department").val(billing.department);
    $(".floating_window_background #billing .last_name").val(billing.last_name);
    $(".floating_window_background #billing .first_name").val(billing.first_name);
    $(".floating_window_background #billing .tel").val(billing.tel);

    var floatingWindow = $('.floating_window_background');

    showFloatingWindow(floatingWindow);
    resizeFloatingWindow(floatingWindow);
}

/* 派遣区分情報画面 フローティングを開く */
function openFloatingHekenkubun(record) {
    var responsible_part = record.responsible_party;
    var billing = record.billing;

    // TODO モックjson用
    var todofuken = responsible_part.todofuken;
    if (todofuken ="13") {
      todofuken = "東京都"
    } else {
      todofuken = "大阪府"
    }
    // 派遣責任者情報
    var responsible_party = record.responsible_party;
    $("#fw080102 #responsible_party .company_name").text(responsible_party.company_name);
    $("#fw080102 #responsible_party .zipcode").text(responsible_party.zipcode);
    $("#fw080102 #responsible_party .todofuken").text(todofuken);
    $("#fw080102 #responsible_party .address1").text(responsible_party.address);
    $("#fw080102 #responsible_party .tel").text(responsible_party.tel);
    $("#fw080102 #responsible_party .last_name").text(responsible_party.last_name);
    $("#fw080102 #responsible_party .first_name").text(responsible_party.first_name);
    $("#fw080102 #responsible_party .email").text(responsible_party.email);
    $("#fw080102 #responsible_party .department").text(responsible_party.department);
    $("#fw080102 #responsible_party .position").text(responsible_party.position);
    // 請求先情報
    var billing = record.billing;
    $("#fw080102 #billing .billing_name").text(billing.billing_name);
    $("#fw080102 #billing .zipcode").text(billing.zipcode);
    $("#fw080102 #billing .address1").text(billing.address1);
    $("#fw080102 #billing .address2").text(billing.address2);
    $("#fw080102 #billing .company_name").text(billing.company_name);
    $("#fw080102 #billing .department").text(billing.department);
    $("#fw080102 #billing .last_name").text(billing.last_name);
    $("#fw080102 #billing .first_name").text(billing.first_name);
    $("#fw080102 #billing .tel").text(billing.tel);

    var floatingWindow = $('#fw080102');

    showFloatingWindow(floatingWindow);
    resizeFloatingWindow(floatingWindow);
}

/* 講評情報画面 フローティングを開く */
function openFloatingReview(record) {

    $(".floating_window_background #period").text(record.period);
    $(".floating_window_background #program").text(data.program);
    $(".floating_window_background #subject").text(data.subject);
    $(".floating_window_background #school").text(record.school);
    $(".floating_window_background #class").text(record.class);
    $(".floating_window_background #student").text(record.student);
    $(".floating_window_background #completion").text(record.completion);
    $(".floating_window_background #result").text(record.result);
    $(".floating_window_background #review").text(record.review);
    $(".auto li:first-child").height($(".item.auto li:last-child"));

    var floatingWindow = $('.floating_window_background');

    showFloatingWindow(floatingWindow);
    resizeFloatingWindow(floatingWindow);
}

/* <共通>フローティングを開く */
function showFloatingWindow(floatingWindow) {
  current_scrollY = $( window ).scrollTop();
  marginLR = $(window).width() - $('#wrapper').outerWidth();
  $( '#wrapper' ).css( {
    position: 'fixed',
    left: marginLR / 2,
    top: -1 * current_scrollY
  } );
  floatingWindow.width($(window).width());
  floatingWindow.show('fade', '', slideDwonSpeed);
  floatingWindow.find('.floating_window').width( 800 );
  resizeRow();
}

/* <共通>フローティングのサイズ調整 */
function resizeFloatingWindow(floatingWindow) {
  var settings_height = $(window).height() - floatingWindow.find('.floating_window').css('margin-top').replace('px', '') * 2 - floatingWindow.find('.window_bar').height();
  if (floatingWindow.find('.data_area').children().height() > settings_height) {
    floatingWindow.find('.data_area').height( settings_height );
    floatingWindow.find('.data_area').css('overflow', 'auto');
    floatingWindow.find('.floating_window').width(floatingWindow.find('.floating_window').width() + 18);
  }
}

$(function() {

  $(".floating_window_background .window_close").click(function() {
    closeFloating($(this).parents('.floating_window_background'));
  });

});

/*
 * フローティングを閉じる
 */
function closeFloating(floatingWindow) {
  $( '#wrapper' ).attr( { style: '' } );
  $( 'html, body' ).prop( { scrollTop: current_scrollY } );
  floatingWindow.hide('fade', '', slideDwonSpeed);
}

function hideModal(id_btn){
  $(id_btn).parents('.floating_window_background').hide();
}
