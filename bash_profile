#
# ~/.bash_profile
#

export mqtt_passwd="arch3"
export pihole_hash="a1a6bb65b2c07f9bc39b39266758bf1c90abcf813f80c090bbac1b2cf357d121"
#Enable numpad on login
# setleds -D +num

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - bash)"
export PATH="$PATH:/home/bs/.cargo/bin"
[[ -f ~/.bashrc ]] && . ~/.bashrc
