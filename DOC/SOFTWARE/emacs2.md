Emacs 

node --harmony-async-await app.js
emacs -nw      (no window; does not open a emacs editor in a gui)



Remember Ctrl-g is used to cancel current command. If you are stuck in wrong key sequence just press Ctrl-g to cancel it.

EXIT/QUIT   CTRL X + CTRL C

C-x (CTRL + x)


Window
C-x 2 : split the active window vertically into two horizontal windows
C-x 3 : split the active window horizontally into two vertical windows
C-x o : change active window to next window
C-x 0 : close the active window
C-x 1 : close all windows except the active window
C-x ^ enlarge window

Buffer
C-x b : buffer switch
C-x right : right-cycle through buffers
C-x left : left-cycle through buffers
C-x k : kill buffer

File  (TWO TIME CONTROL )
C-x C-f : open file
C-x C-s : save file
C-x C-w : save file as

Find
C-x 4 f find 

Copy paste
C-w   cut
M-w  copy
C-y   paste
C-_   undo

ALT (M-)

M-x  macro-name  (Alt X)  execute macro-name  
M-x list-packages   (=ALT x list-packages ENTER )
M-x package-install

M C-v scroll other window


Copy-Paste
C-w
Cut (after you Mark and move to other end)
M-w
Copy (after you Mark and move to other end)



Links

http://ergoemacs.org/

http://www.rgrjr.com/emacs/emacs_cheat.html


Spacemacs

Spacemacs already brings TypeScript support via its typescript layer. It basically sets up the tide mode (which also needs a few things set up like nodejs,etc..).
SPC  oder    ALT M

Key bindings
https://gist.github.com/adham90/0d85d023f9d4f1dd28ef
Project-ile
SPC p l    project list
SPC p t 	     project tree  
Autocomplete / Helm
Autocomplete    -  Auto complete from current buffer and all other open buffers.
Auto-completion: pressing TAB brings up an interface for identifier completion.
Helm      suggestions by semantics http://tuhdo.github.io/helm-intro.html
SPC p h (helm projectile)

Magit - best git client ever

C# Development

https://github.com/OmniSharp/omnisharp-emacs
Install curl
Omnisharp server  https://github.com/OmniSharp/omnisharp-server
git clone https://github.com/OmniSharp/omnisharp-server.git
cd omnisharp-server
git submodule update --init --recursive
xbuild
Add MELPA packages:
Put into ~/.emacs file:
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
M-x package-install omnisharp RET



init.el file:
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)
Plugins
Ace-jump mode (like EasyMotion in vim).
ag (the silver searcher) integration (vim-ack equivalent).

Python:  Jedi or Epc


HTML / Javascript
REPL in EMACS.
https://github.com/NicolasPetton/jade/blob/master/readme.md
Emacs vs. WebStorm For Node.js Development https://spin.atomicobject.com/2016/01/26/webstorm-nodejs-development/
https://simpletutorials.com/c/2818/How+to+setup+Spacemacs+for+JavaScript+auto-complete+and+go-to-definition+across+files
Andrey's Opinionated Emacs Guide http://m00natic.github.io/emacs/emacs-wiki.html

npm install -g eslint jshint csslint standard jscs js-beautify tern

The quality and the features vary wildly though – some modes like SLIME, cc-mode, js2-mode and cperl-mode are nothing short of magical and others provide only basic highlighting and indentation support.

Nano ~./.spacemacs
add javascript to the existing dotspacemacs-configuration-layers list in this file.
put in the bottom into user config: (setq tern-command '("node" "/home/hoertlehner/Documents/tern"))
Tern definition requires ./tern-project file


Beautify Code
SPC m =	beautify code in js2-mode, json-mode, web-mode, and css-mode (indent spaces correctly)
SPC m z e	toggle hide/show element
SPC m z F	toggle hide functions

http://spacemacs.org/layers/+lang/javascript/README.html
Contains:
Tern (autocomplete)
js2-refactor (refactoring), 


SPC m w	toggle js2-mode warnings and errors






/*jshint esversion: 6 */

SPC t s		toggle syntaxcheck    each file that should be syntax checked has to be enabled first!
SPC e v 	error - verify setup
SPC e 		errors
npm install gjslinter
npm install grunt-gjslint --save-dev
git clone https://github.com/google/closure-linter.git
cd closure-linter && python ./setup.py install


M-x package-install  ->  web-beautify
M-X beautify

npm install -g tern
M-x package-install tern
M-x package-install tern-auto-complete
https://truongtx.me/2014/04/20/emacs-javascript-completion-and-refactoring

repl with js-comit





python
Emacs python-mode of course, which is the most fundamental tool to use
Pymacs is a beautiful library written to allow two way communications between elisp and python. It offers a method to extend emacs using python, and allows modules from either language to be loaded through the other. It comes in handy if you're the kind of person who's always wanted to extend emacs to do something, but never wanted to get into elisp.
Which brings me to Ropemacs - the Rope python refactoring library integrated into emacs that uses pymacs to do so. Excellent stuff.
yasnippet - a snippets library that allows for inplace expansion of code, and other goodness. Check out the python demo on Youtube, linked from the google code page for the project.
Of course, there's ECB - Emacs Code Browser, which I think is a bit superior to the vim equivalent that I've used (NERDTree).
There's git.el which will integrate git into your buffer, allowing for easy diffs, comparisons, commits et al. I think there's also psvn.el to do the same with SVN.
There's Autcomplete.el which allows for auto completion in any language
pyflakes - a lint like tool for Python
Jedi for autocompletion: Jedi - an awesome autocompletion library for Python.
If you enjoy writing tests I would suggest Nose (Installation and quick start) and nosetests.el. This is very cool because you can set up a keybinding to run the tests and outputs the results in a separate buffer so you never have to leave Emacs.

Ipython-notebook  layer:CestDiego
