ioreg -n IOHIDKeyboard -r | grep -e VendorID\" | grep -o '\d.*'

