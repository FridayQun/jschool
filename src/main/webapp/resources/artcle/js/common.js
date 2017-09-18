'use strict';

(function () {
  //设置微信二维码
  function setWeChat(el, url) {
    el.css('position', 'relative').hover(function () {
      $(this).append('<div class="wechat-qrcode"><img src="' + url + '" alt="" /></div>');
    }, function () {
      $(this).find('.wechat-qrcode').remove();
    });
  }
  setWeChat($('.wq'), 'images/wechat-qrcode.png');
})();