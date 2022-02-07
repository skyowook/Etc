defaultAddress="192.168.100.178:5555"
str1="$(adb devices)"

while [ "$str1" = "List of devices attached" ]
do
	echo "input device address : "
	read x

	if [ "$x" = "" ]; then
		echo "$(adb connect $defaultAddress)"
	else
		echo "$(adb connect $x)"
	fi

	str1="$(adb devices)"
	if [ "$str1" != "List of devices attached" ]; then
		break
	fi
done

echo "$(nohup scrcpy)"