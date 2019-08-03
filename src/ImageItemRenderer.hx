package;

class ImageItemRenderer extends ItemRenderer {
	private var image:Image;

	public function new() {
		super();
		width = 32;
		height = 32;
	}

	override private function validateComponentData():Void {
		if (image != null) {
			if (image.resource == _data.value) {
				return;
			}
			removeComponent(image);
		}
		image = new Image();
		image.verticalAlign = VerticalAlign.CENTER;
		image.horizontalAlign = HorizontalAlign.CENTER;
		image.scaleMode = ScaleMode.FIT_INSIDE;
		image.resource = _data.value;
		image.width = 32;
		image.height = 32;
		addComponent(image);
	}
}
