Bombarding http://localhost:2000 for 10s using 125 connection(s)
[=======================================================================================================================================================================================================================================] 10s
Done!
Statistics        Avg      Stdev        Max
  Reqs/sec      3769.20     606.68    5617.29
  Latency       33.04ms     5.58ms    98.19ms
  HTTP codes:
    1xx - 0, 2xx - 37840, 3xx - 0, 4xx - 0, 5xx - 0
    others - 6
  Errors:
    the server closed connection before returning the first response byte. Make sure the server returns 'Connection: close' response header before closing the connection - 5
    error when reading response headers: cannot parse response status code: unexpected first char found. Expecting 0-9. Response "Connection: close\n". Buffer size=18, contents: "Connection: close\n" - 1
  Throughput:     2.39MB/s
