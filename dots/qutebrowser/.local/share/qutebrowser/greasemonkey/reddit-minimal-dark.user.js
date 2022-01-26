// ==UserScript==
// @name          Reddit Minimal Dark
// @namespace     http://userstyles.org
// @description	  Simple flat dark grey theme for Reddit. <br>
// @author        quodroc
// @homepage      https://userstyles.org/styles/129171
// @include       http://reddit.com/*
// @include       https://reddit.com/*
// @include       http://*.reddit.com/*
// @include       https://*.reddit.com/*
// @run-at        document-start
// @version       0.20181013223425
// ==/UserScript==
(function() {var css = [
	"/* Hide subreddits top bar */",
	"",
	".sr-list > .separator,",
	".sr-list > .separator + .sr-bar,",
	"#sr-more-link {",
	"	display: none !important;",
	"}",
	"#sr-header-area {",
	"	height: 0 !important;",
	"}",
	".sr-bar,",
	".dropdown.srdrop {",
	"	float: right !important;",
	"	margin-left: 1em;",
	"}",
	"/* Hide annoying stuff */",
	".give-gold-button,",
	".goldvertisement,",
	".embed-comment,",
	".nub {",
	"	display: none !important;",
	"}",
	"/* Reset */",
	"*, *:before, *:after {",
	"	background-color: transparent !important;",
	"	border: none !important;",
	"	color: #777 !important;",
	"}",
	"/* Default links */",
	"a {",
	"	color: #48b !important;",
	"}",
	"a:visited {",
	"	color: #369 !important;",
	"}",
	"a:hover {",
	"	color: #5ad !important;",
	"}",
	"/* Background */",
	"html,",
	"body,",
	"#sr-more-link {",
	"	background-color: #222 !important;",
	"}",
	"/* Top bar */",
	"#header-img,",
	"#mail,",
	".sidebox.create .spacer a {",
	"	filter: invert(80%) hue-rotate(180deg) !important;",
	"}",
	".drop-choices,",
	".hover-bubble,",
	".modal-dialog {",
	"	background: #111 !important;",
	"}",
	".tabmenu .selected a {",
	"	color: #999 !important;",
	"}",
	"/* Side bar */",
	".listing-chooser-collapsed .grippy {",
	"	width: 1px !important;",
	"}",
	".listing-chooser-collapsed .listing-chooser {",
	"	padding-right: 1px !important;",
	"}",
	".listing-chooser li.selected {",
	"	box-shadow: none !important;",
	"}",
	".grippy:after {",
	"	display: none !important;",
	"}",
	"/* Inputs and buttons */",
	"input,",
	"textarea,",
	".linkinfo .shortlink input,",
	".new-comment .usertext-body,",
	".morelink a,",
	".morelink:hover a,",
	".fancy-toggle-button a,",
	".usertext button {",
	"	background: #333 !important;",
	"	color: #999 !important;",
	"	font-weight: normal !important;",
	"}",
	"/* Listing */",
	".thing .title {",
	"	color: #aaa !important;",
	"}",
	".title:visited {",
	"	color: #777 !important;",
	"}",
	".thing .title:hover {",
	"	color: #ccc !important;",
	"}",
	".arrow {",
	"	filter: brightness(45%);",
	"}",
	".arrow.upmod,",
	".arrow.downmod {",
	"	filter: brightness(50%) contrast(120%);",
	"}",
	".link .score.likes {",
	"	color: #b3684d !important;",
	"}",
	".link .score.dislikes {",
	"	color: #7070c2 !important;",
	"}",
	".expando-button {",
	"	filter: brightness(45%) contrast(180%);",
	"	background-color: transparent !important;",
	"}",
	".moderator,",
	".green {",
	"	color: #3a3 !important;",
	"}",
	".admin,",
	".nsfw-stamp * {",
	"	color: #a66 !important;",
	"}",
	".pagename a,",
	".trophy-name {",
	"	color: #999 !important;",
	"}",
	".buttons li {",
	"	padding: 0 !important;",
	"}",
	".buttons a {",
	"	margin-right: 8px !important;",
	"	color: #888 !important;",
	"}",
	".buttons a:visited {",
	"	color: #666 !important;",
	"}",
	".buttons a:hover {",
	"	color: #aaa !important;",
	"}",
	".pagename,",
	".tabmenu li,",
	".link .midcol,",
	".buttons a,",
	".subreddit {",
	"	font-weight: normal !important;",
	"}",
	".search-expando.collapsed:before,",
	".comment-fade {",
	"	display: none !important;",
	"}",
	".recommended-link {",
	"	border-color: #333 !important;",
	"}",
	"/* Comments */",
	".link .usertext .md,",
	"blockquote,",
	"pre,",
	"code,",
	".gold-accent {",
	"	background-color: #111 !important;",
	"}",
	".md blockquote {",
	"	border-left: solid 4px #333 !important;",
	"}",
	".md td {",
	"	border: solid 1px #333 !important;",
	"}",
	"hr {",
	"	border-bottom: solid 1px #333 !important;",
	"}",
	".comment .author,",
	".morecomments a {",
	"	font-weight: normal !important;",
	"}",
	"/* RES */",
	".guider,",
	".guiders_button,",
	".res-fancy-toggle-button,",
	"#RESConsoleContainer,",
	"#RESShortcutsAddFormContainer {",
	"	background: #222 !important;",
	"}",
	".RESDialogSmall,",
	".RESDropdownOptions,",
	".RESNotification,",
	"#alert_message {",
	"	background: #111 !important;",
	"}",
	".RES-keyNav-activeElement,",
	".RES-keyNav-activeElement .md-container {",
	"	background: #333 !important;",
	"}",
	".res-nightmode .arrow {",
	"	filter: none !important;",
	"}",
	"/* new.reddit.com */",
	"#header,",
	"#lightbox,",
	"#hamburgers,",
	"#overlayScrollContainer,",
	"#SHORTCUT_FOCUSABLE_DIV > div:first-child,",
	"header,",
	"div[data-redditstyle],",
	"body > div,",
	"div[style^=\"left:\"]",
	"div[role=\"button\"] {",
	"	background-color: #222 !important;",
	"}",
	"#header svg {",
	"	filter: invert(90%) hue-rotate(180deg);",
	"}",
	"div[contenteditable=\"true\"] {",
	"	background: #333 !important;",
	"}",
	"#overlayFixedContent + div {",
	"	background: rgba(0, 0, 0, 0.7) !important;",
	"}",
	"div[data-slot] {",
	"	display: none !important;",
	"}",
	".icon, .icon:before {",
	"	color: inherit !important;",
	"}",
	"a[data-click-id=\"timestamp\"] {",
	"	color: #777 !important;",
	"}",
	"a[data-click-id=\"body\"] h2 {",
	"	color: #aaa !important;",
	"}",
	"a[data-click-id=\"body\"]:visited h2 {",
	"	color: #777 !important;",
	"}",
	".scrollerItem {",
	"	box-shadow: none !important;",
	"}"
].join("\n");
if (typeof GM_addStyle != "undefined") {
	GM_addStyle(css);
} else if (typeof PRO_addStyle != "undefined") {
	PRO_addStyle(css);
} else if (typeof addStyle != "undefined") {
	addStyle(css);
} else {
	var node = document.createElement("style");
	node.type = "text/css";
	node.appendChild(document.createTextNode(css));
	var heads = document.getElementsByTagName("head");
	if (heads.length > 0) {
		heads[0].appendChild(node);
	} else {
		// no head yet, stick it whereever
		document.documentElement.appendChild(node);
	}
}
})();
