# git configuration

`~/.gitconfig-local`:
```
[includeIf "gitdir:~/dotfiles/"]
  path = ~/.gitconfig-personal

[includeIf "gitdir:~/Projects/example-a/"]
  path = ~/.gitconfig-example-a

[includeIf "gitdir:~/Projects/example-b/"]
  path = ~/.gitconfig-example-b
```

`~/.gitconfig-personal`:
```
[user]
    name = Morgan Humes
    email = morgan@lanaddict.com
[core]
    sshCommand = "ssh -i ~/.ssh/id_rsa_github_morganhumes"
```

`~/.gitconfig-example-a`:
```
[user]
    name = Morgan Humes
    email = morgan-a@example.com
```

`~/.gitconfig-example-b`:
```
[user]
    name = Morgan Humes
    email = morgan-b@example.com
```
