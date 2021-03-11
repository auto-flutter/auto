#### Why is the scroll position inaccurate during playback when scrolling continuously and quickly?

<br>

This is because Flutter will create a ballistic simulator to simulate the subsequent drag behavior after the drag event ends. To avoid this problem, you need to ensure that the next scroll is only performed after the current scroll is completely stopped.

