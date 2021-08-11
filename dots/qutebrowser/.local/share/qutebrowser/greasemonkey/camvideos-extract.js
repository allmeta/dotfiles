// ==UserScript==
// @name camvid extract
// @match *://www.camvideos.tv/*
// @run-at document-start
// ==/UserScript==

window.addEventListener("DOMContentLoaded",()=>{
  Array.from(document.querySelectorAll("video")).forEach(x=>{
    let a=document.createElement("a")
    a.href=x.src
    a.innerHTML="VIDEO LINK"
    document.querySelector('.player').parentNode.appendChild(a)
  })
})
