# 参考改进的想法

**这些只是例子，完全可以做其他有创意的扩展**
<a name="e84ea5c7"></a>
## Agenda Storage IO以及Agenda Service的日志功能（最多5分）
编写一个单例的LOG类，在Agenda服务运行的时候记录StorageIO和Service的操作以供错误追踪。<br />要求把操作的时间用户记录下，并写入文件方便查阅。<br />高级要求：限定log文件的大小，如每10MB会分割log文件。（+5分）
<a name="4235fa2b"></a>
## 中断信号捕获与处理（最多5分）
捕获从键盘输入的信号如“CTRL + C”程序终止信号，让Agenda就收到终止信号后会先把记录写入文件保持好数据在终止程序而不是直接终止。<br />Hint：学习操作系统中信号量的知识。
<a name="9f32ab34"></a>
## 异常处理以及错误信息返回（最多5分）
在阶段二中创建会议出错是直接返回“error”，用户并不知道是为什么创建失败。<br />在UI层采用try catch机制捕获从AgendaServer中抛出的异常，再处理反馈给用户。<br />Hint：添加一个异常类。
<a name="6e5d7e53"></a>
## 网络编程（最多50分）
使用tornado或者Flask等服务器框架第三方库实现一个Agenda网络服务器，进一步分离Service和UI，对外提供多用户支持。<br />这可能需要用python或者nodeJs重构下代码架设起服务器，再编写一个客户端发送请求到服务器进行操作。
<a name="5d5b49b7"></a>
## 更友好的用户接口（最多10分）
可以尝试实现更友好的Terminal UI 或者使用GTK+、QT、wxWidgets等库实现GUI。
