/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */
//參考網站：http://docs.ckeditor.com/#!/api/CKEDITOR.config-cfg-fileTools_defaultFileName


//禁止文字，ckeditor 4 以上版本已預設禁止script，參考http://docs.ckeditor.com/#!/guide/dev_disallowed_content
//CKEDITOR.config.disallowedContent = 'script; *[on*]';

//准許文字，可以在原始碼模式寫class與id等屬性以及inline style
CKEDITOR.config.extraAllowedContent = '*(*);*{*}';

//table表格寬預設100%，圖片上傳寬100%
CKEDITOR.on('dialogDefinition', function(ev) {

	var diagName = ev.data.name;
	var diagDefn = ev.data.definition;

	if (diagName === 'table') {
		var infoTab = diagDefn.getContents('info');

		var width = infoTab.get('txtWidth');
		width['default'] = "100%";

	}
	if (diagName === 'image2') {
		var infoTab = diagDefn.getContents('info');

		// var width = infoTab.get('txtWidth');
		// width['default'] = "100%";

	}
});

//語言，語言內容至zh.js更改
CKEDITOR.config.defaultLanguage = 'zh';

//字級，chrome設定最小限制12px
CKEDITOR.config.fontSize_sizes = "12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;72/72px";

//字型
CKEDITOR.config.font_names="微軟正黑體/微軟正黑體;標楷體/標楷體;新細明體/新細明體;Arial/Arial, Helvetica, sans-serif;Comic Sans MS/Comic Sans MS, cursive;Courier New/Courier New, Courier, monospace;Georgia/Georgia, serif;Lucida Sans Unicode/Lucida Sans Unicode, Lucida Grande, sans-serif;Tahoma/Tahoma, Geneva, sans-serif;Times New Roman/Times New Roman, Times, serif;Trebuchet MS/Trebuchet MS, Helvetica, sans-serif;Verdana/Verdana, Geneva, sans-serif";

//行高
CKEDITOR.config.line_height="0.3;0.4;0.5;0.6;0.7;0.8;0.9;1;1.1;1.2;1.3;1.4;1.5;2;3;4;5";

//載入其他外掛
CKEDITOR.config.extraPlugins = 'image2,liststyle,filetools,notificationaggregator,notification,uploadwidget,uploadimage';

//移除外掛
CKEDITOR.config.removePlugins = 'language, iframe, forms';

//回復次數上限，預設20
//CKEDITOR.config.undoStackSize = 20;

//每次縮排大小，預設40
//CKEDITOR.config.indentOffset = 40;
//縮排單位，預設px
//CKEDITORconfig.indentUnit = 'px';

//輔助線顏色，預設#FF0000
//CKEDITOR.config.magicline_color = '#FF0000';

//載入輸出目標頁面的css到編輯器內，減少前後台誤差
//CKEDITOR.config.contentsCss = '/css/mysitestyles.css';

//載入特定js檔至特定的textarea id，用id名稱置換myfield
//CKEDITOR.replace( 'myfield', { customConfig: '/myconfig.js' } );

