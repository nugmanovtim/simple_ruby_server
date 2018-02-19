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
  Bombarding http://localhost:2000 with 100000 request(s) using 1000 connection(s)
   100000 / 100000 [==============================================================================================================================================================================================================] 100.00% 52s
  Done!
  Statistics        Avg      Stdev        Max
    Reqs/sec      1909.32    1932.91   10535.35
    Latency      260.62ms      2.19s      0.88m
    HTTP codes:
      1xx - 0, 2xx - 99932, 3xx - 0, 4xx - 0, 5xx - 0
      others - 68
    Errors:
      the server closed connection before returning the first response byte. Make sure the server returns 'Connection: close' response header before closing the connection - 68
    Throughput:     1.20MB/s
* With bypassing garbage collector
Bombarding http://localhost:2000 with 100000 request(s) using 1000 connection(s)
 100000 / 100000 [==============================================================================================================================================================================================================] 100.00% 44s
Done!
Statistics        Avg      Stdev        Max
  Reqs/sec      2242.61    1877.32   12176.84
  Latency      229.40ms      1.48s     44.82s
  HTTP codes:
    1xx - 0, 2xx - 99966, 3xx - 0, 4xx - 0, 5xx - 0
    others - 34
  Errors:
    the server closed connection before returning the first response byte. Make sure the server returns 'Connection: close' response header before closing the connection - 34
  Throughput:     1.41MB/s
Transactions:                   100000 hits
Availability:                   100.00 %
Elapsed time:                  94.29 secs
Document length:               305 Bytes
TotalTransfer:                 29.09 MB
Transaction rate:            1060.53 trans/sec
Throughput:                     0.31 MB/sec
Successful:                     100000 hits
Failed:                           0 hits
TransactionTime:             945.771 ms(mean)
ConnectionTime:              486.291 ms(mean)
ProcessTime:                 459.480 ms(mean)
StateCode:                    0(code 200)
* With taking advantage of Keep-Alive
Transactions:                   100000 hits
Availability:                   100.00 %
Elapsed time:                  18.07 secs
Document length:               328 Bytes
TotalTransfer:                 14.40 MB
Transaction rate:            5533.78 trans/sec
Throughput:                     0.80 MB/sec
Successful:                     100000 hits
Failed:                           0 hits
TransactionTime:             135.413 ms(mean)
ConnectionTime:                0.000 ms(mean)
ProcessTime:                 135.413 ms(mean)
StateCode:                    0(code 200)
