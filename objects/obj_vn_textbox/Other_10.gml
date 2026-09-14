if (ds_list_size(string_list) > 0)
{
	ds_list_clear(string_list);
}
var _temp_string_segment_start = 0;
var _temp_final_string = "";
for (var _i = 0; _i <= string_length(text); _i += 1)
{
	// Extract the character from the string.
	var _temp_extracted_character = string_copy(text, _i, 1);
	// If the character is a newline or we reached the end of the string,
	// split the string up to this point into a new string.
	if (_temp_extracted_character == "\t" || _i == string_length(text))
	{
		var _temp_segment_length = _i - _temp_string_segment_start;
		if (_i == string_length(text)) _temp_segment_length += 1;
		var _temp_extracted_string = string_copy(text, _temp_string_segment_start, _temp_segment_length);
		ds_list_add(string_list, _temp_extracted_string);
		_temp_final_string += "\"" + _temp_extracted_string + "\" "
		_temp_string_segment_start = _i + 0;
	}
}