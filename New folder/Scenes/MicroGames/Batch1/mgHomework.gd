extends Micro_Game


# Input Function
# - Called Every time an input is processed
# 	- This means called every time a key is pressed for our purposes
func _input(event: InputEvent):
	
	# Checked if Event was a key being typed
	# - This allows us to ignore all other events 
	if event is InputEventKey and not event.is_pressed():
		
		# Take in event into a variable
		var typed_event = event as InputEventKey

		# Convert event into a character - I don't understand this either
		var key_typed = PoolByteArray([typed_event.scancode]).get_string_from_utf8().to_lower()

		# Checks if an enemy is being actively targeted
		##	-	This means - did the user already kill the previous
		##		enemy and trying to type in a new one?		
		if active_enemy == null:
			# If so, search for an enemy using the typed-in character
			find_new_active_enemy(key_typed)
		else:
			# Come here if an enemy has already been found and this
			# 	key press is part of a word that is being completed.
			# The found enemy has been set to active_enemy. See the 
			# 	find_new_active_enemy for more information.
			
			# Get the string prompt of the active_enemy
			var prompt = active_enemy.get_prompt()
			
			# Get the value of the character that must be typed next
			# - current_letter_index tracks where we are in a word
			# - 1 means we only take one character 
			var next_char = prompt.substr(current_letter_index,1)
			
			# Check if the key typed is equal to the next character
			if key_typed == next_char:
				$Gun.play()
				# Prints to Console for Debugging Purposes
				print("successfully typed %s " % key_typed)
				
				# Increments index in the word to next character
				current_letter_index += 1
				
				# Handles Visual Tracking in Label - documented more in Enemy.gd
				active_enemy.set_next_character(current_letter_index)
				
				# Check if entire word has been typed
				# - If tracker has gone through entire word
				if current_letter_index == prompt.length():
					
					# Printing for Debug Purposes
					print("Killed Enemy!")
					
					# Reset current_letter_index
					# - Arrays start at 0, so should set to -1 to be safe
					current_letter_index = -1
					if(active_enemy.boss):
						level = 4
						playDialogue()
						game_over()
					# Resets Active Enemy
					## Delete Enemy Instance
					active_enemy.queue_free()
					$kill.play()
					## Nulls Active_Enemy, enables searching again
					active_enemy = null
					
					# Update Enemy Kill UI 
					## Increments Enemy killed tracker
					enemies_killed += 1
					## Updates UI element
					killed_value.text = str(enemies_killed)
			else:
				# If typed character is not equal to next char, print for debug
				print("Incorrectly type %s instead of %s" % [key_typed, next_char])
