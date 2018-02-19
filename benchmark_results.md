* Without threads
  Bombarding http://localhost:2000 with 100000 request(s) using 250 connection(s)
   100000 / 100000 [============================================================================================================================================================================================================] 100.00% 1m18s
  Done!
  Statistics        Avg      Stdev        Max
    Reqs/sec      1276.09    2467.84   10504.16
    Latency      133.74ms      1.99s      1.17m
    HTTP codes:
      1xx - 0, 2xx - 99913, 3xx - 0, 4xx - 0, 5xx - 0
      others - 87
    Errors:
      the server closed connection before returning the first response byte. Make sure the server returns 'Connection: close' response header before closing the connection - 87

* With threads
Bombarding http://localhost:2000 with 100000 request(s) using 250 connection(s)
 100000 / 100000 [==============================================================================================================================================================================================================] 100.00% 28s
Done!
Statistics        Avg      Stdev        Max
  Reqs/sec      3572.58     857.40    6445.78
  Latency       60.30ms   362.48ms     27.98s
  HTTP codes:
    1xx - 0, 2xx - 99996, 3xx - 0, 4xx - 0, 5xx - 0
    others - 4
  Errors:
    the server closed connection before returning the first response byte. Make sure the server returns 'Connection: close' response header before closing the connection - 4
  Throughput:     2.20MB/s
Bombarding http://localhost:2000 with 100000 request(s) using 1000 connection(s)
 100000 / 100000 [=============================================================================================================================================================================================================] 100.00% 1m7s
Done!
Statistics        Avg      Stdev        Max
  Reqs/sec      1484.27    1452.49    9030.40
  Latency      312.41ms      2.13s      1.11m
  HTTP codes:
    1xx - 0, 2xx - 99988, 3xx - 0, 4xx - 0, 5xx - 0
    others - 12
  Errors:
    the server closed connection before returning the first response byte. Make sure the server returns 'Connection: close' response header before closing the connection - 12
  Throughput:     0.91MB/s
* With threads and html caching
Bombarding http://localhost:2000 with 100000 request(s) using 250 connection(s)
 100000 / 100000 [==============================================================================================================================================================================================================] 100.00% 21s
Done!
Statistics        Avg      Stdev        Max
  Reqs/sec      4630.31     929.11    7685.16
  Latency       51.17ms   193.94ms      7.16s
  HTTP codes:
    1xx - 0, 2xx - 99994, 3xx - 0, 4xx - 0, 5xx - 0
    others - 6
  Errors:
    the server closed connection before returning the first response byte. Make sure the server returns 'Connection: close' response header before closing the connection - 6
  Throughput:     2.86MB/s
Bombarding http://localhost:2000 with 100000 request(s) using 1000 connection(s)
 100000 / 100000 [==============================================================================================================================================================================================================] 100.00% 28s
Done!
Statistics        Avg      Stdev        Max
  Reqs/sec      3550.44    1440.84   11973.14
  Latency      212.86ms      0.89s     17.03s
  HTTP codes:
    1xx - 0, 2xx - 99994, 3xx - 0, 4xx - 0, 5xx - 0
    others - 6
  Errors:
    the server closed connection before returning the first response byte. Make sure the server returns 'Connection: close' response header before closing the connection - 6
  Throughput:     2.18MB/s
