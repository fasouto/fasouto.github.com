---
layout: post
title: "Unix tips and tricks"
description: "Master the command line"
category: 
tags: []
published: true
---
{% include JB/setup %}

In 1986 [Jon Bentley](http://en.wikipedia.org/wiki/Jon_Bentley) asked to [Donald Knuth](http://en.wikipedia.org/wiki/Donald_Knuth) to write a program using the literate programming paradigm. This code will be published in a ACM magazine along with a critique by Doug McIlroy.

The task was this:
> Read a file of text, determine the n most frequently used words, and print out a sorted list of those words along with their frequencies.

Knuth wrote his program in WEB, a literate programming system. He wrote a good solution for this task using a custom data structure, but McIlroy published a 6 line shell pipeline that do the same as the Knuth 10+ pages.

`
   tr -cs A-Za-z '\n' |
   tr A-Z a-z |
   sort |
   uniq -c |
   sort -rn |
   sed ${1}q
`

Knuth is an excellent programmer, but McIlroy was able to do it in a more readable, simple way, thanks to the Unix philosophy. 

Unix knowledge can save you a lot of time.

## Master the history

Using the history efficiently can help to avoid repetitions.

The `history` command show a list of recently run commands with a numeric id. 
`!<number>` will run the associated command in history. 

`!!` repeat the latest command, so `sudo !!` run the last typed command as root.

`!-N` run the nth most recent command, so `!-1` run the most recent command, `!-2` the previous one… and so on.

`!<string>` will run the most recent command that start with &lt;string>

`!<string>?` run the most recent command that contains &lt;string>

`!*` Running a second command with the same arguments as the previous command, use `!*` to repeat all arguments,`!$` get the final argument and `!^` the first.

`!:N` will get the Nth argument, `!:1` get the first, `!:3-4` the third and fourth…

`!:*` get all the arguments without the command.

`$_` will get last argument 

When running commands, sometimes I'll want to run a command with the previous ones arguments. To do that, you can use this shortcut:

	$ mkdir /tmp/new
	$ cd !!:*

And if you make a typo, you can run the previous command replacing foo for bar, like this.

`^foo^bar` 

## Useful aliases

I have more useful aliases on my [dotfiles on github](https://github.com/fsouto/dotfiles/blob/master/.aliases)

#### Prevent accidents

The -i or --interactive argument will ask you to confirm before do any destructive change.

`alias cp='cp -i'`

`alias mv='mv -i'`

`alias rm='rm -i'`


#### Tar and untar

I never remember how to tar/untar, luckily I have this in my aliases

`alias mkgz="tar -cvzf"`

`alias untar="tar -xvzf"`


#### MacOSX

To flush the DNS cache:

Snow Leopard: `alias flush="dscacheutil -flushcache"`

Lion or Mountain Lion: `alias flush="sudo killall -HUP mDNSResponder"`

To open a file in quicklook:

`alias ql="qlmanage -p 2>/dev/null "`


## Readline

To move along the text is important to be confortable with readline. I printed [this realine cheatsheet](http://www.bigsmoke.us/readline/shortcuts) and have it near my computer: 

##### The basics 

`Crtl + a` move the cursor to the start of the line

`Crtl + e` move the cursor to the start of the line

`Crtl + r` to search previous typed commands

`Crtl + g` to abort an incremental search an go back to the line


## Python tricks

#### Pretty print JSON

Sometimes you need to print a json file on a readable form:

`cat file.json | python -mjson.tool`

#### Run a web or mail server

Serves the current directory in HOSTNAME:8000 or HOSTNAME:port

`python -m SimpleHTTPServer [port]` 

Now imagine this scenario: you want to test an application that send emails, but you are too lazy to install and configure an email server. With this command all the emails received will be printed to the stardart output.

`python -m smtpd -n -c DebuggingServer localhost:25` 

Both examples demonstrate the usefulness of `if __name__ == '__main__'`. In both cases the modules can be consumed as a library and as a command-line script at the same time.


## Use Rsync 

I used to upload files to my servers using ftp or scp until I discovered rsync(remote sync). Rsync copies the diffs of files that have changed, compressed and using ssh. With rsync it's trivial to synchronize a lot of directories between servers, to do this I just need to type:

`rsync -avz /var/dir/ user@server:/var/`


## Misc

#### Job control with disown

This command is incredibly useful, sometimes you forgot to start a time consuming command with nohup or screen and you need to go offline while the command is still running. You can pause it with `crtl-z` move it to the background with `bg`and then protect it from SIGHUP using `disown`, so you can quit your ssh session.

`disown jobID`


#### Make a directory tree quicker

Usually I create a directory tree one at a time:

	$ mkdir tmp
	$ cd tmp
	$ mkdir foo
	$ cd foo
	$ mkdir bar
	…


But it's faster to use the -p option of mkdir. So instead of this I just need to type:

`$ mkdir -p tmp/foo/bar`

You can use -p to create more complicated directory trees, like:

`$ mkdir -p my_project/{foo/tests,bar,settings/{dev,staging,prod},alice/bob/whatever}`

this creates the following tree:


	$ tree
	.
	└── my_project
		├── alice
		│   └── bob
		│  	 └── whatever
		├── bar
		├── foo
		│   └── tests
		└── settings
			├── dev
			├── prod
			└── staging

#### Move a file without type the name twice

[From shell-fu](http://www.shell-fu.org/lister.php?id=46)

`cp ReallyLongFileNameYouDontWantToTypeTwice{,.orig}`


#### Return to the previous directory

Sometimes you are required to hop between two directories, in those cases you can use
` cd - ` to return to the previous directory.

#### Quickly empty a file

` >file ` empty a file

#### Typing long or tricky commands

` fc ` Open an text editor to write your command

#### Get your external IP

` curl ifconfig.me `


#### Show ascii table

`man ascii` quickly access the table of ascii characters


#### Make your terminal talk (OSX only)

From [http://xkcd.com/530/](http://xkcd.com/530/)

`say "hey im locked out downstairs"`

#### ASCII art username

`banner $USER` Ok, maybe not the most useful command…

#### ASCII movie
`telnet towel.blinkenlights.nl` Pop some popcorn and enjoy the show :)
