#!/usr/bin/env fish

# Function to check if the input is empty
function check_input
    if test -z "$argv"
        echo "Input cannot be empty. Please try again."
        return 1
    end
    return 0
end

# Ask for buyer's name
echo "Enter buyer's name:"
read buyerName
check_input $buyerName
if test $status -ne 0
    exit
end

# Ask for the item cost
echo "Enter the cost of the item (in USD):"
read itemCost
check_input $itemCost
if test $status -ne 0
    exit
end

# Debugging: Show the captured cost
echo "Debugging: Item cost entered is: $itemCost"

# Ask for the item description
echo "Enter the description of the item sold:"
read itemDescription
check_input $itemDescription
if test $status -ne 0
    exit
end

# Ask for the day of the class
echo "Enter the day of the class:"
read classDay
check_input $classDay
if test $status -ne 0
    exit
end

# Format the current date and time for the receipt file name
set currentDate (date +%Y-%m-%d_%H-%M-%S)
set receiptFileName "Receipt_$currentDate.md"

# Create a nicely formatted Markdown receipt without the logo
set receiptContent "
# **Portfolio Online Workshop**

# **Receipt**

**Recipient:** $buyerName  
**Description of Item:** $itemDescription  
**Amount Paid:** **$itemCost**  
**Day of Class:** $classDay

---

*Email: zackjohnsonart@gmail.com*
"

# Write the content to the markdown file
echo "$receiptContent" > $receiptFileName

# Debugging: Show the markdown content being written
echo "Debugging: Content written to markdown:"
cat $receiptFileName

# Convert the markdown file to a PDF using pandoc with smaller margins, custom font (CascadiaCode-Regular), and increased font size (16pt)
set pdfFileName (string replace ".md" ".pdf" $receiptFileName)

# Use custom LaTeX font settings for the PDF (Arial Rounded MT Bold font and 16pt font size)
pandoc $receiptFileName -o $pdfFileName -V geometry:margin=0.5in -V fontsize=16pt -V mainfont="CascadiaCode-Regular" --pdf-engine=xelatex

# Clean up by removing the markdown file after conversion
rm $receiptFileName

# Output success message
echo "Your receipt has been saved as $pdfFileName."
