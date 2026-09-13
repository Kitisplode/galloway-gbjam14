
function ds_list_sort_instances_by_zd(_list_id)
{
	if (!ds_exists(_list_id, ds_type_list)) return;
	var _list_size = ds_list_size(_list_id);
	if (_list_size < 2) return _list_id;
	
	for (var _i = 0; _i < _list_size - 1; _i++)
	{
		if (_i < 0) _i = 0;
		var _i_value_first = ds_list_find_value(_list_id, _i);
		var _i_value_second = ds_list_find_value(_list_id, _i + 1);
		if (!instance_exists(_i_value_first) || !instance_exists(_i_value_second)) return _list_id;
		if (_i_value_first.zd > _i_value_second.zd)
		{
			ds_list_replace(_list_id, _i, _i_value_second);
			ds_list_replace(_list_id, _i + 1, _i_value_first);
			_i -= 2;
		}
	}
	
	return _list_id;
}

function ds_list_cut(_list_id, _new_size)
{
	if (!ds_exists(_list_id, ds_type_list)) return -1;
	var _list_size = ds_list_size(_list_id);
	if (_list_size <= _new_size) return -2;
	for (var _i = _new_size; _i < ds_list_size(_list_id); _i++)
	{
		ds_list_delete(_list_id, _i);
		_i--;
	}
}

function ds_list_reverse(_list_id)
{
	if (!ds_exists(_list_id, ds_type_list)) return -1;
	var _list_size = ds_list_size(_list_id);
	if (_list_size < 2) return -2;
	for (var _i = 0; _i < floor(_list_size / 2); _i++)
	{
		var _i_value_first = ds_list_find_value(_list_id, _i);
		var _i_value_last = ds_list_find_value(_list_id, _list_size - _i - 1);
		ds_list_replace(_list_id, _i, _i_value_last);
		ds_list_replace(_list_id, _list_size - _i - 1, _i_value_first);
	}
	return _list_id;
}

function test_ds_list_reverse__odd()
{
	var _test_list = ds_list_create();
	
	ds_list_add(_test_list, 0);
	ds_list_add(_test_list, 1);
	ds_list_add(_test_list, 2);
	ds_list_add(_test_list, 3);
	ds_list_add(_test_list, 4);
	ds_list_add(_test_list, 5);
	ds_list_add(_test_list, 6);
	ds_list_add(_test_list, 7);
	ds_list_add(_test_list, 8);
	
	ds_list_reverse(_test_list);
	var _list_size = ds_list_size(_test_list);
	for (var _i = 0; _i < _list_size; _i++)
	{
		var _value = ds_list_find_value(_test_list, _i);
		if (_value != _list_size - _i - 1) show_message("test_ds_list_reverse__odd failure " + string(_i) + " " + string(_value));
	}
	
	ds_list_destroy(_test_list);
}

function ds_list_print(_list_id)
{
	if (!ds_exists(_list_id, ds_type_list)) return "empty list";
	var _result = "";
	var _list_size = ds_list_size(_list_id);
	for (var _i = 0; _i < _list_size; _i++)
	{
		var _value = ds_list_find_value(_list_id, _i);
		_result += string(_i) + " " + string(_value) + "\n";
	}
	return _result;
}