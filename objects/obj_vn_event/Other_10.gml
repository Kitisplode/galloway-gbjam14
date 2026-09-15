/// @description Insert description here
// You can write your code in this editor

//if (ds_list_size(instruction_list) > 0)
//{
//	ds_list_clear(instruction_list);
//}
//var _temp_string_segment_start = 0;
//var _temp_final_string = "";

//var _current_instruction_type = -1;
//for (var _i = 0; _i <= string_length(text); _i += 1)
//{
//	// Extract the character from the string.
//	var _temp_extracted_character = string_copy(text, _i, 1);
//	// If the character is a whitespace, split here and check the value of the token
//	if (_temp_extracted_character == " " ||
//		_temp_extracted_character == "\n" ||
//		_i == string_length(text))
//	{
//		var _temp_segment_length = _i - _temp_string_segment_start;
//		if (_i == string_length(text)) _temp_segment_length += 1;
//		var _temp_extracted_string = string_copy(text, _temp_string_segment_start, _temp_segment_length);
//		if (_temp_extracted_string == "sprite") _current_instruction_type = 1;
//		else if (_temp_extracted_string == "dialog") _current_instruction_type = 2;
		
		
//		_temp_string_segment_start = _i + 0;
//	}
//	// If the character is a newline or we reached the end of the string,
//	// split the string up to this point into a new string.
//	if (_temp_extracted_character == "\t" || _i == string_length(text))
//	{
//		var _temp_segment_length = _i - _temp_string_segment_start;
//		if (_i == string_length(text)) _temp_segment_length += 1;
//		var _temp_extracted_string = string_copy(text, _temp_string_segment_start, _temp_segment_length);
//		ds_list_add(string_list, _temp_extracted_string);
//		_temp_final_string += "\"" + _temp_extracted_string + "\" ";
//		_temp_string_segment_start = _i + 0;
//	}
//}