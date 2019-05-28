package;

class ResultList extends Sprite {
	private var fullDataSource:Array<ResultListItemData>;
	private var uiView:Component;

	public static inline var ITEM_COUNT:Int = 500;

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
		addChild(uiView);

		var tableView:TableView = uiView.findComponent("results", TableView, true);
		addTableColumns(tableView);

		if (true) {
			// fill data source with onEnterFrame
			fullDataSource = makeDataSource();
			tableView.dataSource = new ArrayDataSource<ResultListItemData>();
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		} else {
			// set data source direct without
			tableView.dataSource = makeDataSourceDirect();
		}
	}

	private function onEnterFrame(e:Event):Void {
		var tableView:TableView = uiView.findComponent("results", TableView, true);
		if ((fullDataSource == null) || (fullDataSource.length <= 0)) {
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			return;
		}
		for (index in 0...25) {
			if (fullDataSource.length <= 0) {
				break;
			}
			var data:ResultListItemData = fullDataSource.shift();
			tableView.dataSource.add(data);
		}
	}

	private function makeDataSource():Array<ResultListItemData> {
		var dataSource:Array<ResultListItemData> = [];
		for (index in 0...ITEM_COUNT) {
			dataSource.push(makeProdukt(index));
		}
		return dataSource;
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
		header.addClass("headerRow");
		tableView.addComponent(header);

		addImageColumn(header, tableView, "icon", 50);
		addImageColumn(header, tableView, "pdf", 50);
		for (index in 1...10) {
			addTextColumn(header, tableView, 'field_$index', 'Field $index', 100);
		}
	}

	private function addTextColumn(header:Header, tableView:TableView, colId:String, colTitle:String, colWidth:Float):Void {
		var label:Label = new Label();
		label.text = colTitle;
		label.id = colId;
		label.width = colWidth;
		label.height = 36;
		label.verticalAlign = VerticalAlign.BOTTOM;

		header.addComponent(label);

		var renderer:ItemRenderer = new TextItemRenderer();
		renderer.width = colWidth;
		renderer.height = 36;
		tableView.addComponent(renderer);
	}

	private function addImageColumn(header:Header, tableView:TableView, colId:String, colWidth:Float):Void {
		var label:Label = new Label();
		label.text = "";
		label.id = colId;
		label.width = colWidth;
		label.height = 36;
		label.verticalAlign = VerticalAlign.BOTTOM;
		label.layout = new AbsoluteLayout();
		header.addComponent(label);

		var renderer:ItemRenderer = new ImageItemRenderer();
		renderer.width = colWidth;
		renderer.height = 36;
		tableView.addComponent(renderer);
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
