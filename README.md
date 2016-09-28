Basic iMessage app to demonstate the following unexpected behaviours.

# didSelectMessage:conversation: called before user actually selects it

1. Launch app
2. Tap insert message
3. Send

## Expected
`didSelectMessage` is not called until user taps the message

## Actual
`didSelectMessage` is called as soon as the message is added to the conversation


# didSelectMessage:conversation not called when user taps a message they previously tapped
1. Launch app
2. Tap insert message
3. Send
4. Tap the message in the conversation view


## Expected
`didSelectMessage` is called so we can tell the user has tapped on a message so we can respond to that tap and load specific content

## Actual
Since that message has been considered selected all along there is no callback and we cannot respond to the tap

## Notes
This is particular relevant when you consider a scenario where an app has two state, one that allows user to send content and one that allows them view received content. The app will only be told once that the user has selected a particular message, so if they minimise the app again and return to "sending content mode" the app won't be notified if they tap that episode again to view its content.


# iMessage app receives no callbacks at all if a message is selected after user scrolls to a different app
1. Launch app
2. Tap insert message
3. Send
4. Swipe to a different iMessage app in the app drawer
5. Tap the message in the conversation view

##  Expected
Message app launches in expanded presentation style and we receive some kind of callback like `didSelectMessage`, `willTransitionToPresentationStyle`, or `didBecomeActiveWithConversation`.

## Actual
Message app launches in expanded presentation style but receives no callbacks whatsoever.