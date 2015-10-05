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
api.bind('left', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('x', -lotAmount);
});

api.bind('right', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('x', lotAmount);
});

api.bind('up', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('y', -lotAmount);
});

api.bind('down', ['ctrl', 'cmd'], function(){
	nudgeFocusedWindow('y', lotAmount)
});

// resize screen
api.bind('left', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('width', -lotAmount);
});

api.bind('right', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('width', lotAmount);
});

api.bind('up', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('height', -lotAmount);
});

api.bind('down', ['ctrl', 'alt'], function(){
	nudgeFocusedWindow('height', lotAmount);
});

// todo: these next two only work properly on a single monitor
//
// maximize window
api.bind('m', ['ctrl', 'cmd'], function(){
	var focusedWindow = Window.focusedWindow(),
		screenFrame = focusedWindow.screen().frameIncludingDockAndMenu();

	focusedWindow.setFrame({
		x: 0,
		y: 0,
		width: screenFrame.width,
		height: screenFrame.height
	});
});

// center window
api.bind('c', ['ctrl', 'cmd'], function(){
	var window = Window.focusedWindow(),
		windowFrame = window.frame(),
		screen = window.screen(),
		screenFrame = screen.frameWithoutDockOrMenu();

	window.setFrame(_.extend(windowFrame, {
		x: (screenFrame.width - windowFrame.width) / 2,
		y: (screenFrame.height - windowFrame.height) / 2
	}));
});


