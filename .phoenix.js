//#!/Users/jz/.nvm/versions/node/v5.1.0/bin/babel
//
// todo: store last window size for each frame we nudge and use ctrl-cmd-z to restore it
var keys = [];

var moveKey = 'ctrl',
	sizeKey = 'cmd',
	littleKey = 'alt',
	lotKey = 'shift',

	littleAmount = 10,
	lotAmount = 200;


function getPixelsByPercent(percent, screenFrame) {
	screenFrame = screenFrame || Window.focused().screen().frameWithoutDockOrMenu();
	screenFrame;
}

function nudgeFocusedWindow(prop, val) {
	var win = Window.focused(),
		frame = win.frame();

	frame[prop] = frame[prop] + val;

	win.setFrame(frame);
}

// move screen

Key.on('left', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('x', -lotAmount);
});

Key.on('right', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('x', lotAmount);
});

Key.on('up', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('y', -lotAmount);
});

Key.on('down', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('y', lotAmount)
});

// resize screen
Key.on('left', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('width', -lotAmount);
});

Key.on('right', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('width', lotAmount);
});

Key.on('up', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('height', -lotAmount);
});

Key.on('down', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('height', lotAmount);
});

// todo: these next two only work properly on a single monitor
//
// maximize window
Key.on('m', ['ctrl', 'cmd'], function(){
	/*var focusedWindow = Window.focused(),
		screenFrame = focusedWindow.screen().frameIncludingDockAndMenu();

	focusedWindow.setFrame({
		x: 0,
		y: 0,
		width: screenFrame.width,
		height: screenFrame.height
	});*/
	var window = Window.focused();
	if (!window) return;
	window.maximize();
	//setWindowCentral(window); << not sure exactly but this api is busted
});

// center window
Key.on('c', ['ctrl', 'cmd'], function(){
	var window = Window.focused();
	var windowFrame = window.frame();
	var screenFrame = window.screen().visibleFrameInRectangle();

	window.setFrame(_.extend(windowFrame, {
		x: (screenFrame.width - windowFrame.width) / 2,
		y: (screenFrame.height - windowFrame.height) / 2
	}));
});
