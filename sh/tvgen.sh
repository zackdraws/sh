#!/usr/bin/env fish

# Function to generate a schedule
function generate_schedule
    # Ask for the show name, starting date/time, and number of episodes
    echo "Enter the name of the show:"
    read show_name

    echo "Enter the season number (e.g., 3):"
    read season_number

    echo "Enter the starting date and time for the first episode (e.g., 2025-05-09 19:00):"
    read start_date_time

    echo "Enter the number of episodes:"
    read num_episodes

    # Ask for the duration (applies to all episodes)
    echo "Enter the duration for each episode (in minutes):"
    read duration

    # Ask for the clipboard tool
    set clipboard_tool (which pbcopy; or which xclip)

    if not test -x $clipboard_tool
        echo "No clipboard tool found. Please install 'pbcopy' (macOS) or 'xclip' (Linux)."
        return 1
    end

    # Start the schedule string
    set schedule_output "* $show_name Schedule"

    # Loop over the number of episodes and generate the schedule
    for i in (seq 1 $num_episodes)
        # Generate the episode name, assuming the season number is dynamic (e.g., "3x01", "3x02", etc.)
        set episode_number (printf "%s%02d" $season_number $i)  # Uses the season number dynamically
        set episode_title "Episode $i"

        # Append the show name with the episode title and number
        set schedule_output "$schedule_output\n\n** $show_name - $episode_title $episode_number"

        # Append the scheduled episode details
        set schedule_output "$schedule_output\n   SCHEDULED: <$start_date_time>"
        set schedule_output "$schedule_output\n   Duration: $duration minutes"
        set schedule_output "$schedule_output\n   - Description goes here"

        # Extract date and time part
        set start_date (echo $start_date_time | cut -d' ' -f1)
        set start_time (echo $start_date_time | cut -d' ' -f2)

        # Check if the system is macOS or Linux, and adjust the date command accordingly
        if test (uname) = "Darwin"
            # macOS date format
            set new_date (date -j -v +7d -f "%Y-%m-%d" $start_date "+%Y-%m-%d")
        else
            # Linux date format
            set new_date (date -d "$start_date + 7 days" "+%Y-%m-%d")
        end

        # Recombine new date with the time to form the new start date/time
        set start_date_time "$new_date $start_time"
    end

    # Output the final schedule to the terminal for review
    printf "$schedule_output\n"

    # Copy the generated schedule to clipboard
    if test -x $clipboard_tool
        # macOS: pbcopy
        if test "$clipboard_tool" = "/usr/bin/pbcopy"
            printf "$schedule_output" | pbcopy
            echo "Schedule copied to clipboard!"
        # Linux: xclip
        else if test "$clipboard_tool" = "/usr/bin/xclip"
            printf "$schedule_output" | xclip -selection clipboard
            echo "Schedule copied to clipboard!"
        end
    else
        echo "No clipboard tool found."
    end
end

# Run the function
generate_schedule
