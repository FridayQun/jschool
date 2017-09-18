'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

;(function () {
  var AppBase = function () {
    function AppBase() {
      _classCallCheck(this, AppBase);

      this.telReg = /^0{0,1}(13[0-9]|15[0-9]|18[0-9]|14[0-9]|17[0-9])[0-9]{8}$/;
      this.screenFit();
    }

    _createClass(AppBase, [{
      key: 'preloadImg',
      value: function preloadImg(args) {
        if (args.imgList && args.imgList instanceof Array) {
          var count = 0;
          var total = args.imgList.length;
          var loadedList = [];
          var update = function update() {
            count++;
            args.progress && args.progress((count * 100 / total).toFixed());
            count === total && args.complete && args.complete(loadedList);
          };
          args.imgList.forEach(function (item, index) {
            loadedList[index] = new Image();
            loadedList[index].src = item;
            loadedList[index].onload = update;
            loadedList[index].onerror = update;
          });
        } else {
          window.console && console.warn && console.warn('请传入正确的参数! ->Object');
        }
      }
    }, {
      key: 'music',
      value: function music(opts) {
        if (opts && opts instanceof Object && opts.url) {
          var musicNode = document.createElement('div');
          var audioNode = document.createElement('audio');
          musicNode.className = opts.autoplay ? 'music' : 'music mute';
          audioNode.setAttribute('src', opts.url);
          opts.autoplay && !this.wechat() && audioNode.setAttribute('autoplay', 'autoplay');
          opts.loop && audioNode.setAttribute('loop', 'loop');
          audioNode.setAttribute('preload', 'auto');
          musicNode.appendChild(audioNode);
          document.body.appendChild(musicNode);
          if (opts.autoplay && this.wechat()) {
            document.addEventListener("WeixinJSBridgeReady", function () {
              audioNode.play();
              musicNode.classList.remove('mute');
            }, false);
          }
          var handleEvent = function handleEvent() {
            if (audioNode.paused) {
              audioNode.play();
              musicNode.classList.remove('mute');
            } else {
              audioNode.pause();
              musicNode.classList.add('mute');
            }
          };
          musicNode.addEventListener('ontouchstart' in window && !this.chromeDesktop() ? "touchend" : "click", handleEvent, false);
        } else {
          window.console && console.warn && console.warn('请传入正确的参数! ->Object');
        }
      }
    }, {
      key: 'screenFit',
      value: function screenFit() {
        var windowWidth = window.innerWidth;
        var windowHeight = window.innerHeight;
        var body = document.querySelector('body');
        if (windowWidth > 640) {
          body.style.height = windowHeight + 'px';
          body.style.width = windowHeight * 320 / 504 + 'px';
        } else {
          body.style.height = windowHeight + 'px';
        }
      }
    }, {
      key: 'dialog',
      value: function dialog(args) {
        if (args && args instanceof Object) {
          var message = args.message || '弹窗内容，告知当前状态、信息和解决方法，描述文字尽量控制在三行内';
          var osType = this.os();
          var dialogNode = document.createElement('div');
          dialogNode.className = 'dialog';
          if (args.title) {
            dialogNode.className = 'dialog confirm ' + osType;
            dialogNode.innerHTML = '<div class="dialog-body"><div class="dialog-title">' + args.title + '</div><div class="dialog-message">' + message + '</div><div class="dialog-btn-bar "><button class="dialog-default-btn" type="button">取消</button><button class="dialog-primary-btn" type="button">确定</button></div></div>';
          } else {
            dialogNode.className = 'dialog alert ' + osType;
            dialogNode.innerHTML = '<div class="dialog-body"><div class="dialog-message">' + message + '</div><div class="dialog-btn-bar "><button class="dialog-primary-btn" type="button">确定</button></div></div>';
          }
          document.body.appendChild(dialogNode);
          var dialog = document.querySelector(".dialog");
          var defaultBtn = document.querySelector(".dialog-default-btn");
          var primaryBtn = document.querySelector(".dialog-primary-btn");
          defaultBtn && defaultBtn.addEventListener('ontouchstart' in window && !this.chromeDesktop() ? "touchend" : "click", function (e) {
            e.stopPropagation();
            e.preventDefault();
            document.body.removeChild(dialog);
            args.cancel && args.cancel();
          }, false);
          primaryBtn && primaryBtn.addEventListener('ontouchstart' in window && !this.chromeDesktop() ? "touchend" : "click", function (e) {
            e.stopPropagation();
            e.preventDefault();
            document.body.removeChild(dialog);
            args.ok && args.ok();
          }, false);
        } else {
          window.console && console.warn && console.warn('请传入正确的参数! ->Object');
        }
      }
    }, {
      key: 'wechat',
      value: function wechat() {
        return navigator.userAgent.toLowerCase().match(/MicroMessenger/i) == "micromessenger";
      }
    }, {
      key: 'chromeDesktop',
      value: function chromeDesktop() {
        var agent = navigator.userAgent.toLowerCase();
        var isChromeDesktop = agent.indexOf('chrome') > -1 && (agent.indexOf('windows') > -1 || agent.indexOf('macintosh') > -1 || agent.indexOf('linux') > -1) && agent.indexOf('mobile') < 0 && agent.indexOf('android') < 0;
        return isChromeDesktop;
      }
    }, {
      key: 'os',
      value: function os() {
        return (/Android/gi.test(navigator.userAgent) ? 'android' : 'ios'
        );
      }
    }]);

    return AppBase;
  }();

  window.AppBase || (window.AppBase = AppBase);
})();
var JKApp = new AppBase();