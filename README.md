# DCObserver
Convenient Methods For KVO and NSNotification. You do not need to care about what time to remove observer.

使用 KVO 和 NSNotification 的便利方法, 你不需要关心何时移除观察者/监听者.

### 如何安装

安装
==============

### CocoaPods

1. 在 Podfile 中添加  `pod 'DCObserver'`。
2. 导入 \<DCObserver/DCObserver.h\>。


### 手动安装

1. 下载 DCObserver 文件夹内的所有内容。
2. 将 DCObserver 内的源文件添加(拖放)到你的工程。


使用
==============

##warning: 需使用弱引用 weakSelf 避免循环引用

###方便的使用 KVO, NSNotification, 不用在关心何时移除观察者

```objc
[target dc_addObserverBlockForKeyPath:@"keypath" block:^(id  _Nonnull __weak obj, id  _Nullable oldVal, id  _Nullable newVal) {

    // obj == target 
    // oldVal : the old value of keypath
    // newVal : the new value of keypath
    // ...
}];

[target dc_addObserverBlockForNotificationName:@"aNotificationName" block:^(id  _Nullable __weak obj, NSNotification * _Nonnull noti) {

    // obj == noti.object 
    // noti : aNotification which name is 'aNotificationName'
    // ...

}];

```

###KVO - 同一观察者, 多个路径下, 不需要再 if/else ,一句代码搞定

```objc
// 同一个观察者观察多个路径的操作

[targetOne dc_addObserverBlockForKeyPath:@"keypath1" block:^(id  _Nonnull __weak obj, id  _Nullable oldVal, id  _Nullable newVal) {
    // do something...
}];

[targetOne dc_addObserverBlockForKeyPath:@"keypath2" block:^(id  _Nonnull __weak obj, id  _Nullable oldVal, id  _Nullable newVal) {
    // do something...
}];

[targetOne dc_addObserverBlockForKeyPath:@"keypath3" block:^(id  _Nonnull __weak obj, id  _Nullable oldVal, id  _Nullable newVal) {
    // do something...
}];

```
###KVO/NSNotification 支持 同一路径的观察/ 同一名称的通知  下, 可以实现多个操作的支持

```objc

// 同一个观察者观察多同一路径的多个操作
// KVO
[targetOne dc_addObserverBlockForKeyPath:@"keypath1" block:^(id  _Nonnull __weak obj, id  _Nullable oldVal, id  _Nullable newVal) {
    // do something...
}];

[targetOne dc_addObserverBlockForKeyPath:@"keypath1" block:^(id  _Nonnull __weak obj, id  _Nullable oldVal, id  _Nullable newVal) {
    // do another thing...
}];

// 同一个观察者监听同一通知的多个操作
// NSNotification

[targetOne dc_addObserverBlockForNotificationName:@"aNotificationName" block:^(id  _Nullable __weak obj, NSNotification * _Nonnull noti) {
    // do something...
}];

[targetOne dc_addObserverBlockForNotificationName:@"aNotificationName" block:^(id  _Nullable __weak obj, NSNotification * _Nonnull noti) {
    // do another thing...
}];


```

#### 更多 API 参照 DCObserver.h



许可证
==============
DCObserver 使用 MIT 许可证，详情见 LICENSE 文件。
