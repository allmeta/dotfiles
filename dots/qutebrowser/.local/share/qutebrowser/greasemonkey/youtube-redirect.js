// ==UserScript==
// @name youtube redirect
// @match *://www.youtube.com/watch*
// @run-at document-start
// ==/UserScript==

let l='https://yt.didw.to/watch'+window.location.search
window.location.replace(l)
