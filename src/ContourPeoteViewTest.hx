package;

import peote.PeoteViewSample;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.MouseButton;
import lime.ui.MouseWheelMode;
import lime.ui.Window;

class ContourPeoteViewTest extends Application {
    
    var contourTest: ContourTest;
    var peote:       PeoteViewSample;
    var runSeconds: Float = 0; // maybe delay to start.
    var ready: Bool = false;
    public function init(window:Window) {
        // Currently can't use these both together...
        
        contourTest  = new ContourTest( window );
        peote = new PeoteViewSample( window );
    }
    
    public override function onWindowCreate():Void
    {
        switch (window.context.type)
        {
            case WEBGL, OPENGL, OPENGLES: 
                init( window );
                
            default: throw("Sorry, only works with OpenGL.");
        }
        ready = true;
    }
    
    // ------------------------------------------------------------
    // ----------------- LIME EVENTS ------------------------------
    // ------------------------------------------------------------    

    override function onPreloadComplete():Void {
        // access embeded assets here
    }

    public override
    function update( deltaTime: Int ): Void {
        
        runSeconds = deltaTime /1000;
        if( !ready ) return;
    }

    override function render(context:lime.graphics.RenderContext):Void
    {
        if( !ready ) return;
        // to render peote-view first (into background)
        if (peote != null) peote.peoteView.render();
        if (contourTest != null) contourTest.render(context);
        
        // to render peote-view after (into foreground)
        // if (peote != null) peote.peoteView.renderPart(); // rendering without gl-initialization and viewport clearing
    }
    
    override function onWindowResize (width:Int, height:Int):Void
    {
        //if (contourTest != null) contourTest.onWindowResize(width, height);
        if (peote != null) peote.peoteView.resize(width, height);
    }
    
    // ----------------- MOUSE EVENTS ------------------------------
    // override function onMouseMove (x:Float, y:Float):Void {}    
    // override function onMouseDown (x:Float, y:Float, button:lime.ui.MouseButton):Void {}    
    // override function onMouseUp (x:Float, y:Float, button:lime.ui.MouseButton):Void {}    
    // override function onMouseWheel (deltaX:Float, deltaY:Float, deltaMode:lime.ui.MouseWheelMode):Void {}
    // override function onMouseMoveRelative (x:Float, y:Float):Void {}

    // ----------------- TOUCH EVENTS ------------------------------
    // override function onTouchStart (touch:lime.ui.Touch):Void {}
    // override function onTouchMove (touch:lime.ui.Touch):Void    {}
    // override function onTouchEnd (touch:lime.ui.Touch):Void {}
    
    // ----------------- KEYBOARD EVENTS ---------------------------
    // override function onKeyDown (keyCode:lime.ui.KeyCode, modifier:lime.ui.KeyModifier):Void {}    
    // override function onKeyUp (keyCode:lime.ui.KeyCode, modifier:lime.ui.KeyModifier):Void {}

    // -------------- other WINDOWS EVENTS ----------------------------
    // override function onWindowLeave():Void { trace("onWindowLeave"); }
    // override function onWindowActivate():Void { trace("onWindowActivate"); }
    // override function onWindowClose():Void { trace("onWindowClose"); }
    // override function onWindowDeactivate():Void { trace("onWindowDeactivate"); }
    // override function onWindowDropFile(file:String):Void { trace("onWindowDropFile"); }
    // override function onWindowEnter():Void { trace("onWindowEnter"); }
    // override function onWindowExpose():Void { trace("onWindowExpose"); }
    // override function onWindowFocusIn():Void { trace("onWindowFocusIn"); }
    // override function onWindowFocusOut():Void { trace("onWindowFocusOut"); }
    // override function onWindowFullscreen():Void { trace("onWindowFullscreen"); }
    // override function onWindowMove(x:Float, y:Float):Void { trace("onWindowMove"); }
    // override function onWindowMinimize():Void { trace("onWindowMinimize"); }
    // override function onWindowRestore():Void { trace("onWindowRestore"); }
    
    // override function onRenderContextLost ():Void trace(" --- WARNING: LOST RENDERCONTEXT --- ");        
    // override function onRenderContextRestored (context:lime.graphics.RenderContext):Void trace(" --- onRenderContextRestored --- ");        

}