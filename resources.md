# 学习资料

本页面的学习资料由往届师兄师姐提供，如果你有更好的教程欢迎投稿到 vmatrix@aliyun.com

## CSV 格式

[CSV RFC4180 标准文档.pdf](/static/resources/common/csv_rfc4180_standard.pdf)

## Linux 指令入门

[快乐的 Linux 命令行.pdf](/static/resources/common/tlcl-en-cn.pdf)

[Linux 指令入门.pdf](/static/resources/common/linux-command-quickstart.pdf)

## Git 入门

[Git 简明指南.pdf](/static/resources/common/git-guide.pdf)

[图解 Git.pdf](/static/resources/common/visual-git-guide.pdf)

## Google Test 云平台使用方法

[Google Test 简介与基本用法.pdf](/static/resources/common/gtest-installation.pdf)

关于 Google Test 的安装，云桌面环境已经安装好了 Google Test 框架，你在编写 C++ 代码时可以直接通过 `#include <gtest/gtest.h>` 的方式导入 Google Test 头文件。<br />编译时需要链接 Google Test 的库，方法是在编译参数最末尾添加 -lgtest_main -lgtest，比如：
```bash
g++ User.cpp Storage.cpp Date.cpp Meeting.cpp UserTest.cpp StorageTest.cpp -o unit_test -lgtest_main -lgtest -lpthread
```
这样运行 `./unit_test` 就可以看到 Google Test 的测试结果了。

## Makefile 简介

[Makefile 简介.pdf](/static/resources/common/makefile-introduction.pdf)

## 基础的 gdb 应用指南

[不只是 gdb.pdf](/static/resources/common/more-than-gdb.pdf)

## C++ 1x 学习

[An Introduction to C++ 1x.pdf](/static/resources/common/c_1x_introduction_by_matrix_c_and_7_.pdf)
