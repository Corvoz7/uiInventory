randomize()

var _camWid = camera_get_view_width(view_camera[0]),
	_camHeit = camera_get_view_height(view_camera[0])


camera_set_view_pos(view_camera[0], irandom_range(0, room_width - _camWid), irandom_range(0, room_height - _camHeit))

cursor_sprite = cursor_01

