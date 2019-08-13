package;

class ResultList extends Sprite {
	private var fullDataSource:Array<ResultListItemData>;
	private var uiView:Component;

	public static inline var ITEM_COUNT:Int = 25;

	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function onAddedToStage(event:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		setupUI();
	}

	private function setupUI():Void {
		if (uiView != null) {
			return;
		}

		uiView = ComponentMacros.buildComponent("assets/xml/resultTable.xml");

		var tableView:TableView = uiView.findComponent("results", TableView, true);
		addTableColumns(tableView);
		addChild(uiView);

		var dataSource = makeDataSourceDirect();
		tableView.dataSource = dataSource;
	}

	private function makeDataSourceDirect():ArrayDataSource<ResultListItemData> {
		var dataSource:ArrayDataSource<ResultListItemData> = new ArrayDataSource<ResultListItemData>();
		for (index in 0...ITEM_COUNT) {
			dataSource.add(makeProdukt(index));
		}
		return dataSource;
	}

	private function addTableColumns(tableView:TableView):Void {
		var header:Header = new Header();
		tableView.addComponent(header);

		addImageColumn(header, tableView, "icon", 50);
		addImageColumn(header, tableView, "pdf", 50);
		for (index in 1...5) {
			addTextColumn(header, tableView, 'field_$index', 'Field $index', 100);
		}
	}

	private function addTextColumn(header:Header, tableView:TableView, colId:String, colTitle:String, colWidth:Float):Void {
		var column:Column = new Column();
		column.text = colTitle;
		column.id = colId;
		column.width = colWidth;
		column.height = 36;
		column.verticalAlign = VerticalAlign.BOTTOM;
		header.addComponent(column);

		var label:Label = new Label();
		label.id = colId;
		// label.width = colWidth;
		// label.height = 36;

		var itemRender:ItemRenderer = new ItemRenderer();
		itemRender.addComponent(label);
		tableView.addComponent(itemRender);
	}

	private function addImageColumn(header:Header, tableView:TableView, colId:String, colWidth:Float):Void {
		var column:Column = new Column();
		column.text = "";
		column.id = colId;
		column.width = colWidth;
		column.height = 36;
		column.verticalAlign = VerticalAlign.BOTTOM;
		column.layout = new AbsoluteLayout();
		header.addComponent(column);

		var image:Image = new Image();
		image.id = colId;
		image.verticalAlign = VerticalAlign.CENTER;
		image.horizontalAlign = HorizontalAlign.CENTER;
		image.scaleMode = ScaleMode.FIT_INSIDE;
		image.width = 32;
		image.height = 32;

		var itemRender:ItemRenderer = new ItemRenderer();
		itemRender.addComponent(image);
		tableView.addComponent(itemRender);
	}

	private function makeProdukt(count:Int):ResultListItemData {
		return {
			id: count,
			icon: "assets/pdf.png",
			pdf: "assets/pdf.png",
			field_1: 'field 1 $count',
			field_2: 'field 2 $count',
			field_3: 'field 3 $count',
			field_4: 'field 4 $count',
			field_5: 'field 5 $count',
			field_6: 'field 6 $count',
			field_7: 'field 7 $count',
			field_8: 'field 8 $count',
			field_9: 'field 9 $count',
			field_10: 'field 10 $count'
		};
	}
}

typedef ResultListItemData = {
	id:Dynamic,
	icon:String,
	pdf:String,
	field_1:String,
	field_2:String,
	field_3:String,
	field_4:String,
	field_5:String,
	field_6:String,
	field_7:String,
	field_8:String,
	field_9:String,
	field_10:String,
};
