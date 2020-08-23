# Sync Repository Action



## 生成新的SSH密钥

`SSH_KEY`: 创建一个 [SSH key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key) ，将公钥`id_rsa.pub`保存到[Github SSH keys](https://github.com/settings/keys)、和[Gitee SSH公钥](https://gitee.com/profile/sshkeys),将私钥`id_rsa`在 GitHub 项目的 Settings -> Secrets 路径下配置好 GITEE_KEY

<img src="img\1.jpg" style="zoom:50%;" />


## Example workflow

```
name: Sync Repository Action
on:
  push:
  schedule:
    # 每天北京时间0点同步
    - cron:  '0 16 * * *'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Sync to Gitee
      uses: x-dr/sync-repo-to-gitee@master
      env:
          # 在 Settings->Secrets 配置 GITEE_KEY
          SSH_KEY: ${{ secrets.GITEE_KEY }}
      with:
          # 注意替换为你的 GitHub 源仓库地址
          github-repo: "git@github.com:x-dr/sync-repo-to-gitee.git"
          # 注意替换为你的 Gitee 目标仓库地址
          gitee-repo: "git@gitee.com:goindex/sync-repo-to-gitee.git"
```


