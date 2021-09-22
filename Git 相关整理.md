# GitHub 常用操作
***
### in关键词限制搜索范围：
- seckill in:name     项目名包含seckill 
- seckill in:description    项目描述包含seckill
- seckill in:readme     项目的readme文件中包含seckill
- seckill in:name,readme     组合使用

***
### stars或fork数量关键词查找：
- springboot stars:>=5000
- springboot stars:3000..5000  区间范围
- springboot fork:100..200 stars:80..100  组合使用

***
### awesome加强搜索：
- awesome系列，一半是用来收集学习、工具、书籍类相关的项目
- awesome redis

***
### 高亮显示某一行的代码：
- 地址+#L13
- 地址+#L13-L23

***
### 项目内搜索：
- t

***
### 显示快捷键：
- shift + ？

***
***

# Git 常用命令
***
***
### 初始化命令
##### 查看当前git配置信息： 
- git config --list

##### 设置提交代码时的用户信息
- git config [--global] user.name "[name]"
- git config [--global] user.email "[email address]"

##### 在当前目录新建一个Git代码库
- git init

##### 下载一个项目和它的整个代码版本
- git clone [url]
> 关联远程库，url为仓库地址

##### 与远程仓库关联，也可以直接clone后自动关联
- git remote add origin [url]

***
### 增删命令
##### 添加指定文件到仓库暂存区，可以指定多个文件用空格隔开
- git add [file1] [file2] ...

##### 添加指定目录到暂存区，包括子目录
- git add [dir]

##### 添加当前目录的所有文件到暂存区
- git add .

##### 删除工作区文件，并且将这次删除放入暂存区
- git rm [file1] [file2] ...

##### 停止追踪指定文件，但该文件会保留在工作区
- git rm --cached [file]

##### 改名文件，并且将这个改名放入暂存区
- git mv [file-original] [file-renamed]

##### 查看git本地仓库当前状态
- git status

##### 查看暂存区文件与仓库文件之间的不同修改
- git diff

##### 查看git详细日志，包含不同版本提交、时间、作者（前面配置email和name这里会有用）
- git log

##### 查看简洁化日志 只显示commit信息
- git log --pretty=oneline

##### 查看命令记录，回退版本时可根据命令编号来
- git reflog
> 暂存区域最新commit的差异

##### 显示暂存区和最新commit的差异
- git diff --cached [file]
> 工作区与最新commit的差异

##### 显示工作区与当前分支最新commit之间的差异
- git diff HEAD
> 某次提交的变化

##### 显示某次提交的元数据和内容变化
- git show [commit]
> 提交暂缓区全部，并添加描述

##### 提交暂存区到本地仓库区
- git commit -m [message]
> 提交暂缓区个别文件，并添加描述

##### 如果上一次的commit没有push到远程仓库中，使用如下代码可以修改提交描述
- git commit --amend -m [message]

***
### 分支命令

##### 列出所有本地分支
- git branch

##### 列出所有远程仓库分支
- git branch -r

##### 列出所有本地分支和远程分支
- git branch -a

##### 新建一个分支，但依然停留在当前分支
- git branch [branch-name]

##### 新建一个分支，并切换到该分支(并将该分支设置为远程分支)
- **git checkout -b [branch]** 
- **git push --set-upstream origin [branch]**

##### 切换到指定分支，并更新工作区
- git checkout [branch-name]

##### 重命名分支，
-  git branch -m | -M oldbranch newbranch

##### 新建一个分支，与指定的远程分支建立追踪关系
- git branch --track [branch] [remote-branch]

##### 建立追踪关系，在现有分支与指定的远程分支之间
- git branch --set-upstream [branch] [remote-branch]

##### 合并指定分支到当前分支
- git merge [branch]

##### 选择一个commit，合并进当前分支
- git cherry-pick [commit]

##### 删除分支
- git branch -d [branch-name]

##### 删除远程分支
- git push origin --delete [branch-name]
- git branch -dr [remote/branch]

***
### 标签命令
##### 列出所有tag
- git tag

##### 新建一个tag在当前commit
- git tag [tag]

##### 新建一个tag在指定commit
- git tag [tag] [commit]

##### 删除本地tag
- git tag -d [tag]

##### 删除远程tag
- git push origin :refs/tags/[tagName]

##### 查看tag信息
- git show [tag]

##### 提交指定tag到远程仓库
- git push [remote] [tag]

##### 提交所有tag
- git push [remote] --tags

##### 新建一个分支，指向某个tag
- git checkout -b [branch] [tag]

***
### 远程同步命令
##### 下载远程仓库的所有变动
- git fetch [remote]

##### 显示所有远程仓库
- git remote -v

##### 显示某个远程仓库的信息
- git remote show [remote]

##### 增加一个新的远程仓库，并命名
- git remote add [shortname] [url]

##### 更新下本地的git分支保持和远程分支一致
- git remote update origin --prune

##### 取回远程仓库的变化，并与本地分支合并
- git pull [remote] [branch]

##### 上传本地指定分支到远程仓库
- git push [remote] [branch]

##### 推送所有分支到远程仓库
- git push [remote] --all

***
### 撤销命令
##### 让工作区文件回到最近一次git commit或git add时的状态
- git checkout [file]

##### 恢复某个commit的指定文件到工作区
- git checkout [commit] [file]

##### 恢复上一个commit的所有文件到工作区
- git checkout 

##### 重置暂存区的指定文件，与上一次commit保持一致，但工作区不变
- git reset [file]

##### 重置暂存区与工作区，与上一次commit保持一致
- git reset --hard

##### 重置当前分支的指针为指定commit，同时重置暂存区，但工作区不变
- git reset [commit]

##### 重置当前分支的HEAD为指定commit，同时重置暂存区和工作区，与指定commit一致
- git reset --hard [commit]

##### 重置当前HEAD为指定commit，但保持暂存区和工作区不变
- git reset --keep [commit]


