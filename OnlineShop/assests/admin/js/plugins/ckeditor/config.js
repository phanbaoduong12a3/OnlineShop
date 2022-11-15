/**
 * @license Copyright (c) 2003-2022, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

	
	config.systaxhighlight_lang = 'csharp';
	config.systaxhighlight_hideControls = true;
	config.language = 'vi';
	config.filebrowserBrowseUrl = '/assests/admin/js/plugins/ckfinder/ckfinder.html';
	config.filebrowserImageBrowserUrl = '/assests/admin/js/plugins/ckfinder/ckfinder.html?Type=Images';
	config.filebrowserFlashBrowserUrl = '/assests/admin/js/plugins/ckfinder/ckfinder.html?Type=Flash';
	config.filebrowserUploadUrl = '/assests/admin/js/plugins/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
	config.filebrowserImageUploadUrl = '/Data/';
	config.filebrowserFlashUploadUrl = '/assests/admin/js/plugins/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';

	CKFinder.setupCKEditor(null, '/assests/admin/js/plugins/ckfinder/');
};
