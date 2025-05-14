function BaseItem(_itemId, _type, _name, _otherName, _price) constructor {
	itemId = _itemId
	itemType = _type
	itemName = _name
	itemOtherName = _otherName
	itemPrice = _price
	itemAmount = 1
	use = function(_item) {
		show_debug_message(_item.itemName + " was used")
	}
}

function Draw9SliceBox(_sprStruc, _x, _y, _w, _h, _slice) {	
	// Avoid invalid values
	if (_w < _slice * 2 || _h < _slice * 2) {
		return
	}
	
	var _x1 = _x,
		_y1 = _y,
		_x2 = _x + _slice,
		_y2 = _y + _slice,
		_x3 = _x + _w - _slice,
		_y3 = _y + _h - _slice,
		_x4 = _x + _w,
		_y4 = _y + _h

    draw_sprite(_sprStruc.tl, 0, _x1, _y1)
    draw_sprite(_sprStruc.tr, 0, _x3, _y1)
    draw_sprite(_sprStruc.bl, 0, _x1, _y3)
    draw_sprite(_sprStruc.br, 0, _x3, _y3)
	
	DrawTileStretched(_sprStruc.tc, _x2, _y1, _x3 - _x2, _slice)
	DrawTileStretched(_sprStruc.bc, _x2, _y3, _x3 - _x2, _slice)
	DrawTileStretched(_sprStruc.lc, _x1, _y2, _slice, _y3 - _y2)
	DrawTileStretched(_sprStruc.rc, _x3, _y2, _slice, _y3 - _y2)
	
	DrawTileStretched(_sprStruc.c, _x2, _y2, _x3 - _x2, _y3 - _y2)
}


function DrawTileStretched(_sprite, _x, _y, _w, _h) {
	var _sw = sprite_get_width(_sprite),
		_sh = sprite_get_height(_sprite)
	
	draw_sprite_part_ext(_sprite, 0, 0, 0, _sw, _sh, _x, _y, _w / _sw, _h / _sh, -1, 1)
}

