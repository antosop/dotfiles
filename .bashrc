alias ss="start src/*.sln"
alias role="whoami -groups -fo list | grep -i"
alias ll="ls -l"
alias bake="bundle exec rake"

hgarb() {
	hg rebase -s "first((::$1) - (::(head() - $1)))" -d "(head() - $1)"
}

PHANTOMJS_BIN="/c/Projects_Lacra/one-exchange/node_modules/phantomjs/bin/phantomjs"
export PHANTOMJS_BIN
FIREFOX_BIN="/c/Program Files (x86)/Mozilla Firefox/firefox.exe"
export FIREFOX_BIN
CHROME_BIN="/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"
export CHROME_BIN
export PATH="/c/GoProjects/bin:/c/Program Files (x86)/Vim/vim74:/c/Program Files (x86)/ctags58:$PATH"
export GOPATH="/c/GoProjects"
export GOBIN="/c/Go/bin"
