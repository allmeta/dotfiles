// ==UserScript==
// @name camvid extract
// @match *://www.camvideos.tv/*
// @run-at document-start
// ==/UserScript==

window.addEventListener("load",()=>{
  console.log("loaded")
  Array.from(document.querySelectorAll("video")).forEach(x=>{
    let a=document.createElement("a")
    a.href=x.src
    a.innerHTML="VIDEO LINK"
    document.querySelector('.player').parentNode.appendChild(a)
  })
})
