globalvar INVENTORY_DATA;

INVENTORY_DATA = {
	inventorySize: 40,
	storeItem: {},
	itemOrder: array_create(40, 0),
	
	addItem: function(_item) {
		if (!variable_struct_exists(storeItem, _item.itemName)) {
			var _isFull = 0,
				i
				
			for (i = 0; i < array_length(itemOrder); i++) {
				if(itemOrder[i] == 0){
					itemOrder[i] = _item.itemName
					storeItem[$ _item.itemName] = _item
					_isFull = 1
					break
				}
			}
			
			if (_isFull) {
				show_debug_message("Your inventory is full")
			}
		} else {
			updateAmount(_item.itemName, _item.itemAmount)
		}
	},
	
	getItem: function(_name) {
		return storeItem[$ _name]
	},
	
	updateAmount: function(_name, _amount) {
		storeItem[$ _name].itemAmount += _amount
		
		if (storeItem[$ _name].itemAmount <= 0) {
			for (var i = 0; i < array_length(itemOrder); i++) {
				if (itemOrder[i] == _name) {
					itemOrder[i] = 0
					break
				}
			}
			variable_struct_remove(storeItem, _name)
		}
	},
	
	useItem: function(_item) {
		_item.use(_item)
		updateAmount(_item.itemName, -1)
	}
}