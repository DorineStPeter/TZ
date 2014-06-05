install: tz_ui-fr.mo
	install tz tz_ui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat tz.services`" /etc/services || cat tz.services >> /etc/services
	install tz.xinetd /etc/xinetd.d/calc
	ln -sf /usr/local/bin/tz_ui /usr/local/bin/ntz_ui
	install tz_ui-fr.mo /usr/share/locale/fr/LC_MESSAGES/tz_ui.mo

tz_ui.pot: tz_ui
	xgettext -o tz_ui.pot -L Shell tz_ui

tz_ui-ru.mo: tz_ui-ru.po
	msgfmt -o tz_ui-ru.mo tz_ui-ru.po

clone:
	https://github.com/DorineStPeter/TZ.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
