#!/bin/sh
# Public domain.  Simone Basso <bassosimone@gmail.com>

test -f turin.json || bunzip2 -c turin.json.bz2 > turin.json

test -f table.tex || ./hist_stats.py turin.json > table.tex

test -f turin-latency.pdf || ./hist_plot.py -C \
  -D '/AS30722 Vodafone N.V./speedtest/latency' \
  -D '/AS1267 Infostrada S.p.A./speedtest/latency' \
  -D '/AS12874 Fastweb SpA/speedtest/latency' \
  -D '/AS3269 Telecom Italia S.p.a./speedtest/latency' \
  -N -F ms -L 0 -n 10000 -S -U 400 \
  -T 'Cumulative request-response latency distribution' \
  -Y Frequency -X 'Request-response latency [ms]' \
  -o turin-latency.pdf \
  turin.json

test -f turin-dload.pdf || ./hist_plot.py -C \
  -D '/AS30722 Vodafone N.V./speedtest/download_speed' \
  -D '/AS1267 Infostrada S.p.A./speedtest/download_speed' \
  -D '/AS12874 Fastweb SpA/speedtest/download_speed' \
  -D '/AS3269 Telecom Italia S.p.a./speedtest/download_speed' \
  -N -F Mbit/s -L 0 -n 10000 -S -U 20 \
  -T 'Cumulative download goodput distribution' \
  -Y Frequency -X 'Download goodput [Mbit/s]' \
  -o turin-dload.pdf \
  turin.json

test -f turin-bdp.pdf || ./hist_plot.py -C \
  -D '/AS30722 Vodafone N.V./speedtest/download_wnd' \
  -D '/AS1267 Infostrada S.p.A./speedtest/download_wnd' \
  -D '/AS12874 Fastweb SpA/speedtest/download_wnd' \
  -D '/AS3269 Telecom Italia S.p.a./speedtest/download_wnd' \
  -N -F KByte -L 0 -n 10000 -S -U 512 \
  -T 'Cumulative download bandwidth-delay product distribution' \
  -Y Frequency -X 'Download bandwidth-delay product [KByte]' \
  -o turin-bdp.pdf \
  turin.json

test -f turin-upload.pdf || ./hist_plot.py -C \
  -D '/AS30722 Vodafone N.V./speedtest/upload_speed' \
  -D '/AS1267 Infostrada S.p.A./speedtest/upload_speed' \
  -D '/AS12874 Fastweb SpA/speedtest/upload_speed' \
  -D '/AS3269 Telecom Italia S.p.a./speedtest/upload_speed' \
  -N -F Kbit/s -L 0 -n 10000 -S -U 2000 \
  -T 'Cumulative upload goodput distribution' \
  -Y Frequency -X 'Upload goodput [Kbit/s]' \
  -o turin-upload.pdf \
  turin.json
