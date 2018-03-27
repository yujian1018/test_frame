DATE=`date +%F_%H_%M`

co:
	./rebar co


rar:
	tar -zcf test_frame_$(DATE).tar.gz etc/conf test_frame/ebin/ libs/*/ebin Makefile


all:
	rm -rf libs/*/ebin
	rm -rf libs/*/.rebar/

	(cd libs/common;make all)
	(cd test_frame;make all)

st:
	erl -args_file etc/conf/vm.args -config etc/conf/sys -name t@127.0.0.1