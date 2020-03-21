extends Control

onready var itemList = get_node("ItemList")

func _ready():
	itemList.set_max_columns(6)
	itemList.set_fixed_icon_size(Vector2(48, 48))
	itemList.set_icon_mode(itemList.ICON_MODE_TOP)
	itemList.set_select_mode(itemList.SELECT_SINGLE)
	itemList.set_same_column_width(true)
	
	#var icon = ResourceLoader.load("res://Visuales/piedrita.png")
	#itemList.add_item("", icon, true)
	cargar_items()

func cargar_items():
	itemList.clear();
	for slot in range(0, DataJugador.maxSlots):
		var itemDeInventario = DataJugador.inventario[String(slot)]
		var metaDataDelItem = DataItems.get_item(itemDeInventario["id"])
		var nombre = String(metaDataDelItem["nombre"])
		var icon = ResourceLoader.Load(metaDataDelItem["icon"])
		if itemDeInventario["id"] == "0":
			nombre = " "
		itemList.add_item(String(nombre), icon, true)
		itemList.set_item_metadata(slot, metaDataDelItem)
		itemList.set_item_tooltip(slot, metaDataDelItem["nombre"])
		
