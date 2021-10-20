package custom;

import haxe.ui.containers.Box;
import js.Browser;
import js.Syntax;
import js.html.CanvasElement;

class MyExternalCanvas extends Box {
    private var theCanvas:CanvasElement = null;
    
    private var _col:String = null;
    
    public var htmlId(null, set):String;
    private function set_htmlId(value:String):String {
        var el:CanvasElement = cast Browser.document.getElementById(value);
        if (el == null) {
            trace(value + " canvas not found, creating");
            el = Browser.document.createCanvasElement();
            el.id = value;
        }
        theCanvas = el;
        element.appendChild(theCanvas); // will reparent if already exists
        _col = "#" + StringTools.hex(Std.random(0xFFFFFF));
        Syntax.code("initLib({0})", theCanvas.id); // should really create externs, im just using untyped js because its quick and dirty for an example
        
        return value;
    }
    
    public override function validateComponentLayout():Bool {
        var b = super.validateComponentLayout();
        if (this.width > 0 && this.height > 0 && theCanvas != null) {
            var usableSize = this.layout.usableSize;
            theCanvas.width = Std.int(usableSize.width);
            theCanvas.height = Std.int(usableSize.height);
            Syntax.code("redrawCanvas({0}, {1})", theCanvas.id, _col); // should really create externs, im just using untyped js because its quick and dirty for an example
        }
        return b;
    }
}