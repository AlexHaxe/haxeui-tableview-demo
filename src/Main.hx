package;

import haxe.CallStack;

class Main extends Sprite {
	public function new() {
		super();
		try {
			Toolkit.init();
			addChild(new ResultList());

			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		} catch (e:Any) {
			trace('$e');
			var items = CallStack.exceptionStack();
			for (item in items) {
				trace(item);
			}
		}
	}

	private function onKeyUp(event:KeyboardEvent):Void {
		if (event.keyCode == 27) {
			System.exit(0);
		}
	}
}
