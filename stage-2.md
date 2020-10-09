# 阶段二

## 注意
- 会议的 title 是唯一的。
- 不允许创建会议为一个时间点，比如 8:00 - 8:00
- 关于找出一个时间段内的会议，只要有时间点重叠，都要算上去。
- 若查询过程中输入的日期不合法，直接返回空列表
- 创建会议，在判断会议是否重叠时，允许会议开始时间是另一个会议的结束时间，即一个会议结束后马上开始另一个会议。

## 制品

- 完成AgendaService类（应用逻辑实体）和AgendaUI类（终端交互界面）

## 制品提交方式
提交到个人实训 git 仓库中

## 具体任务

### Task 1：根据需求，实现应用程序功能逻辑设计

#### task 过程相关文档
回忆阶段1的第一个任务，仔细阅读需求。<br />代码文件：include/AgendaService.hpp

#### 具体要求
思考应用程序的功能以及在Storage的基础上的实现

#### 自我检查学习成果，回答问题

- 这是三层架构中的哪部分？
- 再次回答阶段1 Task3.1 中提出的问题。
- 为什么AgendaService只包含Storage的调用，AgendaUI只操作AgendaService的功能接口？

#### 知识与技能
进一步理解三层架构

### Task2.1： 实现数据间交互

#### task过程相关文档
代码文件：include/AgendaService.hpp

#### 具体要求

- 下载教案提供的AgendaService.hpp文件，根据头文件完成AgendaService.cpp的代码编写。AgendaService类通过Storage类统筹管理User和Meeting两个集合的数据实例，从而实现不同实体数据间的逻辑交互。
- 这里我们可以专注数据逻辑，解决各种阶段1留下的“BUG”。
- 编写测试用例，使用 Makefile 编译出可执行的测试（推荐GoogleTest），分成 3 个测试用例，分别测试 createMeeting，deleteMeeting，userRegister
- 创建会议时，会议的发起者和参与者都必须在 User 中
- 删除 User 时，要把该User相关的所有会议都删除
- mail 和 phone 都不需要判断格式的正确性
- 可以创建一个12:00-13:00 13:00-15:00 这样的共同端点时间重叠的会议
- 查询包含时间点重叠的情况，如查询区间为2016-07-08/12:00至2016-07-08/12:00时，时间为2016-07-08/11:00至2016-07-08/12:00的会议可以被查询到。
- 若查询过程中输入的日期不合法直接返回空列表
- 写完以后再考虑：Storage类返回的数据都大部分是std::list类型，思考一次调用产生的性能开销，然后想想怎么样在不改变AgendaService实现的情况下只小幅度改变Storage类，优化过多的性能开销（背景资料参加 C++11右值引用和move语义）

### Task2.2: 实现人机交互命令解释与处理

#### task过程相关文档
代码文件：include/AgendaUI.h

#### 具体要求

- 下载教案提供的AgendaUI.h文件，查阅教案提供的接口约束说明，完成AgendaUI.cpp的代码编写，实现人机交互命令解释与处理。
- 自行编写 src/Agenda.cpp 文件，该文件需要提供整个Agenda工程的main函数，综合之前所有的代码工作，将其整合成一个真正可运行的简单的Agenda系统

## Agenda接口约束
编写一个基于命令行交互方式的应用程序来访问议程管理系统中的信息。<br />**请严格按照接口约束进行输入.**<br />[agendaui基础约束.pdf](https://old-wiki.vmatrix.org.cn/lib/exe/fetch.php?media=%E9%98%B6%E6%AE%B5%E4%BA%8C:agendaui%E5%9F%BA%E7%A1%80%E7%BA%A6%E6%9D%9F.pdf)<br />
<br />[ui_testcases.txt](/static/resources/stage-2/ui_testcases.txt)

## 拓展阅读
[Unit Testing Guidelines](http://geosoft.no/development/unittesting.html)<br />[Unit Testing Guidelines(ZH-CN)](https://github.com/yangyubo/zh-unit-testing-guidelines)<br />[Twelve Benefits of Writing Unit Tests First](http://sd.jtimothyking.com/2006/07/11/twelve-benefits-of-writing-unit-tests-first/)

## 阶段结束
及格的成员进入下一阶段，不及格的成员根据 TA 意见进行整改，获得 TA 许可后方可进入下一阶段，保留整改前的成绩。<br />AgendaService代码部分的任务则需要matrix评测系统上对于题目的截止时间前提交，注意：计算机自动测试，逾时不收。<br />AgendaUI部分的任务需要TA在规定deadline之前实地检查运行情况，根据TA规范手册打分，逾时不接受检查。<br />
