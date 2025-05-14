keyInventory = 0
draw_set_font(fntMain)


#region [Structures] Nine Slice Sprites
	invBackground = {
		tl: dt_box_9slice_tl,
		tc: dt_box_9slice_tc,
		tr: dt_box_9slice_tr,
		lc: dt_box_9slice_lc,
		c : dt_box_9slice_c,
		rc: dt_box_9slice_rc,
		bl: dt_box_9slice_bl,
		bc: dt_box_9slice_bc,
		br: dt_box_9slice_br
	}
	invBackgroundSup = {
		tl: lt_box_9slice_tl,
		tc: lt_box_9slice_tc,
		tr: lt_box_9slice_tr,
		lc: lt_box_9slice_lc,
		c : lt_box_9slice_c,
		rc: lt_box_9slice_rc,
		bl: lt_box_9slice_bl,
		bc: lt_box_9slice_bc,
		br: lt_box_9slice_br
	}
	invBackgroundInfo = {
		tl: w_box_9slice_tl,
		tc: w_box_9slice_tc,
		tr: w_box_9slice_tr,
		lc: w_box_9slice_lc,
		c : w_box_9slice_c,
		rc: w_box_9slice_rc,
		bl: w_box_9slice_bl,
		bc: w_box_9slice_bc,
		br: w_box_9slice_br
	}
#endregion

#region Adding items to inventory [5 Items]	
	_item = new BaseItem(0, "Crop", "Pumpkin", "Cucurbita", 200)
	_item.use = function(_item){
		show_debug_message("The pumpkin restored 4 of your hunger")
	}
	INVENTORY_DATA.addItem(_item)
	INVENTORY_DATA.addItem(_item)
	
	var _item = new BaseItem(1, "Plant", "Sunflower", "Helianthus", 100)
	_item.amount = 6
	INVENTORY_DATA.addItem(_item)
	
	_item = new BaseItem(2, "Crop", "Carrot", "Daucus Carota", 500)
	INVENTORY_DATA.addItem(_item)
	INVENTORY_DATA.addItem(_item)
#endregion

