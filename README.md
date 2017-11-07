# CountDownButton_GCD_DEMO
GCD实现倒计时按钮组件

* 通过dispatch_get_global_queue获取一个并行队列。

* dispatch_source_create设置一个定时器。

* 利用dispatch_source_set_timer实现倒计时。

* 定时器的变化通过dispatch_source_set_event_handler触发，从而在block中完成倒计时。

* 界面UI的刷新则放在主线程中完成。
