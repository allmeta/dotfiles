// ==UserScript==
// @name          SoundCloud - Quite Dark
// @namespace     http://userstyles.org
// @description	  Quite dark style for the SoundCloud
// @author        pawelos076232
// @homepage      https://userstyles.org/styles/143738
// @run-at        document-start
// @version       0.20220122144813
// ==/UserScript==
(function() {var css = "";
if (false || (new RegExp("^http(s)?://(|www.)?soundcloud.(com|app.goo.gl)/((?!jobs|settings/connections).*)$")).test(document.location.href))
	css += [
		"/*!",
		"|| Name: SoundCloud - Quite Dark ||",
		"|| Author: pawelos076232         ||",
		"|| License: No Redistribution    ||",
		"|| Version: 1.6.9                ||",
		"  */.l-footer:after{white-space:pre;content:\"\\A\\ASoundCloud - Quite Dark v1.6.9 \\A style by pawelos076232\"}html[lang=\"pl\"] .l-footer:after{content:\"\\A\\AU\\017Cywasz styl SoundCloud - Quite Dark v1.6.9 \\A stworzony z mi\\0142\\o\\015B ci\\0105  \\2764\\ przez pawelos076232\" !important}body.sc-classic{background:#0a0a0a url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAABNgAAABkCAAAAABxmtK9AAABFElEQVR42u3UMREAAAgDMSoB/2argZVLJPzw2QH4JcYGGBuAsQEYG4CxARgbYGwAxgZgbADGBmBsgLEBGBuAsQEYG4CxAcYGYGwAxgZgbADGBmBsgLEBGBuAsQEYG4CxAcYGYGwAxgZgbADGBhgbgLEBGBuAsQEYG2BsAMYGYGwAxgZgbADGBhgbgLEBGBuAsQEYG2BsAMYGYGwAxgZgbICxARgbgLEBGBuAsQHGBmBsAMYGYGwAxgZgbICxARgbgLEBGBuAsQHGBmBsAMYGYGwAxgYYG4CxARgbgLEBGBtgbBoAxgZgbADGBmBsAMYGGBuAsQEYG4CxARgbYGwAxgZgbADGBmBsgLEBGBuAsQEYG8BdAY8JBwnfLuOyAAAAAElFTkSuQmCC) repeat-y 50% 0}@media(max-width:959px){body.sc-classic{background:#111}}.header__logo{background:transparent}.sc-classic .searchTitle{background-color:#111}.frontMobileTeaser,.sidebarInfoBox,.sc-classic .banner.m-creatorPromotion,.sc-classic .banner.m-promotion,.keyboardShortcuts__shortcutsGroup>dl>dt>kbd>kbd{background:#0a0a0a}.sc-background-dark{background-color:#1a1a1a}.sc-classic .header{background:#030303}.g-dark-bg,.g-dark-list,.unreadConversations,.profileMenu__list{background-color:#222}.sc-classic .headerMenu.m-light{background-color:#111;border-color:#333}.sc-classic .m-light .headerMenu__link:focus,.sc-classic .m-light .headerMenu__link:hover{background-color:#0a0a0a}.sc-classic .m-light .headerMenu__link,.sc-classic .m-light .headerMenu__link:focus,.sc-classic .m-light .headerMenu__link:hover{color:#ccc}.sc-classic .m-light a[class*=\"profileMenu__\"]:after{filter:invert(1)}.sc-classic .m-light .headerMenu__list{border-color:#1c1c1c}.sc-classic .dropdownContent__container{background-color:#111;border-color:#333}.sc-classic .dropdownContent__listItem,.sc-classic .dropdownContent__header,.sc-classic .dropdownContent__main{border-bottom-color:#1c1c1c}.sc-classic .notificationBadge__link:focus,.sc-classic .notificationBadge__link:focus:after{border-color:#333}.sc-classic .notificationBadge__main{color:#999}.sc-classic .notificationBadge--unread{background-color:#070707}.sc-classic .activitiesListFull__item+.activitiesListFull__item{border-top-color:#333}.header__navMenu>li>a.selected,.header>li>a:focus,.userNav__item.selected,.userNav__button.selected,.header__navMenu>li>a.header__moreButton.selected{background-color:#222}.sc-classic .g-tabs-link,.sc-classic .g-tabs-link:visited{color:#ccc}.sc-classic .g-tabs-link:hover,.sc-classic .g-tabs-link:focus{color:#ccc;border-color:#ccc}body,textarea,select,button,input,.sc-text,a:hover,a.sc-ministats:hover,a.sc-link-dark,a.sc-link-light:hover,.sc-buylink,.sc-buylink:visited,.sc-classic .commentPopover.darkText .commentPopover__body,.moreActions__group .moreActions__link,.sc-classic .blockCheckbox__title,.sc-classic .truncatedAudioInfo__collapse:focus,.statsBadge__upsell-text>span,.localeSelector__body,.localeSelectorContent__link:hover,.sc-button-nostyle,.sc-classic .commentBadge:hover .commentBadge__title a{color:#ccc}a.sc-link-dark:hover,a.sc-link-medium:hover,.sc-buylink:hover,.sc-classic .insightsSidebarModule__title,.sc-classic ._10BTeIqCrlRC9qFdVckf7v:hover,.sc-classic ._1PFHeR8bDiS4o1IWHAwVDu:disabled{color:white}.sc-background-light{background-color:#0a0a0a}.dashbox__box{border-color:#1a1a1a}.dashbox__box,.dashbox__box:hover,.dashbox__box:focus,.dashbox__box:visited{color:#ccc}.loading:not(.dark){filter:invert(1) !important}.emptyNetworkPage__image,.noConversations__image,.personalRecommended__empty{filter:invert(0.93)}.sc-classic .truncatedUserDescription.m-overflow.m-collapsed .truncatedUserDescription__wrapper::after{background:#111;background:linear-gradient(rgba(17,17,17,0),#111)}.sc-classic .readMoreTile__countWrapper{background-color:#111}.sc-classic .audibleTilePlaceholder:before,.sc-classic .collection.m-overview .collection__section:not(:last-child){border-color:#333}.l-signin .l-main{border-color:#1a1a1a}.sc-button-google:before{background-color:#111}.waveform__emptyMessage{color:white;text-shadow:1px 1px 1px #111}.g-geoblocked-icon:before{filter:invert(1)}.sc-classic .profileUploadFooter{background-color:#111}.uploadTarget__frame{background:#111}.uploadedTarget__messageHighlight{color:#ccc}a.compactTrackList__moreLink:focus{outline-color:#333}.sc-classic .artistShortcutTile__badge{border-color:#111}.dropbar__content,.sc-classic .listenContent__inner{background-color:#111}.sc-classic .compactTrackListItem.clickToPlay.active,.sc-classic .compactTrackListItem.clickToPlay:hover,.sc-classic .compactTrackListItem.clickToPlay:focus,.sc-classic .compactTrackList__moreLink:hover,.sc-classic .compactTrackList__moreLink:focus,.sc-classic .trackItem.hover,.sc-classic .trackItem.active,.chartTrack.m-interactive:hover,.chartTrack.m-playing,.listenLogin{background-color:#0a0a0a}.sc-classic .compactTrackListItem.clickToPlay.active .compactTrackListItem__additional,.sc-classic .compactTrackListItem.clickToPlay:focus .compactTrackListItem__additional,.sc-classic .compactTrackListItem.clickToPlay:hover .compactTrackListItem__additional,.sc-classic .trackItem:not(.m-disabled).hover .trackItem__additional,.sc-classic .trackItem:not(.m-disabled).active .trackItem__additional{background:#0a0a0a;background:linear-gradient(to right,rgba(13,13,13,0.1),#0a0a0a 17px)}.sc-classic .createPlaylistSuggestion__addContainer{background:linear-gradient(to right,rgba(17,17,17,0.1),#111 20px)}.sc-classic .truncatedAudioInfo.m-overflow.m-collapsed .truncatedAudioInfo__wrapper::after{background:#111;background:linear-gradient(rgba(17,17,17,0),rgba(17,17,17,0.5) 90%,#111)}.sc-classic .sc-snippet-badge-grey{border-color:#333}.sc-classic .backgroundGradient__buffer{filter:brightness(0.26)}.sc-classic .soundBadge__additional{background:#111;background:linear-gradient(to right,rgba(17,17,17,0.1),#111 17px)}.sc-classic .soundBadge.playlist .soundBadge__artwork{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD4AAAA+CAQAAADZyGDPAAAACXBIWXMAAAsTAAALEwEAmpwYAAAFEWlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNi4wLWMwMDIgNzkuMTY0NDYwLCAyMDIwLzA1LzEyLTE2OjA0OjE3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDIxLTA3LTEwVDIzOjEwOjAzKzAyOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAyMS0wNy0xMFQyMzoxMDo0NiswMjowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAyMS0wNy0xMFQyMzoxMDo0NiswMjowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjEiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJEb3QgR2FpbiAyMCUiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NWYzZWQ2ZWMtYTg4NS0wNzRlLWFl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)}.sc-classic .image__whiteOutline .image__full{border-color:#111}.sc-classic .l-footer.standard,.sc-classic .l-fixed-top-one-column>.l-top,.sc-classic .sound__soundActions{background:#111 !important;}.sc-classic .sc-buylink-itunes:before,.sc-classic .license__icon{filter:invert(1)}.sc-classic .repostOverlay__container{background-color:#111;border-color:#1a1a1a}.sc-classic .repostOverlay__container:not(.repostOverlay--uiEvo) .repostOverlay__youReposted{color:#ccc}.sc-classic .sc-ministats-small.sc-ministats-reposts.repostOverlay__messageRepostIcon:before{filter:invert(1)}.sc-classic .listenEngagement{border-color:#111 !important;box-shadow:0 1px 0 0 #1c1c1c}.sc-classic .commentForm__wrapper{background:#0a0a0a !important;border-color:#1a1a1a}.sc-classic .commentForm__input{background:#111 !important;border-color:#1a1a1a !important}.sc-classic .commentForm.m-active .commentForm__wrapper{background:#000;border-color:#222}.sc-classic .commentItem.m-creatorComment,.sc-classic .commentFormDisabled{background-color:#0a0a0a}.commentForm.m-small.m-active .commentForm__input{border-color:#222 !important}.compact__bubble{background-color:#111}.compact__bubble:before{border-top-color:#111}.playbackTimeline__progressBackground{background-color:#333}.volume.expanded .volume__sliderWrapper{border-color:#333}.volume__sliderWrapper:before{border-color:transparent transparent #333 #333}.volume__sliderWrapper:after{border-color:transparent transparent #0a0a0a #0a0a0a}.queue{box-shadow:0 0 4px rgba(100,100,100,0.25)}.queue,.queue__itemWrapper{background-color:#111}.queueItemView:hover,.queueItemView.m-active{background:#070707}.queueItemView:hover.m-active{background:#0a0a0a}.queue__panel{border-bottom-color:#1a1a1a}.queue__hide:focus,.queue__hide:hover,.queue__hide{background-color:transparent !important;filter:invert(0.85)}.queueItemView__more.sc-button-small.sc-button-more:before{filter:invert(0.85)}.queueFallback__stationMode{border-top-color:#1a1a1a}.queue__itemsHeight{background-image:none !important}.sc-classic .removeFromNextUp,.sc-classic .removeFromNextUp:hover{background-image:url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0naHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmcnIHdpZHRoPScyNCcgaGVpZ2h0PScyNCcgdmlld0JveD0nMCAwIDI0IDI0Jz48cGF0aCBmaWxsPScjZmZmJyBmaWxsLXJ1bGU9J25vbnplcm8nIGQ9J00xNS41IDkuMjA1bC0uNzA1LS43MDVMMTIgMTEuMjk1IDkuMjA1IDguNWwtLjcwNS43MDVMMTEuMjk1IDEyIDguNSAxNC43OTVsLjcwNS43MDVMMTIgMTIuNzA1bDIuNzk1IDIuNzk1LjcwNS0uNzA1TDEyLjcwNSAxMnonLz48L3N2Zz4=)}button.sc-button-like.queueItemView__like.sc-button.sc-button-small.sc-button-icon.sc-button-nostyle:not(.sc-button-selected):before{filter:invert(1)}.playControls__inner,.playControls__bg{background-color:#0a0a0a;border-top-color:#2b2b2b}.skipControl__previous,.playControl,.playControl.playing,.skipControl__next,.volume__button,.sc-ministats-small.sc-ministats-sounds:before,.shuffleControl::before,.repeatControl.m-none,.playbackSoundBadge:not(.m-queueVisible) .playbackSoundBadge__showQueue,.sc-classic .playControls__castControl>button{filter:invert(0.85)}.volume__sliderWrapper{background-color:#0a0a0a}.sc-toggle{border-color:#1a1a1a;background:#1a1a1a}.sc-toggle-handle{background:#111}.sc-classic .playbackTimeline__duration,.sc-classic .compactTrackListItem__content,.sc-classic .compactTrackListItem__number,.sc-classic .compactTrackListItem__trackTitle,.sc-classic .queueItemView__title{color:#ccc}.playbackSoundBadge__titleLink:hover,.playbackSoundBadge__titleLink:focus,a.playbackSoundBadge__lightLink:hover,a.playbackSoundBadge__lightLink:focus{color:white}.g-dark textarea,.g-dark select,.g-dark input[type=\"text\"],.g-dark input[type=\"password\"],.g-dark input[type=\"search\"]{color:#999;background:#1a1a1a}.g-dark input[type=\"search\"]:focus{background:#111}.frontContent__actions input[type=\"search\"],.frontContent__actions input[type=\"search\"]:focus{background:#0a0a0a}textarea,select,input{background:#111;border-color:#333}.sc-input,.sc-select{border-color:#333}.sc-radio-radio{background-color:#0a0a0a;border-color:#3d3d3d}.sc-radio-input:checked+.sc-radio-radio{box-shadow:inset 0 0 0 2px #0a0a0a}.sc-radio-input:checked:focus+.sc-radio-radio{box-shadow:inset 0 0 0 3px #0a0a0a}.sc-radio-input:disabled+.sc-radio-radio,.sc-radio:hover .sc-radio-input:disabled+.sc-radio-radio{background-color:#1a1a1a;border-color:#333}textarea:focus,select:focus,input[type=\"text\"]:focus,input[type=\"email\"]:focus,input[type=\"tel\"]:focus,input[type=\"url\"]:focus,input[type=\"date\"]:focus,input[type=\"password\"]:focus,input[type=\"search\"]:focus,.sc-classic .tokenInput.focused .tokenInput__wrapper{border-color:#4d4d4d}.sc-button:not(.sc-button-play):not(.sc-button-cta):not(.g-button-transparent-inverted):not(.sc-button-active):not(.sc-button-selected):not(.sc-button-nostyle):not(.playbackSoundBadge__like):not(.premiumContent__button):not(.premiumContent__hint):not(.sc-button-transparent):not(.hintButton){border-color:#1a1a1a;background-color:#111;color:#ccc}.sc-button-active:not(.sc-button-nostyle):not(:hover):not(.sc-button-transparent),.sc-button-selected:not(.sc-button-nostyle):not(.playbackSoundBadge__like):not(:hover):not(.sc-button-transparent){border-color:#1a1a1a;background-color:#111}.sc-button-active:hover:not(.sc-button-transparent):not(.hintButton),.sc-button-selected:hover:not(.sc-button-transparent):not(.hintButton){background-color:#111}.sc-button:hover:not(.sc-button-active):not(.sc-button-selected):not(.sc-button-follow):not(#authorize):not(.premiumButton):not(.premiumContent__button):not(.sc-button-transparent),.sc-button:focus:not(.sc-button-active):not(.sc-button-selected):not(.sc-button-follow):not(#authorize):not(.sc-button-transparent),.sc-button-focus:not(.sc-button-active):not(.sc-button-selected){color:#ccc;border-color:#333}.sc-button-small:not(.sc-button-facebook):not(.sc-button-google):not(.sc-button-selected):not(.sc-button-active):not(.sc-button-nostyle):not(.playButton):before,.sc-button-medium:not(.sc-button-facebook):not(.sc-button-google):not(.sc-button-selected):not(.sc-button-active):before,.sc-icon-large.sc-icon-check,.g-button-remove,.compactUpload__cancel,.featureHeader__closeButton{filter:invert(1)}.sc-button-selected:before,.sc-button-active:before,.sc-button-small.sc-button-play:before,.sc-button-small.sc-button-lightfg:before,.sc-button-medium.sc-button-lightfg:before{filter:none}.sc-button-lightfg.sc-button-transparent:before{filter:none !important}.sc-classic .moreActions__button,.sc-classic .moreActions__button:not(:disabled),.sc-classic .moreActions__link{background-color:#111}.sc-classic .moreActions__button:hover,.sc-classic .moreActions__button:focus:not(:disabled),.sc-classic .moreActions__button:hover:not(:disabled),.sc-classic .moreActions__link:hover,.sc-classic .moreActions__button:focus{background-color:#0a0a0a}.sc-classic .moreActions__button:not(:last-child),.sc-classic .moreActions__link{border-bottom-color:#1a1a1a}.sc-classic .moreActions{border-color:#1a1a1a;background:#111}.sc-classic .moreActions__group:not(:first-child){border-top-color:#1a1a1a}.sc-button.sc-button-translucent:not(.sc-button-cta){background-color:rgba(0,0,0,0.8)}.sc-button.sc-button-translucent:not(.sc-button-cta):hover,.sc-button.sc-button-translucent:not(.sc-button-cta):focus,.sc-button.sc-button-translucent.sc-button-active:not(.sc-button-cta){background-color:black}.textfield__clear{background:#1a1a1a}.textfield__clear:hover{background:#333}.gritter-close,.mobileApps__dismiss{filter:invert(0.93)}.sc-classic .linkMenu{box-shadow:0 1px 8px rgba(150,150,150,0.2);background-color:#111}.sc-classic .tileGallery__sliderButton:after{border-right-color:#ccc;border-top-color:#ccc}.sc-tag,.sc-tag:visited{background:#3d3d3d;border-color:#4d4d4d;color:#ddd}.sc-icon-large.sc-icon-sound-dark,.sc-icon-large.sc-icon-set-dark{filter:invert(1)}.sc-classic .sc-border-light-right,.sc-classic .ownActivity.large .ownActivity__user,.sc-classic .l-listen-wrapper .l-about-rows{border-right-color:#1c1c1c}.l-oscp>.l-sidebar,.sc-border-light-left{border-left-color:#1c1c1c}.sc-border-light-bottom,.sc-classic .g-tabs,.sc-classic .g-modal-title-h1,.sc-classic .g-form-section-head,.collection.m-overview .collection__section:not(:last-child),.sc-classic .searchTitle__text,.chartsMain_listHeader,.statsOverview__main:before,.statsOverview__top:before,.sc-border-dark-bottom,.selectionModule,.mixedSelectionModule{border-bottom-color:#1c1c1c}.sc-border-light-top,.currentPlan__noActivity,.subscriptions__noActivity{border-top-color:#1c1c1c}.paging-eof:before{filter:invert(0.935)}.tabs__heading{border-bottom-color:#1a1a1a}.chartTracksEnd{border-top-color:#1a1a1a}.sc-classic .modal__modal,.sc-classic .audibleEditForm__form,.sc-classic .tabs__tabs,.sc-classic .tabs__headingContainer,.sc-classic .tagInput__wrapper,.sc-classic .g-modal-section,.sc-classic .recipientChooser .tokenInput__wrapper,.localeSelectorContent{background:#111}.sc-classic .embedPanel__tabLink,.sc-classic .embedPanel__upsellTabLink{background-color:#1a1a1a}.sc-classic .tokenInput__wrapper,.sc-classic .composeMessage__bottomWrapper{border-color:#333}.sc-classic .modal.modalWhiteout{background-color:rgba(0,0,0,0.9)}.sc-classic .modal.modalWhiteout>.modal__closeButton{filter:invert(1)}.sc-classic .permalinkTextfield__input:disabled{color:#ccc}.sc-classic .editTrackItem__additional{background:#111;background:linear-gradient(to right,rgba(0,0,0,0.1),#111 17px)}.sc-classic .editTrackItem.m-active,.sc-classic .editTrackItem.m-hover{background-color:#0a0a0a}.sc-classic .editTrackItem.m-active .editTrackItem__additional,.sc-classic .editTrackItem.m-hover .editTrackItem__additional{background:#0a0a0a;background:linear-gradient(90deg,rgba(51,51,51,0.1),#0a0a0a 17px)}.sc-classic .tokenInput__token{background:#0a0a0a;border-color:#1a1a1a}.sc-classic .dialog,.sc-classic .dialog__arrow{border-color:#333;background:#111}.sc-classic .gritter-item-wrapper{color:#ccc;background:#111;box-shadow:0 0 4px rgba(0,0,0,0.2),inset 0 0 2px black;border-color:#333}.callout__bubble,.callout__bubble::before{background-color:#111}.callout__captionBody{color:#999}#onetrust-consent-sdk #onetrust-banner-sdk{background-color:#0c0c0c}#onetrust-consent-sdk #onetrust-banner-sdk #onetrust-pc-btn-handler.cookie-setting-link{color:white;border-color:#0c0c0c;background-color:#111}#onetrust-banner-sdk #onetrust-pc-btn-handler.cookie-setting-link{background-color:#111;border-color:#0c0c0c}#onetrust-consent-sdk #onetrust-banner-sdk #onetrust-policy #onetrust-policy-title,#onetrust-consent-sdk #onetrust-banner-sdk #onetrust-policy h3,#onetrust-consent-sdk #onetrust-banner-sdk #onetrust-policy-text,#onetrust-consent-sdk #onetrust-banner-sdk .ot-dpd-desc,#onetrust-consent-sdk #onetrust-banner-sdk .ot-b-addl-desc{color:white}#onetrust-consent-sdk #onetrust-accept-btn-handler,#onetrust-banner-sdk #onetrust-reject-all-handler{background-color:white;border-color:white;color:#111}#onetrust-consent-sdk #onetrust-banner-sdk #onetrust-accept-btn-handler,#onetrust-consent-sdk #onetrust-banner-sdk #onetrust-reject-all-handler{border-color:#0c0c0c}#onetrust-banner-sdk.ot-iab-2 #onetrust-policy-text,#onetrust-banner-sdk.ot-iab-2 :not(.ot-dpd-desc)>.ot-b-addl-desc{border-right-color:#222}iframe.ab-in-app-message.ab-html-message.ab-modal-interactions{display:none}.uploadMain__chooserContainer,.uploadMain__foot,.activeUpload__form,.activeUpload__shareContainer,.quotaMeterWrapper{background-color:#111 !important}.sc-classic .suggestedTags__listItem.selected{background-color:#0a0a0a}.sc-classic .suggestedTags{background-color:#111;border-color:#333}.sc-classic .creatorsNavigation__onSoundCloudLink{color:#333 !important;filter:invert(1)}.sc-classic .progressBar__outer{background-color:#1a1a1a}.sc-classic .blockCheckbox__icon{filter:invert(1) hue-rotate(180deg)}.sc-classic .uploadMain__title{color:#ccc}.sc-classic .uploadMain.hasActiveUploads .uploadMain__chooserContainer{border-color:#1c1c1c}.sc-classic .quotaMeter__dropdownButton:after{filter:invert(0.5)}.uploadLoggedOut__header.m-eu{background:url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMjQwIDYzIj48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6IzExMX08L3N0eWxlPjwvZGVmcz48cG9seWdvbiBjbGFzcz0iY2xzLTEiIHBvaW50cz0iMTI0MCAwIDAgNjMgMTI0MCA2MyIvPjwvc3ZnPgo=) 100% 100%/1240px 63px no-repeat,url(https://a-v2.sndcdn.com/assets/images/img-upload-hero-eu-42a9dcf5.jpg) 100% 100%/1240px 460px no-repeat}.uploadLoggedOut__testimonials{background:url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMjQwIDYzIj48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6IzExMX08L3N0eWxlPjwvZGVmcz48cGF0aCBjbGFzcz0iY2xzLTEiIGQ9Ik0wIDYzTDEyNDAgLjU5VjBMMCAuNTdWNjN6IiAvPjwvc3ZnPgo=) 0 0 no-repeat,url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAxMjQwIDYzIj48ZGVmcz48c3R5bGU+LmNscy0xe2ZpbGw6IzExMX08L3N0eWxlPjwvZGVmcz48cG9seWdvbiBjbGFzcz0iY2xzLTEiIHBvaW50cz0iMTI0MCAwIDAgNjMgMTI0MCA2MyIvPjwvc3ZnPgo=) 100% 100%/1240px 63px no-repeat,#070707}.uploadLoggedOut__testimonialListItem{background:#111}.activeUpload__hqNote{background:#0a0a0a;border-color:#4d4d4d}._1srmB4exym6W6iYDJh87lM{background-color:rgba(15,15,15,0.7)}.sc-classic .conversation__actions{background:#111;box-shadow:0 1px 0 #111}.sc-classic .spotlightResults{background-color:#111}.sc-classic .inboxItem.active,.sc-classic .inboxItem.unread,.sc-classic .inboxItem:focus,.sc-classic .inboxItem:hover,.sc-classic .inbox__item:before,.sc-classic .spotlightResults__item.selected{background-color:#0a0a0a}.sc-classic .conversation__form{border-top-color:#1a1a1a}.sc-classic .composeMessage__searchViewWrapper::after{background:rgba(17,17,17,0.8)}.sc-classic .suggestedUsers{background-color:#0a0a0a;color:#999}.sc-classic .suggestedUsers__listItem.selected{color:#ccc;background-color:#333}.sc-classic .composeTextfield .textfield__input,.sc-classic .conversationMessage__body{color:#999}.sc-classic .userAudibleSearchResults{background-color:#111}.sc-classic .userAudibleSearchResults .loading{filter:invert(1) !important}.sc-classic .userAudibleSearchResultItem{color:#999 !important}.sc-classic .userAudibleSearchResults__item.selected{background-color:#0a0a0a}.trackManager__upsellWrapper,.audibleEditForm__audio,.soundBadge__icon{background-color:#111}.soundBadge:hover:not(.compact),.soundBadge.hover:not(.compact),.soundBadge.selected:not(.compact),.soundBadge.active:not(.compact){background-color:#0a0a0a}.soundBadge:hover:not(.compact) .soundBadge__additional,.soundBadge.hover:not(.compact) .soundBadge__additional,.soundBadge.selected:not(.compact) .soundBadge__additional,.soundBadge.active:not(.compact) .soundBadge__additional{background:#0d0d0d;background:linear-gradient(to right,rgba(13,13,13,0.1),#0a0a0a 17px)}.g-upsell-container{background:#0a0a0a;border-color:#1a1a1a}.sc-button:disabled,.sc-button:disabled:hover,.sc-button-disabled,.sc-button-disabled:hover,.sc-button-disabled:focus,.sc-button.sc-pending,.sc-button.sc-pending:hover,.sc-button.sc-pending:focus{background-color:#0a0a0a;border-color:#1a1a1a}.sc-button-dropdown.sc-button-dropdown-plain:not(.sc-button-disabled):not(:disabled){border-color:#333;color:#ccc}.sc-button-dropdown.sc-button-dropdown-plain:hover:not(.sc-button-disabled):not(:disabled){border-color:#555}.sc-button-dropdown:focus:not(.sc-button-disabled):not(:disabled){box-shadow:0 0 0 4px #1a1a1a}.editTracksDropdown{background-color:#111}.editTrackModalButton:not(:disabled):hover,.editTrackModalButton:not(:disabled):focus{background-color:#0a0a0a}.sc-border-light{border-color:#1c1c1c}.stats__empty{background:#111;color:#999}.stats__pager,.ui-datepicker .ui-datepicker-prev,.ui-datepicker .ui-datepicker-next,.sc-icon-large.sc-stats-icon:not(.sc-stats-icon-play-orange):not(.sc-stats-icon-like-orange):not(.sc-stats-icon-comment-orange):not(.sc-stats-icon-repost-orange):not(.sc-stats-icon-download-orange):not(.sc-stats-icon-rss-orange){filter:invert(1)}.stats__expand{background-color:#111;box-shadow:0 -3px 6px -5px rgba(255,255,255,0.2)}.statsDateSelect{background:#111}.stats__expand:hover,.stats__expand:focus{border-color:#333}.statsBarChart__bottom{stroke:#1c1c1c}.stats__xAxis text{fill:#ccc}.statsDateSelect__calendar .ui-datepicker td a,.userStatsLegend__item.active{color:#ccc}.statsDateSelect__calendar .ui-datepicker-calendar .ui-state-disabled,.statsDateSelect__calendar .ui-datepicker-calendar .ui-state-disabled:hover{color:#5b5b5b}.statsDateSelect__calendar .ui-datepicker-current-day,.statsDateSelect__calendar td:hover{background:#171a20}.statsDateSelect__rangeTitle,.statsDateSelect__range{border-bottom-color:#171a20}.topStatsModule__item,.topStatsModule__item:last-child,.topStatsItemPlaceholder.track .topStatsItemPlaceholder__visual,.topStatsItemPlaceholder.listener .topStatsItemPlaceholder__visual,.topStatsItemPlaceholder.playlist .topStatsItemPlaceholder__visual,.topStatsItemPlaceholder.track .topStatsItemPlaceholder__visual,.topStatsItemPlaceholder.playlist .topStatsItemPlaceholder__visual:after,.topStatsItemPlaceholder.playlist .topStatsItemPlaceholder__visual:before,.sc-border-dark,.sc-border-dark-top{border-color:#1a1a1a}.topStatsItemPlaceholder__text::before,.topStatsItemPlaceholder__text::after,.topStats__wrapperEligible:hover,.topStats__wrapperEligible:focus{background-color:#0a0a0a}.topStats__wrapperEligible:focus .topStatsItemPlaceholder__text::before,.topStats__wrapperEligible:focus .topStatsItemPlaceholder__text::before,.topStats__wrapperEligible:hover .topStatsItemPlaceholder__text::before,.topStats__wrapperEligible:hover .topStatsItemPlaceholder__text::after,.dateSelectStats__datepicker .ui-datepicker-today a{background-color:#1a1a1a}.sc-background-white,.dateSelectStats__datepicker{background-color:#111}.statsOverview__separator{background-color:#0a0a0a}.statsDropbarTabs__icon.g-stats-icon:not(.g-stats-icon-orange),.topStatsItemPlaceholder.country .topStatsItemPlaceholder__visual{filter:invert(1)}.statsBarChart [data-rank=rank-0] .inactive{fill:#2a2a2a}.g-nav-item-search:not(.active)>.g-nav-link,.g-nav-item-sounds:not(.active)>.g-nav-link,.g-nav-item-people:not(.active)>.g-nav-link,.g-nav-item-sets:not(.active)>.g-nav-link{filter:invert(1)}.premiumProductInfo.m-highlighted{background-color:#0a0a0a}.premiumContent__fixedWrapper{background-color:#070707}.premiumContent__fixedBackground{background-color:#070707 !important}.premiumProductInfo{border-color:#1a1a1a}.premiumProductInfo__bestValueRibbon,.premiumProductInfo__buyButton>.sc-button{background:#111}.products__cell.price{background-color:#111}.products__cell{border-color:#333}"
	].join("\n");
if (false || (document.location.href.indexOf("https://insights-ui.soundcloud.com/") == 0))
	css += ":root{--raven:#ccc;--charcoal:#999;--ash:#666;--platinum:#ccc;--silver:#1c1c1c;--mist:#1c1c1c;--snow:#f8f8f8;--white:#111;--black:#fff;--cod:#111;--fog:hsla(0,0,5%,0.3);--smoke:rgba(0,0,0,0.8);--milkglass:rgba(100,100,100,0.1);--darkmode-1:#201e20;--darkmode-2:#171517;--darkmode-3:#121012;--text-color-main:var(--raven);--text-color-secondary:var(--charcoal);--icon-color:var(--charcoal);--background-color:var(--mist);--background-surface-color:var(--white);--background-highlight-color:var(--mist);--container-background-color:var(--white);--divider-color-outer:var(--silver);--divider-color-inner:var(--mist);--datalist-placeholder-fill-color:var(--mist);--datalist-placeholder-border-color:var(--silver);--graph-curve-disabled:var(--ash);--graph-gradient-disabled:var(--ash);--graph-marker:var(--silver);--graph-legend-background:hsla(0,0,0,0.75);--pills-color:var(--text-color-main);--pills-inverted-color:var(--white);--total-counts-background-color:var(--fog);--secondary-button-border:var(--platinum);--secondary-button-border-highlighted:var(--ash);--button-secondary-background-color:var(--mist);--font-primary-color:var(--black);--button-secondary-font-color:var(--black);--typography-heading4-font:var(--black)}path[style*=\"fill: rgb(242, 242, 242)\"]{fill:#0a0a0a}[class*=\"GraphBar\"] rect[fill=\"#F5F7F8\"]{fill:#0a0a0a}[class*=\"GraphBar\"] rect[fill=\"#FFFFFF\"]{fill:#111}[class*=\"GraphBar\"] rect[fill=\"#D8D8D8\"][class*=\"Bar_FadedBar\"]{fill:#161616}[class*=\"GraphBar\"] rect[fill=\"#D8D8D8\"]{fill:#272727}[class*=\"WorldMap_Container\"]>svg>path{filter:invert(1) hue-rotate(180deg)}[class*=\"DataList_Blur\"]:before{-webkit-backdrop-filter:blur(0);backdrop-filter:blur(0)}[class*=\"DataList_ListItem\"][class*=\"DataList_Blur\"]{pointer-events:all}[class*=\"DataList_ListItem\"][class*=\"DataList_Blur\"]:hover{background:var(--datalist-hover-background)}";
if (false || (new RegExp("^http(s)?://(|www.)?soundcloud.com/connect?.*$")).test(document.location.href))
	css += "#oauth,#oauth2_authorization,body #main-wrapper,.sessions__formContainer{background:#111}html,body,form,fieldset,#oauth #main-wrapper .authorize-text,#oauth2_authorization #main-wrapper .authorize-text{color:#ccc}.userbadge.context{border-color:#222}";
if (false || (document.location.href.indexOf("https://secure.soundcloud.com/web-auth") == 0))
	css += ":root{--font-primary-color:white}body,fieldset,form{background:#111;color:#ccc}input,select,textarea{background:#111;border-color:#333}.sc-input{border-color:#333}button,input,select,textarea{color:#ccc}a.sc-link-dark,a:hover{color:#ccc}.button-row>:not(.sc-button-cta),.sc-button-focus,.button-row>:focus:not(.sc-button-cta),.button-row>:hover:not(.sc-button-cta){color:#ccc}";
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
