# AMS Benchmarking

## Benchmarks

### Comparison with other Serialization Libraries

```bash
cd benchmarks/serialization_libraries
bundle install
bundle exec ruby benchmark.rb
```

yields

```shell
bundle exec ruby benchmark.rb
-- create_table("comments", {:force=>:cascade})
-> 0.0128s
-- create_table("posts", {:force=>:cascade})
-> 0.0002s
-- create_table("users", {:force=>:cascade})
-> 0.0002s
Warming up --------------------------------------
ams                    3.000  i/100ms
jsonapi-rb             9.000  i/100ms
barley                 9.000  i/100ms
barley-cache         460.000  i/100ms
ams          eager     8.000  i/100ms
jsonapi-rb   eager    33.000  i/100ms
barley       eager    37.000  i/100ms
barley-cache eager    70.000  i/100ms
Calculating -------------------------------------
ams                    67.770  (± 1.9%) i/s -    657.000  in  10.042270s
jsonapi-rb            157.239  (± 2.3%) i/s -      1.521k in  10.010257s
barley                 96.909  (± 2.4%) i/s -    945.000  in  10.036316s
barley-cache            4.589k (± 2.8%) i/s -     44.620k in  10.010004s
ams          eager     68.237  (± 6.2%) i/s -    592.000  in  10.087602s
jsonapi-rb   eager    289.733  (± 3.7%) i/s -      2.805k in  10.033912s
barley       eager    406.732  (± 3.2%) i/s -      3.922k in  10.020076s
barley-cache eager    639.935  (± 2.4%) i/s -      6.300k in  10.053710s
with 95.0% confidence

Comparison:
barley-cache      :     4589.3 i/s
barley-cache eager:      639.9 i/s - 7.17x  (± 0.27) slower
barley       eager:      406.7 i/s - 11.29x  (± 0.49) slower
jsonapi-rb   eager:      289.7 i/s - 15.83x  (± 0.74) slower
jsonapi-rb        :      157.2 i/s - 29.17x  (± 1.08) slower
barley            :       96.9 i/s - 47.37x  (± 1.75) slower
ams          eager:       68.2 i/s - 67.25x  (± 4.69) slower
ams               :       67.8 i/s - 67.72x  (± 2.31) slower
with 95.0% confidence

Calculating -------------------------------------
ams                    1.300M memsize (   246.338k retained)
16.838k objects (     2.492k retained)
50.000  strings (    50.000  retained)
jsonapi-rb           926.082k memsize (   197.338k retained)
9.565k objects (     1.776k retained)
50.000  strings (    50.000  retained)
barley                 1.102M memsize (   177.490k retained)
12.930k objects (     1.876k retained)
50.000  strings (    35.000  retained)
barley-cache          46.090k memsize (     1.308k retained)
502.000  objects (    17.000  retained)
42.000  strings (     6.000  retained)
ams          eager     1.068M memsize (   233.994k retained)
13.723k objects (     2.308k retained)
50.000  strings (    50.000  retained)
jsonapi-rb   eager   694.430k memsize (   194.826k retained)
6.450k objects (     1.651k retained)
50.000  strings (    50.000  retained)
barley       eager   354.326k memsize (   124.282k retained)
3.694k objects (     1.208k retained)
50.000  strings (    32.000  retained)
barley-cache eager   216.790k memsize (   107.228k retained)
2.376k objects (   956.000  retained)
50.000  strings (    33.000  retained)

Comparison:
barley-cache      :      46090 allocated
barley-cache eager:     216790 allocated - 4.70x more
barley       eager:     354326 allocated - 7.69x more
jsonapi-rb   eager:     694430 allocated - 15.07x more
jsonapi-rb        :     926082 allocated - 20.09x more
ams          eager:    1068038 allocated - 23.17x more
barley            :    1102354 allocated - 23.92x more
ams               :    1299674 allocated - 28.20x more
```


## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)
