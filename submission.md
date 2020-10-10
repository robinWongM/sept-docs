# 代码提交方式

本次实训代码采用 git 方式提交，评测系统会在拉取每位同学的仓库，并对 master 分支上的代码进行评测，请使用以下方法来获取初始代码以及提交代码。

关于 git 命令的更多使用资料，请参考 [学习资料](/resources.md)

> [!NOTE|label:访问限制]
> 本次实训代码的提交`push`**仅能在云桌面中进行**，请使用云桌面访问相关服务。
>
> 你可以在宿舍里使用自己的电脑登录云桌面完成实训任务，不一定需要到实验室。到实验室可以获得 TA 的面对面指导。

> [!NOTE|label:云桌面事项]
> 云桌面客户端下载地址：[http://sysu.vinzor.net/auth/download](http://sysu.vinzor.net/auth/download)。部分杀毒软件可能会将下载的云桌面客户端自动删除，若有类似情况请考虑将云桌面客户端加入白名单或临时禁用杀毒软件。
>
> 打开云桌面（Vinzor.exe）后验证服务器填写 [http://sysu.vinzor.net](http://sysu.vinzor.net)，直接确定。选择用户登录，用户名和密码都是你的学号。
>
> 云桌面开放时间段：**实训当天的 9:00 ~ 21:00**。注意云桌面内你保存的数据在 21:00 之后会**清空**，因此请你在 21:00 之前将未完成的数据保存到 Git 仓库中。


## 获取代码

我们已经准备好了 Agenda 项目所需的头文件，请同学们直接执行以下命令获取初始代码。 

```bash
git clone https://matrix.sysu.edu.cn/git/用户名/agenda-2020
```

git 服务器验证用户是你登录 Matrix 系统的账户密码。例如你的学号为 20345678，请执行 

```bash
git clone https://matrix.sysu.edu.cn/git/20345678/agenda-2020
```

提示输入用户名和密码时直接输入你的 Matrix 账户密码。

> [!NOTE]
> Matrix Git 服务器暂未提供 Web UI 界面，请使用 git 命令行访问。


## 提交代码

> [!NOTE]
> **请经常性地**使用 `git status` 命令查看自己的 git 仓库状态！
>
> Untracked 的含义是这个文件从来没被添加到仓库中，Modified 是指文件有修改。  
> 无论如何，都需要 `git add` 再 `git commit` 后才能真正将修改存进仓库里。

首先检查自己的代码状态：

```bash
git status
```

然后将文件添加到暂存区中：

```bash
git add [文件名]
```

然后将文件 commit：

```bash
git commit -m "commit 的信息"
```

我们建议你在不同的分支上完成自己的代码，使用如下命令将分支上的代码推送到服务器上：

```bash
git push origin [分支名]
```

推送完成后，不会启动评测，需要到课程系统的题目页面手动请求评测。

> [!NOTE|label:查看代码的历史版本]
> Matrix 没有提供代码浏览器，如果你想回退到某个版本请使用 git checkout 命令。  
> 如需评测，你可以在题目页面点击提交按钮启动评测。评测系统会拉取各位 master 分支上指定 commit 的代码进行评测。

> [!ATTENTION|label:不要提交没有完成的 cpp 文件]
> 评测系统会编译 src 目录下的所有 cpp 文件，如果你提交了没做完的 cpp 会导致编译错误。但评测只会检查题目标注的类是否实现正确。  
> 因此，请善用分支功能，在分支上进行开发，完成后再合并到主分支提交。

评测使用的 Makefile 如下（$DEST 变量指的是最终生成的可执行文件的名字，你可以直接在 Makefile 里写死一个，也可以通过执行 `DEST=XXX make` 来临时指定一个）：

```makefile
CC := g++
FLAGS := -std=c++2a -w -g -pthread
INC_DIR := include
SRC_DIR := src
BUILD_DIR := build
BIN_DIR := bin
TEST_DIR := test
INCLUDE := -I./$(INC_DIR)
TEST_LIBRARY := -lgtest -lgtest_main
 
SOURCE_FILES=$(shell find $(SRC_DIR) -name '*.cpp')
OBJS=$(patsubst $(SOURCE_FILES)/%.cpp,$(BUILD_DIR)/%.o,$(SOURCE_FILES))
 
$(DEST): $(OBJS)
    @mkdir -p $(BIN_DIR)
    $(CC) $(FLAGS) $(INCLUDE) $^ -o $@ $(TEST_LIBRARY)
 
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
    @mkdir -p $(BUILD_DIR)
    $(CC) $(FLAGS) $(INCLUDE) -c -o $@ $<
```

> [!TIP|label:可以推送其他分支]
> 你也可以将其他分支推送到服务器进行备份，不会影响评测。评测系统仅会拉取 `master` 分支。

> [!ATTENTION|label:不要提交可执行文件到仓库中]
> 请编辑自己的 `.gitignore` 文件，避免提交编译出来的二进制文件被提交到仓库中。Git 仓库有总体积限制。

> [!WARNING|label:及时备份代码]
> 云桌面关闭后会清空每位同学云桌面中的内容，请注意及时推送代码到服务器上。否则，后果自负。

## 同步上游代码
如果我们更改了头文件，或添加了其他文件，我们会在 [https://matrix.sysu.edu.cn/git/agenda-2020](https://matrix.sysu.edu.cn/git/agenda-2020) 这个仓库中更新，你可以直接 clone 这个仓库，然后将文件复制到自己的仓库中。或者在自己的仓库中采用以下的方式同步更新。

```bash
git remote add upstream https://matrix.sysu.edu.cn/git/agenda-2020
git fetch upstream
git checkout 你的开发分支或者主分支
git merge upstream/master
```