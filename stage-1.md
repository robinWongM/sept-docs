# 阶段一

根据需求和 UML 设计编写高质量的底层程序。本阶段除交叉检查外，其余均皆为个人任务。

提醒，这个阶段所有的参考文档（makefile, linux, CSV+rfc）请到查看

## 制品
完成 Date 类，User 类，Meeting 类，Storage类

## 步骤
**请留意每个 Task 前后的文档更新！**

**请不要对头文件进行任何改动**

### Task 1：项目启动准备

#### 过程相关文档
[Agenda 需求文档](/requirements.md)

[参阅资料 Google C++ Style Guide(中文版)](https://zh-google-styleguide.readthedocs.io/en/latest/google-cpp-styleguide/contents/)

[三层架构菜鸟介绍](https://blog.csdn.net/hanxuemin12345/article/details/8544957)

#### 具体要求

- 阅读项目需求文档，任务要求，需要学习的知识和技能
- 初步熟悉阶段一每个task的任务
- 结合三层架构资料和Agenda文档的阅读，把握和理解Agenda的设计模式层次。
- 环境已经配置在云桌面里，需要熟悉开发工具：如果想自己在笔记本里配置环境，这里给出参考：

编译器：G++\Clang++ 编辑器：vim\emacs\gedit….随你喜欢

### Task 2.1: 识别数据实体对象及其关系

#### task 过程相关文档
（注意：有错误，看图就好，没有MeetingManage这个东西）

[user_class_diagram_and_code.pdf](/static/resources/stage-1/user_class_diagram_and_code.pdf)

相关代码：include/User.hpp

#### 具体要求

- 学习User对象的UML表示；例如，对象的名称、属性、get/set方法
- 分析如何从需求文档中识别User对象的名称，属性
- 将对象的UML表示转换成合格的C＋＋代码；例如User对象的部分代码，User.hpp
- 实现User对象的其他代码，即实现对应的User.cpp

#### 自我检查学习成果，回答问题

- 你在编码前确定编码规范了吗？和你的同学交叉检查代码并给出建议。
- 用自己的语言说明图表示类与直接用 C++ 编写类的优缺点。

#### 知识与技能

- 类的表示方法
- 代码规范，交叉检查
- 识别类与属性

### Task 2.2：识别会议类属性并给出程序

#### task 过程相关文档
[meeting_class_diagram.pdf](/static/resources/stage-1/meeting_class_diagram.pdf)（注意：meeting类的成员函数和属性有删改，以头文件为准）

相关代码：include/Meeting.hpp include/Date.hpp

> [!NOTE|label:对于会议时间显示的额外补充]
> 1. 时间格式为`yyyy-mm-dd/hh:mm`（年的范围是 1000 ~ 9999）
> 2. 输入的时间，应该能够判断时间是否合理，如 2 月不会有 31 号此类、年月日小时分的合理范围，但不比较输入的时间是否过时。
> 3. 在`stringToDate`方法中，输入的时间字符串严格按照`yyyy-mm-dd/hh:mm`格式输入，类似于 2016-7-08/01:00 的输入是不合法的，因为月份中 7 前没有按照 mm 格式（07）格式输入，正确的格式为 2016-07-08/01:00，如果输入的字符串不符合格式就返回一个年月日等都是 0 的 Date 类。
> 4.对于 dateToString 的输出 2012-7-19/20:51 这种是不对的，应该输出 2012-07-19/20:51，即对于不满 10 的数字，应该补 0

#### 具体要求

- 从需求文档中识别Meeting对象的名称，属性
- 实现对象Meeting类的UML表示
- 根据Meeting类的UML表示实现Meeting类的C＋＋代码，包括Meeting.hpp和Meeting.cpp
- 完成Date类的C++代码，包括Date.hpp和Date.cpp

#### 自我检查学习成果，回答问题

- 下载教学资料中的Meeting类，检查是否存在差异。如存在差异，订正。
- 和你的同学交叉检查代码，说明交叉检查与自我检查的区别。
- 完善你的设计和代码。

### Task 2.3：学习识别数据实体之间的关系

#### task 过程相关文档
[user_meeting_class_diagram.pdf](/static/resources/stage-1/user_meeting_class_diagram.pdf)（注意：meeting类的成员函数和属性有删改，以头文件为准）

#### 具体要求
实体之间关系的 UML 表示；例如：User与Meeting之间的关系，一个User可以有多个由他发起的会议，一个User可以有多个他被邀请参加的会议，一个User既可以有多个由他发起的会议也可以有多个他被邀请参加的会议。

#### 自我检查学习成果，回答问题

- 不必急于实现复杂代码。为什么？
- 到目前为止，用自己的语言描述UML图表示法的作用。

#### 知识与技能

- 将 UML 设计图转化为代码
- STL 预备知识
- 识别数据对象之间的关系

### Task 3.1：管理实体数据对象入门

#### task 过程相关文档
![storage.png](/static/resources/stage-1/storage.png)

![all.png](/static/resources/stage-1/all.png)（注意：meeting类的成员函数和属性有删改，以头文件为准）

[C++参考Lambda表达式](https://zh.cppreference.com/w/cpp/language/lambda)

[MSDN_C++Lambda1](https://msdn.microsoft.com/zh-cn/library/dd293608.aspx)

[MSDN_C++Lambda2](https://msdn.microsoft.com/zh-cn/library/dd293599.aspx)

关代码：include/Storage.hpp

#### 具体要求

- 阅读管理对象的UML表示；为了简化设计，通常我们会设计一个类管理数据实体集合的创建、查询、修改与删除。
- 使用或设计合适的数据结构来保存User和Meeting的数据集合。
- 将UML图转换成代码。请实现CRUD操作。
- 所有可能的应用相关逻辑，例如title的重名检查之类，全部放到后面，不必在Storage类里实现。

#### 自我检查学习成果，回答问题

- createUser()方法可能会导致User重名BUG，deleteUser()中你可能存在这样的 BUG，即你删除了一个用户，但该用户创建或参与的会议没有同步删除。结合三层架构想想，为什么我们先不管他，而是提供泛型接口，只管理数据模型和存储，把所有的应用相关逻辑放到后面处理？这样设计有什么好处？

#### 知识与技能

- 将UML设计图转化为代码

* STL编程
- C++ 11 编程

### Task3.2：管理实体数据

#### task过程相关文档

相关代码：include/Storage.hpp include/Path.hpp

#### 具体要求

- 请参阅教案提供的设计模式Singleton类的案例和讲解，实现Storage的getInstance()方法。

#### 自我检查学习成果，回答问题

- 交叉检查代码，重点检查注释的准确、合理性；主要方法是否能抵御非法输入，给你的同学一些中肯的建议。
- 用自己的语言描述 Singleton 设计模式和使用条件。
- 选择一个较复杂的方法，应用伪代码做设计。

#### 知识与技能

- 同 Task 2.1
- 伪代码在程序设计中的应用
- 设计模式的概念。

### Task3.3：持久化实体数据

#### Task 过程相关文档
Agenda数据文件格式要求（CSV 及RFC标准）：[https://en.wikipedia.org/wiki/Comma-separated_values](https://en.wikipedia.org/wiki/Comma-separated_values)

相关代码：include/Storage.hpp include/Path.hpp

说明文档：[storage.pdf](/static/resources/stage-1/storage.pdf)

#### 具体要求

- 请参阅提供的文档，实现Storage的文件IO处理方法(readFromFile, writeToFile)。
- 保存的文件统一叫做 User.csv, Meeting.csv
- 文件路径保存在静态类Path.hpp。

#### 自我检查学习成果，回答问题

- 交叉检查代码，重点检查注释的准确、合理性；主要方法是否能抵御非法输入。
- 如何判断一个文件是否存在？

#### 知识与技能

- fstream 流的使用
- CSV的掌握

### Task4：检查与评估

#### Task 过程相关文档
请到[学习资料](/resources.md)学习关于 Google Test 的知识。

#### 具体要求

- 使用 Google Test 或者其他方式进行测试
- 测试 CRUD 相关函数
- 额外自定义 2 - 3 个测试(自选，不要求完成，完成可相应加分)
- 完成组员间交叉检查测试结果
- 填写阶段一个人测试记录表和交叉测试记录表

#### 自我检查学习成果，回答问题

- 为什么要编写单元测试？
- 使用 Google Test 测试有什么好处？

#### 知识与技能

- Google Test 的测试方法（不要求）
- 使用 Makefile 编译出可执行的测试例子

## 代码规范检查
[cpplint.py](/static/resources/stage-1/cpplint.py)

检查命令
```bash
python cpplint.py --filter=-legal/copyright,-build/header_guard,-build/include,-readability/streams src/*.hpp src/*.cpp
```
请确保您所使用的 python 版本为 2.x.x，检查命令为 `python --version`

## 阶段结束
及格的成员进入下一阶段，不及格的成员根据 TA 意见进行整改，获得 TA 许可后方可进入下一阶段，保留整改前的成绩。

代码部分的任务则需要在matrix中题目提交截止时间之前提交到系统，注意：系统到期自动测试，逾时不收。
