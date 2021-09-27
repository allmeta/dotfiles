// ==UserScript==
// @name erome extract
// @match *://www.erome.com/a*
// @run-at document-start
// ==/UserScript==

window.addEventListener("load",()=>{
  console.log("loaded")
  Array.from(document.querySelectorAll("video source")).forEach(x=>{
    let a=document.createElement("a")
    a.href=x.src
    a.innerHTML="Video link"
    x.parentNode.parentNode.parentNode.appendChild(a)
  })
})
