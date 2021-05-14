# RDS Best Practice Benchmark

This profile is a collection of best practice test for RDS instances. 
This is an opionated list, but most values have the option of being set in 
the `input.yml` file.

## Usage

Update the `inputs.yml` so we know which RDS instance to run against:

``` bash
cd rds
inspec exec . -t aws://  --input-file=inputs.yml
```
