I am NeoCSVBenchmark.

| benchmark |
benchmark := NeoCSVBenchmark new.
benchmark cleanup.
[ benchmark write1 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
[ benchmark read0 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
[ benchmark read1 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
benchmark cleanup.
[ benchmark write2 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
benchmark cleanup.
[ benchmark write3 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
benchmark cleanup.
[ benchmark write4 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
benchmark cleanup.
[ benchmark write5 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
[ benchmark read2 ] timeToRun.

| benchmark |
benchmark := NeoCSVBenchmark new.
[ benchmark read3 ] timeToRun.

