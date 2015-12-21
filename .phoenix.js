//#!/Users/jz/.nvm/versions/node/v5.1.0/bin/babel
var keys = [];

var moveKey = 'ctrl',
	sizeKey = 'cmd',
	littleKey = 'alt',
	lotKey = 'shift',

	littleAmount = 10,
	lotAmount = 200;


function getPixelsByPercent(percent, screenFrame) {
	screenFrame = screenFrame || Window.focusedWindow().screen().frameWithoutDockOrMenu();
	screenFrame;
}

function nudgeFocusedWindow(prop, val) {
	var win = Window.focusedWindow(),
		frame = win.frame();

	frame[prop] = frame[prop] + val;

	win.setFrame(frame);
}

// move screen
keys.push(Phoenix.bind('left', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('x', -lotAmount);
}));

keys.push(Phoenix.bind('right', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('x', lotAmount);
}));

keys.push(Phoenix.bind('up', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('y', -lotAmount);
}));

keys.push(Phoenix.bind('down', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('y', lotAmount)
}));

// resize screen
keys.push(Phoenix.bind('left', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('width', -lotAmount);
}));

keys.push(Phoenix.bind('right', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('width', lotAmount);
}));

keys.push(Phoenix.bind('up', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('height', -lotAmount);
}));

keys.push(Phoenix.bind('down', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('height', lotAmount);
}));

// todo: these next two only work properly on a single monitor
//
// maximize window
keys.push(Phoenix.bind('m', ['ctrl', 'cmd'], function(){
	/*var focusedWindow = Window.focusedWindow(),
		screenFrame = focusedWindow.screen().frameIncludingDockAndMenu();

	focusedWindow.setFrame({
		x: 0,
		y: 0,
		width: screenFrame.width,
		height: screenFrame.height
	});*/
	var window = Window.focusedWindow();
	if (!window) return;
	window.maximize();
	setWindowCentral(window);
}));

// center window
keys.push(Phoenix.bind('c', ['ctrl', 'cmd'], function(){
	var window = Window.focusedWindow();
	var windowFrame = window.frame();
	var screenFrame = window.screen().visibleFrameInRectangle();

	window.setFrame(_.extend(windowFrame, {
		x: (screenFrame.width - windowFrame.width) / 2,
		y: (screenFrame.height - windowFrame.height) / 2
	}));
}));
