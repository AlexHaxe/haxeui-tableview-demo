package;

class TextItemRenderer extends ItemRenderer {
	public function new() {
		super();
		var label:Label = new Label();
		label.verticalAlign = HorizontalAlign.LEFT;
		label.percentWidth = 100;

		addComponent(label);
	}

	override private function validateData():Void {
		var label:Label = findComponent(null, Label, true);
		label.text = _data.value;
	}
}
