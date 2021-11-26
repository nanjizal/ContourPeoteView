# ContourPeoteView
test

TODO:
Currently Peote and Contour clash with setup/unsetup.
May need to look into aspects of how frames are constructed and cleared and maybe changing programs.


```haxe
gl.viewport (0, 0, w, h);
        
gl.scissor(0, 0, w, h);
gl.enable(gl.SCISSOR_TEST);    
        
gl.clearColor(red, green, blue, alpha); // <- this only need at start
        
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT | gl.STENCIL_BUFFER_BIT);
gl.stencilMask(0xFF);
    
gl.blendFunc(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA);
    
gl.depthFunc(gl.LEQUAL);

gl.clear(gl.DEPTH_BUFFER_BIT | gl.STENCIL_BUFFER_BIT);
```
