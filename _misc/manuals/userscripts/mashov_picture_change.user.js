// ==UserScript==
// @name          Mashove Picture Change
// @description   Change the ugly user picture in web.mashov.info
// @copyright     yardnsm
// @author        yardnsm
// @version       1.0

// @include       http://web.mashov.info/*
// @include       https://web.mashov.info/*
// @include       http://www.web.mashov.info/*
// @include       https://ww.web.mashov.info/*
// ==/UserScript==

setInterval(function() {
  var img = document.getElementsByClassName('img-thumbnail')[0];
  img.src = 'data:image/jpeg;base64,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';
}, 100);
