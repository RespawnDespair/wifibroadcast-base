LDFLAGS=-lrt -lpcap -lwiringPi
CPPFLAGS=-Wall -D _GNU_SOURCE

all: rx_rc_telemetry_buf rx rx_rc_telemetry rssirx rssitx tx_rawsock tx_telemetry tx_measure rx_status tracker rssilogger syslogger channelscan check_alive rssi_forward wifiscan wifibackgroundscan sharedmem_init_rx sharedmem_init_tx

%.o: %.c
	$(CC) -c -o $@ $< $(CPPFLAGS)


rx: rx.o lib.o radiotap.o fec.o
	$(CC) -o $@ $^ $(LDFLAGS)

rx_rc_telemetry: rx_rc_telemetry.o lib.o radiotap.o
	$(CC) -o $@ $^ $(LDFLAGS)

rx_rc_telemetry_buf: rx_rc_telemetry_buf.o lib.o radiotap.o
	$(CC) -o $@ $^ $(LDFLAGS)

rssirx: rssirx.o lib.o radiotap.o
	$(CC) -o $@ $^ $(LDFLAGS)

rssitx: rssitx.o lib.o radiotap.o
	$(CC) -o $@ $^ $(LDFLAGS)



tx_rawsock: tx_rawsock.o lib.o fec.o
	$(CC) -o $@ $^ $(LDFLAGS)

tx_telemetry: tx_telemetry.o lib.o fec.o
	$(CC) -o $@ $^ $(LDFLAGS)

tx_measure: tx_measure.o lib.o fec.o
	$(CC) -o $@ $^ $(LDFLAGS)

rx_status: rx_status.o
	$(CC) -o $@ $^ $(LDFLAGS)

tracker: tracker.o
	$(CC) -o $@ $^ $(LDFLAGS)

rssilogger: rssilogger.o
	$(CC) -o $@ $^ $(LDFLAGS)

syslogger: syslogger.o
	$(CC) -o $@ $^ $(LDFLAGS)

channelscan: channelscan.o
	$(CC) -o $@ $^ $(LDFLAGS)

check_alive: check_alive.o
	$(CC) -o $@ $^ $(LDFLAGS)

rssi_forward: rssi_forward.o
	$(CC) -o $@ $^ $(LDFLAGS)

wifiscan: wifiscan.o radiotap.o
	$(CC) -o $@ $^ $(LDFLAGS)

wifibackgroundscan: wifibackgroundscan.o radiotap.o
	$(CC) -o $@ $^ $(LDFLAGS)

sharedmem_init_rx: sharedmem_init_rx.o lib.o
	$(CC) -o $@ $^ $(LDFLAGS)

sharedmem_init_tx: sharedmem_init_tx.o lib.o
	$(CC) -o $@ $^ $(LDFLAGS)

clean:
	rm -f rx_rc_telemetry_buf rx rx_rc_telemetry rssirx rssitx tx_rawsock tx_telemetry tx_measure rx_status tracker rssilogger syslogger channelscan check_alive rssi_forward wifiscan wifibackgroundscan sharedmem_init_rx sharedmem_init_tx *~ *.o
