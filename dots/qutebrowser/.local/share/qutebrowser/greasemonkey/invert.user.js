// ==UserScript==
// @name flash
// @run-at document-body
// @include *
// ==/UserScript==

let sheet = document.styleSheets[0]
sheet.insertRule('html {background: white}',sheet.cssRules.length)
