using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class MenuDelegate extends Ui.MenuInputDelegate {

	function initialize() {
		MenuInputDelegate.initialize();
	}

	function onMenuItem(item) {
		if(item == :menu_end_game) {
			//pop once to close the menu
			Ui.popView(Ui.SLIDE_IMMEDIATE);
			var save_match_confirmation = new Ui.Confirmation(Ui.loadResource(Rez.Strings.end_save_garmin_connect));
			Ui.pushView(save_match_confirmation, new SaveMatchConfirmationDelegate(), Ui.SLIDE_IMMEDIATE);
		}
		else if(item == :menu_resume_later) {
			Match.saveToStorage($.match);
			//pop once to close the menu
			Ui.popView(Ui.SLIDE_IMMEDIATE);
			//pop again to close the main view hence closing the application
			Ui.popView(Ui.SLIDE_IMMEDIATE);
		}
		else if(item == :menu_exit_app) {
			$.match.discard();
			//pop once to close the menu
			Ui.popView(Ui.SLIDE_IMMEDIATE);
			//pop again to close the main view hence closing the application
			Ui.popView(Ui.SLIDE_IMMEDIATE);
		}
	}
}
