# SmartKeyboardScrollView

SmartKeyboardScrollView creates a ScrollView that automatically adjusts content offset to avoid system keyboard while at the same time allows adding a sticky footer that ignores the keyboard.

This view uses only native SwiftUI mechanics and does not rely on UIResponder.keyboardDidShowNotification.

# Usage
 You can provide content in different ways to improve how the scrolling mechanism works:
 1. Provide any content as you would with any other container view. System will keep any active input in visible frame after keyboard is presented.
 2. Providing @FocusState allows the ScrollView to always scroll to the active TextField
 3. Placing content in VariadicVStack makes scrolling to active TextField more responsive
 
 # Limitations
 - Using NavigationView with .large title display mode breaks scrolling animation when title is collapsing.
 - Using some ViewModifiers such as .padding() on the SmartKeyboardScrollView itself can break the mechanism. Using any modifiers on the content/footer works fine.
 
# Example
 ```
 @FocusState private var focusState: String?
 
 SmartKeyboardScrollView(focusState: _focusState) {
    TextField("Example", text: .constant(""))
        .id("0")
        .focused($focusState, equals: "0")
 } footer {
      // Place any footer here
 }
 ```
