#!/usr/bin/python
print
#---下载文件到本地

# git clone  git@github.com:dadiqq/nework-git.git
上传 
print env GIT_SSL_NO_VERIFY=true git push

[root@ora11g etl]# echo 'unset SSH_ASKPASS' >> ~/.bashrc && source ~/.bashrc   
查看远程库
#env GIT_SSL_NO_VERIFY=true  git remote show origin

下载
#env GIT_SSL_NO_VERIFY=true   git clone https://github.com/dadiqq/nework-git.git


https://github.com/dadiqq/nework-git.git  
 #git clone  git@github.com:dadiqq/nework-git.git

#git clone --no-checkout https://github.com/dadiqq/nework-git.git tmp
mv tmp/.git   ./nework-git/.git
rmdir tmp
cd nework-git
git reset --hard HEAD

git config --global user.name "cglmq-vm"
git config --global user.email "gylimingqi@163.com"
git config --global push.default simple
git remote add origin git@github.com:toughhou/etl.git

todady git push
cglmq change gitpush
env GIT_SSL_NO_VERIFY=true git push ----上传文件到github 
mkdir .ssh 
cd .ssh 
ssh-keygen -t rsa -C 
ll 
a. 登陆 github >account setting>ssh keys
b. add ssh keys
c.  title 随便  key id—_rsa.pub 拷贝
测试 ssh -T git@github.com
echo 'unset SSH_ASKPASS' >> ~/.bashrc && source ~/.bashrc 
git config --global push.default simple
git config --global push.default matching
git push -u origin master

git remote add oriin git@github.com:toughhou/etl.git
---//使用git协议定义远程服务器别名origin

git push -u origin master
luck today

//用ssh-keygen命令来生成密钥对，passphrase我们输入或不输入都行。
[root@ora11g .ssh]# ssh-keygen -t rsa -C "toughhou@126.com"
id_rsa.pub就是公钥文件，id_rsa就是密钥。


	* 设置github上的公钥

步骤如下：
    a. 登陆github后 -> "Account Setting" -> "SSH Keys"
    b. "Add SSH Key"
    c. Title随便填写一个，Key那里我们把把id_rsa.pub里的内容拷贝进去。

//好了之后用以下命令测试，若显示信息如下，则说明设置成功了。
[root@ora11g etl]# ssh -T git@github.com
Hi toughhou! You've successfully authenticated, but GitHub does not provide
shell access.
//git初始化
[root@ora11g etl]# git init
Initialized empty Git repository in /root/etl/.git/
 
[root@ora11g etl]# touch readme.txt
[root@ora11g etl]# git add readme.txt
 
//使用git协议定义远程服务器别名origin
[root@ora11g etl]# git remote add origin git@github.com:toughhou/etl.git
此处需要注意：
    git默认使用https协议，每次pull或push都要输入密码，比较麻烦。而且因为操作系统版本及一些库文件不全，设置起来很繁琐。
    我们这里使用git协议，然后使用ssh密钥。这样可以省去每次都输密码。
    用https协议方式定义远程服务器别名：git remote add origin
https://github.com/toughhou/etl.git
//查看你当前的remote url
[root@ora11g etl]# git remote -v
origin  https://github.com/toughhou/etl.git (fetch)
origin  https://github.com/toughhou/etl.git (push)
//commit
[root@ora11g etl]# git commit -m "First commit!!"
//push
[root@ora11g etl]# git push -u origin master
push完成之后，登陆github
(https://github.com/toughhou/etl)查看，文件已经同步上去。
测试完成。
//文中提到的如果用的是https协议的话，效果如下。push时需要输入密码。
[root@ora11g etl]# git remote add origin9 https://github.com/toughhou/etl.git

[root@ora11g etl]# git push -u origin9 master
Username for 'https://github.com': toughhou
Password for 'https://toughhou@github.com':
[root@ora11g etl]# echo 'unset SSH_ASKPASS' >> ~/.bashrc && source ~/.bashrc


用https协议的话，可能会碰到一些问题。这里把我碰到的问题及解决方式记录如下：
 
[root@ora11g etl]# git push -u origin master
error: SSL certificate problem, verify that the CA cert is OK. Details:
error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate verify
failed while accessing
https://github.com/toughhou/etl.git/info/refs?service=git-receive-pack
fatal: HTTP request failed
[root@ora11g etl]# curl http://curl.haxx.se/ca/cacert.pem -o
/etc/pki/tls/certs/ca-bundle.crt
  % Total    % Received % Xferd  Average Speed   Time    Time     Time
  % Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  244k  100  244k    0     0   7785      0  0:00:32  0:00:32 --:--:--  2690

[root@ora11g etl]# git push -u origin master
(gnome-ssh-askpass:14850): Gtk-WARNING **: cannot open display:  
error: unable to read askpass response from
'/usr/libexec/openssh/gnome-ssh-askpass'
Username for 'https://github.com': toughhou
(gnome-ssh-askpass:14856): Gtk-WARNING **: cannot open display:  
error: unable to read askpass response from
'/usr/libexec/openssh/gnome-ssh-askpass'
Password for 'https://toughhou@github.com': 
Branch master set up to track remote branch master from origin.
Everything up-to-date
 
[root@ora11g etl]# echo 'unset SSH_ASKPASS' >> ~/.bashrc && source ~/.bashrc

[root@ora11g etl]# git push -u origin master                                
Username for 'https://github.com': toughhou
Password for 'https://toughhou@github.com': 
Branch master set up to track remote branch master from origin.
Everything up-to-date
 

