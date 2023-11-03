// ==UserScript==
// @name         New Userscript
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @match        http*://*/*
// @icon         data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==
// @grant        none
// ==/UserScript==

(function() {
  'use strict';

  function getHyperlinkTarget(event) {
    const eventTarget = (event.target || event.srcElement); // .srcElement is for older IE
    if (eventTarget.tagName === 'A') {
      return eventTarget;
    } else {
      return eventTarget.closest('a');
    }
  }

  function getTargetHref(target) {
    const href = target?.getAttribute('href');
    if (href && !href.match(/^tel:/)) { return href; }
  }

  function handleClick(e, hrefHandler) {
    const event = e || window.event; // window.event is for older IE
    const target = getHyperlinkTarget(event);
    const targetHref = getTargetHref(target);

    if (targetHref) {
      event.stopPropagation();
      event.preventDefault();
      hrefHandler(targetHref);
    }
  }

  function hijackHyperlinks(hrefHandler) {
    document.addEventListener('click', (event) => {
      handleClick(event, hrefHandler);
    });
  }

  hijackHyperlinks((href) => {
    console.log(href)
  })
})();
