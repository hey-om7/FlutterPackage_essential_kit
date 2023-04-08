## Features

Quickly use widgets and functions.

## Getting started

The Flutter package provides developers with a range of customizable widgets and functions to enhance user experience. The package includes a custom complete button package, "myButton," with vibration and haptic feedback, splash animations, colors, sizes, and custom text. The "myText" widget offers quick-to-use customization for displaying text with font size, boldness, and color options. The package also features a customizable "Toast" function for displaying small, informative messages on the screen. Overall, this package offers essential tools for enhancing the user experience of any Flutter application.

## Usage

- **myButton widget:** This is a custom complete button package that comes with a range of features to enhance the user experience. It includes vibration and haptic feedback to provide tactile confirmation to the user, splash animations to make the button more visually engaging, and a range of colors and sizes to fit seamlessly into any app design. Additionally, the custom text feature allows developers to add text to the button with their desired font, style, and color.

- **myText widget:** This is a quick-to-use widget for displaying text that comes with a range of customization options. Developers can quickly set the font size, boldness, and color of the text, allowing them to create visually appealing displays of text without having to write additional code.

- **Toast function:** This function allows developers to display a toast message, which is a small message that appears on the screen to provide feedback to the user. This feature is commonly used to display information such as confirmation messages or error messages. The toast message is customizable, allowing developers to set the duration of the message, the background color, and the font style.

- **Coloured Print functions:** This function allows developers to display a coloured text message according to the required types as:

**printWarning**

**printError**

**printBlue**

- **Notification Show:** This function allows developers to show a push notification to android and ios. Refer the package flutter_local_notifications to set up permissions in android and ios respectively.

```dart

myButton();
myText();
myText();
toastMessagePopup(context,text);
getDeviceWidth(context);
getDeviceHeight(context)
printWarning(text);
printError(text)
printBlue(text);
printWarning(text);
printError(text);
printBlue(text);

```
