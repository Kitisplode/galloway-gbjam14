/// @description Insert description here
// You can write your code in this editor
if (!paused)
{
	// Reading mode
	if (phase == 0)
	{
		if (ds_list_size(instruction_list) > 0)
		{
			// Copy out the first instruction.
			// Delete the instruction from the list.
			// Switch to instruction mode.
		}
	}
	// Instruction mode
	else if (phase == 1)
	{
		// Check to see if the current instruction is finished yet.
		// If it is, return to reading mode.
		// Otherwise, continue executing the instruction.
	}
}