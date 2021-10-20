package ;

import haxe.ui.HaxeUIApp;
import haxe.ui.core.Component;
import haxe.ui.macros.ComponentMacros;

class Main {
    public static function main() {
        var app = new HaxeUIApp();
        app.ready(function() {

		var video = new custom.Video();
        var main:Component = ComponentMacros.buildComponent("assets/main.xml");



			app.addComponent(video);
            app.addComponent(main);
            app.start();
        });
    }
}

