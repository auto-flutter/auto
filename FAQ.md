#### Why is the scroll position inaccurate during playback when scrolling continuously and quickly?
This is because Flutter will create a ballistic simulator to simulate the subsequent drag behavior after the drag event ends. To avoid this problem, you need to ensure that the next scroll is only performed after the current scroll is completely stopped.

<br>

#### Authorized actions cannot be captured?
This is because authorized pop-up windows are system-level and cannot be captured. To avoid this problem, please grant the required permissions to the application in advance (if it is Android, you can use `adb` for authorization).
