var _guiWid = display_get_gui_width(),
	_guiHeit = display_get_gui_height(),
	_keyI = InputPressed(INPUT_VERB.INVENTORY),
	_mousePressLeft = InputMousePressed()


if (_keyI) {
	keyInventory = !keyInventory
}


if (keyInventory) {
	var _inventory = INVENTORY_DATA,
		_orderArray = _inventory.itemOrder,
		_invSize = INVENTORY_DATA.inventorySize,
		_mouseX = InputMouseGuiX(),
		_mouseY = InputMouseGuiY(),
		_selectedItem = -1,
		_scribbleObjet = scribble("Inventory")
	
	#region Scribble Object
		_scribbleObjet.starting_format("fntMain", c_black)
		_scribbleObjet.align(fa_center, fa_middle)
		_scribbleObjet.scale(.1)
	#endregion
	
	Draw9SliceBox(invBackground, _guiWid/2 - 84, _guiHeit/2 - 75, 168, 125, 3)
	_scribbleObjet.draw(_guiWid/2, _guiHeit/2 - 63)
	
	#region Items and Slots
		for (var i = 0; i < _invSize; i++) {
			var j = floor(i/8),
				_posX = _guiWid/2 - 80 + (i * 20 - (j * (20 * 8))),
				_posY = _guiHeit/2 - 54 + (j * 20),
				_itemExists = i < array_length(_orderArray),
				_slotArea = point_in_rectangle(_mouseX, _mouseY, _posX + 1, _posY + 1, _posX + 19, _posY + 19),
				_slotBack = invBackground
		
		
			if (_slotArea) {
				_slotBack = invBackgroundSup
			}
			Draw9SliceBox(_slotBack, _posX + 1, _posY + 1, 18, 18, 3)
		
		
			if(_orderArray[i] != 0){
				var _getItemData = _inventory.getItem(_orderArray[i])
			
				draw_sprite(sprItems, _getItemData.itemId, _posX + 2, _posY + 2)
				Draw9SliceBox(invBackgroundInfo, _posX + 13, _posY -1, 8, 8, 3)
				draw_text_scribble(_posX + 15.5, _posY, "[scale, .05][c_black]" + string(_getItemData.itemAmount))
			
				if (_slotArea) { // Coleta o item e posições do slot atual
					_selectedItem = [_posX, _posY, _getItemData]
				
					if (_mousePressLeft) {
						_inventory.useItem(_getItemData)
					} 
				}
			}
		}
	#endregion
	#region Item Info
		if(_selectedItem != -1){
			
			_scribbleObjet = scribble(_selectedItem[2].itemName)
			_scribbleObjet = scribble(_selectedItem[2].itemName)
			
			Draw9SliceBox(invBackgroundInfo, _selectedItem[0] + 25, _selectedItem[1] - 8, 50, 32, 3)
			draw_sprite_ext(indicator, 0, _selectedItem[0] + 28, _selectedItem[1] + 5, 1, 1, -90, -1, 1)
			draw_text_scribble(_selectedItem[0] + 29, _selectedItem[1] - 5, "[scale, .05][c_black]" + _selectedItem[2].itemName)
			draw_text_scribble(_selectedItem[0] + 29, _selectedItem[1] + 1, "[scale, .05][c_gray]" + _selectedItem[2].itemOtherName)
			draw_text_scribble(_selectedItem[0] + 29, _selectedItem[1] + 9, "[scale, .05][c_black]Price: [c_yellow]" + string(_selectedItem[2].itemPrice))
		}
	#endregion
}

