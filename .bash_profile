if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
exec ~/.local/bin/wrappedhl
fi
